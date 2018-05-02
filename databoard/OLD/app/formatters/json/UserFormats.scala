package formatters.json

import play.api.libs.json._
import play.api.libs.functional.syntax._
import com.mohiva.play.silhouette.api.LoginInfo
//import models.authorizations._
import models._

/**
 * This object contains all format for User class
 */
object UserFormats {

  val restFormat = {
    implicit val baseInfoFormat = formatters.BaseInfoFormats.restFormat

    val reader = (
      (__ \ "id").read[String] ~
      (__ \ "loginInfo").read[LoginInfo] ~
      //(__ \ "socials").readNullable(Reads.seq[LoginInfo]) ~
      (__ \ "email").readNullable(Reads.email) ~
      (__ \ "username").readNullable[String] ~
      (__ \ "avatarUrl").readNullable[String] ~
      (__ \ "info").read[BaseInfo2]// ~
      //(__ \ "roles").readNullable(Reads.set[String])
    //  .map { case Some(r) => r.map(Role.apply) case None => Set[Role](SimpleUser) })
    )(User2.apply _)

    val writer = (
      (__ \ "id").write[String] ~
      (__ \ "loginInfo").write[LoginInfo] ~
      //(__ \ "socials").writeNullable(Writes.seq[LoginInfo]) ~
      (__ \ "email").writeNullable[String] ~
      (__ \ "username").writeNullable[String] ~
      (__ \ "avatarUrl").writeNullable[String] ~
      (__ \ "info").write[BaseInfo2]// ~
      //(__ \ "roles").write(Writes.set[String])
      //.contramap[Set[Role]](_.map(_.name)))
      )(unlift(User2.unapply _))

    Format(reader, writer)
  }

}
