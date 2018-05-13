package api_schemas

import models.DAO._
import controllers._
import sangria.schema._
import sangria.marshalling._
import scala.concurrent.Future
import models.User2
import models.DAO.resources._
import scala.concurrent.ExecutionContext.Implicits._
import models.DAO._
import models.DAO.sessions._
import main.scala.bprocesses.BPSession
import org.joda.time._
import scala.util.{Try, Success, Failure}
import sangria.validation.{ValueCoercionViolation, IntCoercionViolation, BigIntCoercionViolation}
import org.joda.time.format._
import sangria._
import models.DAO.BProcessDTO
import models.DAO.BPDAO
import models.DAO._
import models.DAO.resources._
import models.DAO.CompositeValues
import play.api.Play.current
import main.scala.bprocesses.BPSession
import models.DAO.reflect._
import main.scala.bprocesses.refs._
import main.scala.bprocesses.refs.{BPStateRef}
import models.DAO.conversion._
import sangria._
import models.DAO.reflect._
import controllers._
import controllers.users._
import minority.utils._



object ProcessesSchema {
  val DateTimeType = DateHelper.DateTimeType
  val EntitySchema = PeoplesSchema.EntitySchema
  val Elements = ElementsSchema.Elements
  val Launches = LaunchesSchema.Launches

  def findEntitiesElRes(costs:List[ElementResourceDTO]):List[Entity] = SchemaDefinition.findEntitiesElRes(costs)


lazy val ElementResourceDTOSchema = ObjectType("ElementResources", "ElementResource",
  fields[CharacterRepo, ElementResourceDTO](
    Field("id", IntType,
      resolve = ctx => ctx.value.id.getOrElse(-1)),
    Field("element_id", IntType,
      resolve = ctx => ctx.value.element_id),
    Field("process_id", IntType,
      resolve = ctx => ctx.value.process_id),
    Field("resource_id", IntType,
      resolve = ctx => ctx.value.resource_id),
    Field("entities", StringType,
      resolve = ctx => ctx.value.entities),
    Field("created_at", OptionType(DateHelper.DateTimeType),
      resolve = ctx => ctx.value.created_at),
    Field("updated_at", OptionType(DateHelper.DateTimeType),
      resolve = ctx => ctx.value.updated_at)
  )
)



lazy val ElementResourceContainerSchema = ObjectType("ElementResourcesContainer", "ElementResourceContainer",
    fields[CharacterRepo, ElementResourceContainer](
      Field("obj", ElementResourceDTOSchema, 
        resolve = ctx => ctx.value.obj
      ),
      Field("entities", ListType(EntitySchema),
        resolve = ctx => ctx.value.entities
      )
      // case class ElementResourceContainer(obj: ElementResourceDTO, entities: List[Entity])
))


  val BProcess = ObjectType(
    "BProcessDTO",
    "A mechanical creature in the Star Wars universe.",
    fields[CharacterRepo, BProcessDTO](
      Field("id", IntType,
        Some("The id of the droid."),
        resolve = _.value.id.getOrElse(0)),
      Field("title", StringType,
        Some("The name of the droid."),
        resolve = _.value.title.toString),

        Field("service", IntType,
          Some("The name of the droid."),
          resolve = _.value.service),
        Field("business", IntType,
          Some("The name of the droid."),
          resolve = _.value.business),
        Field("created_at", OptionType(DateTimeType),
          Some("The name of the droid."),
          resolve = _.value.created_at),
        Field("updated_at", OptionType(DateTimeType),
          Some("The name of the droid."),
          resolve = _.value.updated_at),
        Field("version", LongType,
          Some("The name of the droid."),
          resolve = _.value.version),
        Field("elem_length", LongType,
          Some("The name of the droid."),
          resolve = _.value.version),



        Field("cost_assign", ListType(ElementResourceContainerSchema),
          arguments = Nil,
          resolve = ctx => {
            val user = ctx.ctx.user.get
            //  /data/cost/assigns/130
            // CostFillController.assigns(process_id: Int) = silhouette.SecuredAction { implicit request =>
            var (isManager, isEmployee, lang) = models.AccountsDAO.getRolesAndLang(user.emailFilled).get
            val processId:Int = ctx.value.id.getOrElse(0) //ctx arg ProcessIdArg
            val assigns = ElementResourceDAO.getByProcess( processId ).map { obj =>
                ElementResourceContainer(obj, findEntitiesElRes(List(obj)) )
            }
            assigns
        }),

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

        Field("elements", ListType(Elements),
          Some("The friends of the human, or an empty list if they have none."),
          resolve = (ctx) => {
            
/*
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, id)) {
      val frontElements = ProcElemDAO.findByBPId(id)
      val frontElementsWithTopos = decorateProcElementsToJson(frontElements)
        Ok(Json.toJson( frontElementsWithTopos) )
    } else { Forbidden(Json.obj("status" -> "Access denied")) }            
*/

            BPSessionDAOF.findByProcesses(ctx.ctx.ids.get("processes").get.toSeq ).map { launches =>
              //ctx.ctx.ids = ctx.ctx.ids ++ Map("launches" -> launches.toList.map { i => i.id.get })
              launches

              List()
            }
            //Future.successful(Seq() )
          }),

        Field("space_elements", ListType(Elements),
          Some("The friends of the human, or an empty list if they have none."),
          resolve = (ctx) => {
            BPSessionDAOF.findByProcesses(ctx.ctx.ids.get("processes").get.toSeq ).map { launches =>
              //ctx.ctx.ids = ctx.ctx.ids ++ Map("launches" -> launches.toList.map { i => i.id.get })
              launches
              List()
            }
            //Future.successful(Seq() )
          }),

        Field("spaces", ListType(Elements),
          Some("The friends of the human, or an empty list if they have none."),
          resolve = (ctx) => {
            BPSessionDAOF.findByProcesses(ctx.ctx.ids.get("processes").get.toSeq ).map { launches =>
              //ctx.ctx.ids = ctx.ctx.ids ++ Map("launches" -> launches.toList.map { i => i.id.get })
              launches
              List()
            }
            //Future.successful(Seq() )
          }),        



        Field("perms", ListType(Elements),
          Some("The friends of the human, or an empty list if they have none."),
          resolve = (ctx) => {
            BPSessionDAOF.findByProcesses(ctx.ctx.ids.get("processes").get.toSeq ).map { launches =>
              //ctx.ctx.ids = ctx.ctx.ids ++ Map("launches" -> launches.toList.map { i => i.id.get })
              launches
              List()
            }
            //Future.successful(Seq() )
          }),
        Field("reaction", ListType(Elements),
          Some("The friends of the human, or an empty list if they have none."),
          resolve = (ctx) => {
            BPSessionDAOF.findByProcesses(ctx.ctx.ids.get("processes").get.toSeq ).map { launches =>
              //ctx.ctx.ids = ctx.ctx.ids ++ Map("launches" -> launches.toList.map { i => i.id.get })
              launches
              List()
            }
            //Future.successful(Seq() )
          }),

        Field("state_machine_type", StringType,
          Some("The name of the droid."),
          resolve = _.value.state_machine_type),

        Field("launches", ListType(Launches),
          Some("The friends of the human, or an empty list if they have none."),
          resolve = (ctx) => {
            BPSessionDAOF.findByProcesses(ctx.ctx.ids.get("processes").get.toSeq ).map { launches =>
              ctx.ctx.ids = ctx.ctx.ids ++ Map("launches" -> launches.toList.map { i => i.id.get })
              launches
            }
            //Future.successful(Seq() )
          })

    ))
}