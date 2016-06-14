package controllers
import play.api._
import play.api.mvc._
import play.twirl.api.Html

//{Action, Controller}
import play.api.http.MimeTypes
import play.api.libs.json._
import play.api.cache._

import views._
import models.User
import java.util.UUID._
import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import models.DAO.resources._
import org.joda.time.DateTime
import models.DAO._

import models.DAO.resources.web.BizFormDTO

/**
 * Created by Sobolev on 22.07.2014.
 */
case class ObserveSetup(emails: List[String], observer: ObserverDTO)

case class NestedTreeLeaf(leaf: SpaceElementDTO, active: Boolean, space_id: Int, nodes: List[NestedTreeLeaf])
case class TreeLeaf(leaf: UndefElement, active: Boolean, nodes: List[NestedTreeLeaf])
case class Tree(leaf: TreeLeaf, active: Int = 0)

import javax.inject.Inject

import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

import play.api.mvc.{ Action, RequestHeader }

class ObserverController @Inject() (
  val messagesApi: MessagesApi,
  val env: Environment[User2, CookieAuthenticator],
  socialProviderRegistry: SocialProviderRegistry)
  extends Silhouette[User2, CookieAuthenticator] {
  import play.api.Play.current
  implicit val ObserverDTOReads = Json.reads[ObserverDTO]
  implicit val ObserverDTOWrites = Json.format[ObserverDTO]
  implicit val stationReads = Json.reads[BPStationDTO]
  implicit val stationWrites = Json.format[BPStationDTO]
  implicit val ObserveSetupReads = Json.reads[ObserveSetup]
  implicit val ObserveSetupWrites = Json.format[ObserveSetup]


  def index(process: Int) = SecuredAction { implicit request =>
        val observers = ObserverDAO.getAllByBP(process)
        Ok(Json.toJson(observers))
  }
  def indexStation(process: Int, station: Int) = SecuredAction { implicit request =>

        val observers = ObserverDAO.getByBpAndStation(process, station)
        Ok(Json.toJson(observers))

  }

  def show(hash_code: String) = Action { implicit request =>


  	  val observer:play.api.mvc.Result = ObserverDAO.getByHashCode(hash_code) match {
  	  	case Some(obs) => {

          //val business_info = BizFormDTO(biz.title, biz.phone, biz.website)

          val station = BPStationDAO.findById(obs.station_id)

  	  		station match {
             case Some(st) => {
                val proc = BPDAO.get(st.process)

                val last_log = BPLoggerDAOF.findByStation(st.id.get).last
                val active_elem:Map[String, Int] = if (last_log.element.isDefined) Map("front" -> last_log.element.get) else Map("nested" -> last_log.space_elem.get)


                val biz = BusinessDAO.get(proc.get.business).get
                val biz_sup = BizFormDTO(biz.title, biz.phone, biz.website, biz.country, biz.city, biz.address)

                Ok(views.html.businesses.observe( makeTree(proc.get.id.get, active_elem), proc.get, st, active_elem, biz_sup ))

             }
             case _ => BadRequest("Station not found")
            }
  	  	}
        case _ => BadRequest("Not found")
  	  }
      observer
  }

  def create() = SecuredAction(BodyParsers.parse.json) { implicit request =>
     val host = request.host
     val uuid = randomUUID.toString
     val user = request.identity.emailFilled
     val biz =  request.identity.businessFirst
	  request.body.validate[ObserveSetup].map{
	    case entity => savePull( entity.observer.copy(hash_code = Some(uuid), created_at = Some(DateTime.now()) ), user ) match {
	            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not create observer ${entity.observer.id}")))
	            case id =>  {
                addAsClient(entity.emails, biz)
	              sendMailToObservers(entity.emails.take(3), host, uuid) // Limit emails, that are sended to observers down to 3
	              Ok(Json.toJson(Map("success" ->  id)))
	            }
	          }
	    }.recoverTotal{
	      e => BadRequest("formWithErrors")
	    }
  }

  def destroy(observe_id: Int) = SecuredAction { implicit request =>

      // Access check
      val user = request.identity.emailFilled
      val access = ObserverDAO.get(observe_id) match {
        case Some(observe) => BPDAO.get(observe.bprocess) match {
          case Some(bp) => EmployeesBusinessDAO.isEmployable(bp.business, user)
          case _ => false
        }
        case _ => false
      }


      if (access) {
        ObserverDAO.delete(observe_id) match {
          case 0 =>  Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
          case x =>  Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
        }
      } else {
        Ok(Json.toJson(Map("failure" -> "Access Denied")))
      }
  }

  private def addAsClient(emails: List[String], business_id: Int) = {
    emails.foreach(email => ClientBusinessDAO.addAsClient(email, business_id) )
  }

  private def makeTree(bp: Int, active_elem: Map[String, Int]):List[TreeLeaf] = {
      val procelem = ProcElemDAO.findByBPId(bp)
      val spaces = BPSpaceDAOF.findByBPIdB(bp)
      val spaceelem = SpaceElemDAO.findByBPId(bp)

      def isActive(id: Int, eltype: String):Boolean = {
        if (eltype == "front") {
          active_elem.get("front") == Some(id)
        }
        else {
          active_elem.get("nested") == Some(id)
        }
      }



      // TODO: Change to pattern matching

      def checkNodes(nodes: List[SpaceElementDTO], active_elem: Map[String, Int]):List[NestedTreeLeaf] = {
        nodes.map { node =>
          if (node.space_own.isDefined) {
            val nodes = spaceelem.filter(el => Some(el.space_owned) == Some(node.space_owned))
            NestedTreeLeaf(node, isActive(node.id.get, "nested"), node.space_owned, checkNodes(nodes, active_elem))
          } else {
            NestedTreeLeaf(node, isActive(node.id.get, "nested"), node.space_owned, List())
          }
        }
      }

      // case class NestedTreeLeaf(leaf: SpaceElementDTO, space_id: Int, nodes: List[SpaceElementDTO])
      // case class TreeLeaf(leaf: UndefElement, nodes: List[NestedTreeLeaf])
      val maked_tree = procelem.map { proc_elem =>
        if (proc_elem.space_own.isDefined) {
          val nodes = spaceelem.filter(el => Some(el.space_owned) == proc_elem.space_own)
          TreeLeaf(proc_elem, isActive(proc_elem.id.get, "front"), checkNodes(nodes, active_elem))
        } else {
           TreeLeaf(proc_elem, isActive(proc_elem.id.get, "front"), List())
        }
      }
      maked_tree

  }


  private def savePull(observe: ObserverDTO, user: String) = {
    val access = BPDAO.get(observe.bprocess) match {
          case Some(bp) => EmployeesBusinessDAO.isEmployable(bp.business, user)
          case _ => false
        }
    if (access) {
      ObserverDAO.pull_object( observe )
    } else {
      -1
    }
  }

  private def sendMailToObservers(emails: List[String], host: String, hash_code: String) = {
    //emails.foreach(email =>

      // CustomRegistration.handleObserver(email, host, hash_code)

    //)
  }

  /*

  TODO ObserveClient integration

  */

}
