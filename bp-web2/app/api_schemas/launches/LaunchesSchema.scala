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


object LaunchesSchema {


val DateTimeType = DateHelper.DateTimeType


val LaunchElementStates = ObjectType("LaunchElementStates", "LaunchElementState.",
   fields[CharacterRepo, BProcessDTO](
      Field("id", IntType,
        Some("The id of the droid."),
        resolve = _.value.id.getOrElse(0))
  )
)


val LaunchElements = ObjectType("LaunchElements", "LaunchElement.",
   fields[CharacterRepo, BProcessDTO](
      Field("id", IntType,
        Some("The id of the droid."),
        resolve = _.value.id.getOrElse(0)),
       Field("topo_id", IntType,
        Some("The id of the droid."),
        resolve = _.value.id.getOrElse(0)),
      Field("states", ListType(LaunchElementStates),
        Some("The friends of the human, or an empty list if they have none."),
        resolve = (ctx) => {
          BPSessionDAOF.findByProcesses(ctx.ctx.ids.get("processes").get.toSeq ).map { launches =>
            //ctx.ctx.ids = ctx.ctx.ids ++ Map("launches" -> launches.toList.map { i => i.id.get })
            launches
            List()
          }
          //Future.successful(Seq() )
        })


  )
)
val LaunchInteracts = ObjectType("LaunchInteracts", "LaunchInteract.",
   fields[CharacterRepo, BProcessDTO](
      Field("id", IntType,
        Some("The id of the droid."),
        resolve = _.value.id.getOrElse(0))
  )
)




val LaunchStations = ObjectType("LaunchStations", "LaunchStation.",
/*
 def id            = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def process       = column[Int]("process_id")

  def state         = column[Boolean]("state")
  def step          = column[Int]("step")
  def space         = column[Int]("space")
  def container_step= column[List[Int]]("container_step")
  def expand_step   = column[List[Int]]("expand_step")
  def spaces_ids    = column[List[Int]]("spaces_ids")
  def started       = column[Boolean]("started")
  def finished      = column[Boolean]("finished")
  def inspace       = column[Boolean]("inspace")
  def incontainer   = column[Boolean]("incontainer")
  def inexpands     = column[Boolean]("inexpands")
  def paused        = column[Boolean]("paused")

  def note          = column[Option[String]]("note")
  def canceled      = column[Boolean]("canceled", O.Default(false))

  def created_at    = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at    = column[Option[org.joda.time.DateTime]]("updated_at")
  def session       = column[Int]("session_id")
  def front         = column[Boolean]("front")

*/


   fields[CharacterRepo, BPStationDTO](
      Field("id", IntType,
        Some("The id of the droid."),
        resolve = _.value.id.getOrElse(0))
  )
)


val LaunchLogs = ObjectType("LaunchLogs", "LaunchLog.",
   fields[CharacterRepo, BProcessDTO](
      Field("id", IntType,
        Some("The id of the droid."),
        resolve = _.value.id.getOrElse(0))
  )
)

val Launches = ObjectType(
      "Launches",
      "Launch.",
      fields[CharacterRepo, BPSession](
        Field("id", IntType,
          Some("The id of the Launch."),
          resolve = _.value.id.getOrElse(0)),
        Field("created_at", OptionType(DateTimeType),
          Some("The process of the Launch."),
          resolve = _.value.created_at),
        Field("updated_at", OptionType(DateTimeType),
          Some("The process of the Launch."),
          resolve = _.value.updated_at),
        Field("active_listed", BooleanType,
          Some("The process of the Launch."),
          resolve = _.value.active_listed),

        Field("logs", OptionType(ListType(LaunchLogs)),
          Some("The friends of the human, or an empty list if they have none."),
          resolve = (ctx) => {
            BPSessionDAOF.findByProcesses(ctx.ctx.ids.get("processes").get.toSeq ).map { launches =>
              //ctx.ctx.ids = ctx.ctx.ids ++ Map("launches" -> launches.toList.map { i => i.id.get })
              launches
              List()
            }
            //Future.successful(Seq() )
          }),
        Field("elements", ListType(LaunchElements),
          Some("The friends of the human, or an empty list if they have none."),
          resolve = (ctx) => {
            BPSessionDAOF.findByProcesses(ctx.ctx.ids.get("processes").get.toSeq ).map { launches =>
              //ctx.ctx.ids = ctx.ctx.ids ++ Map("launches" -> launches.toList.map { i => i.id.get })
              launches
              List()
            }
            //Future.successful(Seq() )
          }),
        Field("interacts", ListType(LaunchInteracts),
          Some("The friends of the human, or an empty list if they have none."),
          resolve = (ctx) => {
            BPSessionDAOF.findByProcesses(ctx.ctx.ids.get("processes").get.toSeq ).map { launches =>
              //ctx.ctx.ids = ctx.ctx.ids ++ Map("launches" -> launches.toList.map { i => i.id.get })
              launches
              List()
            }
            //Future.successful(Seq() )
          }),



        Field("station", ListType(LaunchStations),
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
