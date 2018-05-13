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


object ElementsSchema {

val EntitySchema = PeoplesSchema.EntitySchema
val DateTimeType = DateHelper.DateTimeType


val ElementStates = ObjectType("ElementStates", "ElementState.",
   fields[CharacterRepo, BProcessDTO](
      Field("id", IntType,
        Some("The id of the droid."),
        resolve = _.value.id.getOrElse(0))
  )
)

val ElementPerms = ObjectType("ElementPerms", "ElementPerm.",
   fields[CharacterRepo, BProcessDTO](
      Field("id", IntType,
        Some("The id of the droid."),
        resolve = _.value.id.getOrElse(0))
  )
)



val Elements = ObjectType(
    "Elements",
    "A mechanical creature in the Star Wars universe.",
    fields[CharacterRepo, BProcessDTO](
      Field("id", IntType,
        Some("The id of the droid."),
        resolve = _.value.id.getOrElse(0)),

       Field("topo_id", IntType,
        Some("The id of the droid."),
        resolve = _.value.id.getOrElse(0)),

      Field("states", ListType(ElementStates),
        Some("The friends of the human, or an empty list if they have none."),
        resolve = (ctx) => {
          BPSessionDAOF.findByProcesses(ctx.ctx.ids.get("processes").get.toSeq ).map { launches =>
            //ctx.ctx.ids = ctx.ctx.ids ++ Map("launches" -> launches.toList.map { i => i.id.get })
            launches
            List()
          }
          //Future.successful(Seq() )
        }),
      Field("perms", ListType(ElementPerms),
        Some("The friends of the human, or an empty list if they have none."),
        resolve = (ctx) => {
          BPSessionDAOF.findByProcesses(ctx.ctx.ids.get("processes").get.toSeq ).map { launches =>
            //ctx.ctx.ids = ctx.ctx.ids ++ Map("launches" -> launches.toList.map { i => i.id.get })
            launches
            List()
          }
          //Future.successful(Seq() )
        })


    ))
}