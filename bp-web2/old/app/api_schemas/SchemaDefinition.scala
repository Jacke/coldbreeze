/*
package api_schemas

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
import models.DAO.reflect._
import controllers._
import controllers.users._
import minority.utils._


import scala.concurrent._
import scala.concurrent.Future

/**
 * Defines a GraphQL schema for the current project
 */

case object UUIDCoercionViolation extends ValueCoercionViolation("UUID value expected")

object SchemaDefinition {

val DateTimeType = DateHelper.DateTimeType

def parseUUID(s: String) = Try(java.util.UUID.fromString(s)) match {
  case Success(date) ⇒ Right(date)
  case Failure(_) ⇒ Left(UUIDCoercionViolation)
}
val UUIDType = ScalarType[java.util.UUID]("UUID",
  coerceOutput = (d, caps) ⇒
    //if (caps.contains("")) UUID.randomUUID()
    //else 
    java.util.UUID.randomUUID(),
  coerceUserInput = {
    case s: String ⇒ parseUUID(s)
    case _ ⇒ Left(UUIDCoercionViolation)
  },
  coerceInput = {
    case ast.StringValue(s, _, _) ⇒ parseUUID(s)
    case _ ⇒ Left(UUIDCoercionViolation)
  })


val ProcessIdArg = Argument("process_id", IntType, description = "ProcessId")


/// launches


val Launches = LaunchesSchema.Launches
val LaunchElementStates = LaunchesSchema.LaunchElementStates
val LaunchElements = LaunchesSchema.LaunchElements
val LaunchInteracts = LaunchesSchema.LaunchInteracts
val LaunchStations = LaunchesSchema.LaunchStations
val LaunchLogs = LaunchesSchema.LaunchLogs

// Elements
val ElementStates = ElementsSchema.ElementStates
val ElementPerms = ElementsSchema.ElementPerms
val Elements = ElementsSchema.Elements


// Refs
val RefsSch = RefSchema.schema


// Peoples
val Employee = PeoplesSchema.Employee
val Group = PeoplesSchema.Group
val Account = PeoplesSchema.Account
val ParticipatorContainerSchema = PeoplesSchema.ParticipatorContainerSchema
val People = PeoplesSchema.People
val ResourceSchema = PeoplesSchema.ResourceSchema
val MetaTypeSchema = PeoplesSchema.MetaTypeSchema
val EntitySchema = PeoplesSchema.EntitySchema
val ResourceEntitySelectorSchema = PeoplesSchema.ResourceEntitySelectorSchema
val User2 = PeoplesSchema.User2

// Proceses
val ElementResourceDTOSchema = ProcessesSchema.ElementResourceDTOSchema
val ElementResourceContainerSchema = ProcessesSchema.ElementResourceContainerSchema
val BProcess = ProcessesSchema.BProcess


val Services = ObjectType("Services", "Service",
fields[CharacterRepo, BusinessServiceDTO](
  Field("id", IntType,
    Some("The id of the Service."),
    tags = ProjectionName("_id") :: Nil,
    resolve = ctx => Future.successful(ctx.value.id.getOrElse(-1)  )),
  Field("title", StringType,
    Some("The id of the droid."),
    resolve = ctx => Future.successful(ctx.value.title  )),
  Field("business_id", IntType,
    Some("The id of the droid."),
    resolve = ctx => Future.successful(ctx.value.business_id  )),
  Field("master_acc", StringType,
    Some("The id of the droid."),
    resolve = ctx => Future.successful(ctx.value.master_acc  )),

  Field("processes", ListType(BProcess),
    Some("The friends of the human, or an empty list if they have none."),
    resolve = (ctx) => {
      println(ctx.parentType)
      BPDAOF.getByServices(ctx.ctx.ids.get("services").get, None).map { processes =>
        ctx.ctx.ids = ctx.ctx.ids ++ Map("processes" -> processes.toList.map { i => i.id.get })
        processes
      }
    } )
))



val ID = Argument("id", StringType, description = "id of the character")

val Query = ObjectType(
    "Query", fields[CharacterRepo, Unit](
      //Field("hero", Character,
      //  arguments = EpisodeArg :: Nil,
      //  resolve = (ctx) => ctx.ctx.getHero(ctx.arg(EpisodeArg))),
      //Field("human", OptionType(Human),
      //  arguments = ID :: Nil,
      //  resolve = ctx => ctx.ctx.getHuman(ctx arg ID)),
      //Field("humans", ListType(Human),
      //  arguments = Nil,
      //  resolve = ctx => ctx.ctx.getHumans),

      Field("services", ListType(Services),
        arguments = Nil,
        resolve = ctx => {
          val services = ctx.ctx.getServices(ctx.ctx.user.get)
          ctx.ctx.ids = ctx.ctx.ids ++ Map("services" -> services.map { i => i.id.get })
          services
        }),

      Field("refs", ListType(RefsSch),
        arguments = Nil,
        resolve = ctx => {

            val refs = RefDAO.getAllVisible
            refs.map { ref =>
                val reactions = ReactionRefDAO.findByRef(ref.id.get)
                val reaction_outs = ReactionStateOutRefDAO.findByReactionRefs(reactions.map(_.id.get))
                val middlewares = MiddlewareRefsDAOF.await( MiddlewareRefsDAOF.getByRef(ref.id.get) )
                val middlewaresIds = middlewares.map(_.id.get).toList
                val strategies = MiddlewareRefsDAOF.await( StrategyRefsDAOF.getByMWS(middlewaresIds) )
                val strategiesIds = strategies.map(_.id.get).toList
                val bases = StrategyBaseRefsDAOF.await( StrategyBaseRefsDAOF.getByStrategies(strategiesIds) )
                val inputs = StrategyInputRefsDAOF.await( StrategyInputRefsDAOF.getByStrategies(strategiesIds) )
                val ouputs = StrategyInputRefsDAOF.await( StrategyOutputRefsDAOF.getByStrategies(strategiesIds) )


                models.DAO.reflect.RefContainer(ref,
                  ProcElemReflectionDAO.findByRef(ref.id.get),
                  SpaceReflectionDAO.findByRef(ref.id.get),
                  SpaceElementReflectionDAO.findByRef(ref.id.get),
                  ReflectElemTopologDAO.findByRef(ref.id.get),
                  BPStateRefDAO.findByRef(ref.id.get),
                  SwitcherRefDAO.findByRef(ref.id.get),
                  reactions,
                  reaction_outs,
                  reactions.map( re => ReactionContainer(re, reaction_outs.filter(out => out.reaction == re.id.get ))),

                  middlewares = middlewares,
                  strategies = strategies,
                  inputs = inputs,
                  bases = bases,
                  outputs = ouputs)

                  }
        }),



      Field("cost_collection", ListType(ResourceEntitySelectorSchema),
        arguments = Nil,
        resolve = ctx => {
          val user = ctx.ctx.user.get
          // CostFillController.assignResourceCollection
          var (isManager, isEmployee, lang) = models.AccountsDAO.getRolesAndLang(user.emailFilled).get
          val resources = ResourceDAO.findByBusinessId(user.businessFirst)
          //Future[List[ResourceEntitySelector]] = 
          BBoardWrapper().getEntityByResources(resources)
      }),

      Field("participators", ListType(ParticipatorContainerSchema),
        arguments = Nil,
        resolve = ctx => {
           val userObj = ctx.ctx.user.get
           val user                        = userObj.emailFilled
           val business                    = userObj.businessFirst
           val employeesF                  = models.DAO.resources.EmployeeDAOF.getAllByWorkbench(business)
           employeesF.map { employees =>
             val employeesList = employees.toList
             val creds:List[models.daos.DBUser]      =  models.AccountsDAO.findAllByEmails(employeesList.map(_.master_acc))
             val cleanCreds = creds.map(acc => utilities.AccountCredHiding.hide(acc))
             ParticipatorsContainer(employeesList, cleanCreds)
           }

        }),

      Field("people", ListType(People),
        arguments = Nil,
        resolve = ctx => {
          val user = ctx.ctx.user.get

          val employees = EmployeeDAO.getAllByMaster(user.masterFirst)
          val employee_groups = AccountGroupDAO.getByAccounts(employees.map(_.master_acc)).distinct
          val accounts = models.AccountsDAO.findAllByEmails(employees.map(emp => emp.uid)).map(ac => utilities.AccountCredHiding.hide(ac))
          PeopleJSON(
            employees,
            employee_groups,
            accounts
            )


        }),



      Field("me", User2,
        arguments = Nil,
        resolve = ctx => {
          ctx.ctx.user.get
        })

      //Field("droid", Droid,
      //  arguments = ID :: Nil,
      //  resolve = Projector((ctx, f) => ctx.ctx.getDroid(ctx arg ID).get))
    ))



///////////////////////////////////////////////////
val StarWarsSchema = Schema(Query)
///////////////////////////////////////////////////
val wrapper = minority.utils.BBoardWrapper.apply()

def findEntitiesElRes(costs:List[ElementResourceDTO]):List[Entity] = {
  val resource_ids = costs.map(_.resource_id)
  val entities_ft = resource_ids.map(resource_id => wrapper.getEntityByResourceId(resource_id))
  val entities = entities_ft.map(ft => Await.result(ft, scala.concurrent.duration.Duration(100000, 
                                                                scala.concurrent.duration.MILLISECONDS)))
  entities.flatten
}




/*
  val EpisodeEnum = EnumType(
    "Episode",
    Some("One of the films in the Star Wars Trilogy"),
    List(
      EnumValue("NEWHOPE",
        value = Episode.NEWHOPE,
        description = Some("Released in 1977.")),
      EnumValue("EMPIRE",
        value = Episode.EMPIRE,
        description = Some("Released in 1980.")),
      EnumValue("JEDI",
        value = Episode.JEDI,
        description = Some("Released in 1983."))))

  val Character: InterfaceType[Unit, Character] =
    InterfaceType(
      "Character",
      "A character in the Star Wars Trilogy",
      () => fields[Unit, Character](
        Field("id", StringType,
          Some("The id of the character."),
          resolve = _.value.id),
        Field("name", OptionType(StringType),
          Some("The name of the character."),
          resolve = _.value.name),
        Field("friends", OptionType(ListType(OptionType(Character))),
          Some("The friends of the character, or an empty list if they have none."),
          resolve = ctx => DeferFriends(ctx.value.friends)),
        Field("appearsIn", OptionType(ListType(OptionType(EpisodeEnum))),
          Some("Which movies they appear in."),
          resolve = _.value.appearsIn map (e => Some(e)))
      ))

  val Human =
    ObjectType(
      "Human",
      "A humanoid creature in the Star Wars universe.",
      interfaces[Unit, Human](Character),
      fields[Unit, Human](
        Field("id", StringType,
          Some("The id of the human."),
          resolve = _.value.id),
        Field("name", OptionType(StringType),
          Some("The name of the human."),
          resolve = _.value.name),
        Field("friends", OptionType(ListType(OptionType(Character))),
          Some("The friends of the human, or an empty list if they have none."),
          resolve = (ctx) => DeferFriends(ctx.value.friends)),
        Field("appearsIn", OptionType(ListType(OptionType(EpisodeEnum))),
          Some("Which movies they appear in."),
          resolve = _.value.appearsIn map (e => Some(e))),
        Field("homePlanet", OptionType(StringType),
          Some("The home planet of the human, or null if unknown."),
          resolve = _.value.homePlanet),
        Field("additType", ListType(StringType),
          Some("additType if unknown."),
          resolve = _.value.additValues)
      ))

  val Droid = ObjectType(
    "Droid",
    "A mechanical creature in the Star Wars universe.",
    interfaces[Unit, Droid](Character),
    fields[Unit, Droid](
      Field("id", StringType,
        Some("The id of the droid."),
        tags = ProjectionName("_id") :: Nil,
        resolve = _.value.id),
      Field("name", OptionType(StringType),
        Some("The name of the droid."),
        resolve = ctx => Future.successful(ctx.value.name)),
      Field("friends", OptionType(ListType(OptionType(Character))),
        Some("The friends of the droid, or an empty list if they have none."),
        resolve = ctx => DeferFriends(ctx.value.friends)),
      Field("appearsIn", OptionType(ListType(OptionType(EpisodeEnum))),
        Some("Which movies they appear in."),
        resolve = _.value.appearsIn map (e => Some(e))),
      Field("primaryFunction", OptionType(StringType),
        Some("The primary function of the droid."),
        resolve = _.value.primaryFunction)
    ))
*/

}
*/
