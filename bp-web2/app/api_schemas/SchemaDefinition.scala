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
import java.util._
/**
 * Defines a GraphQL schema for the current project
 */
object SchemaDefinition {

  val DateTimeType = DateHelper.DateTimeType


case object UUIDCoercionViolation extends ValueCoercionViolation("UUID value expected")

def parseUUID(s: String) = Try(UUID.fromString(s)) match {
  case Success(date) ⇒ Right(date)
  case Failure(_) ⇒ Left(DateCoercionViolation)
}
val UUIDType = ScalarType[UUID]("UUID",
  coerceOutput = (d, caps) ⇒
    if (caps.contains("")) UUID.randomUUID()
    else UUID.randomUUID(),
  coerceUserInput = {
    case s: String ⇒ parseUUID(s)
    case _ ⇒ Left(DateCoercionViolation)
  },
  coerceInput = {
    case ast.StringValue(s, _, _) ⇒ parseUUID(s)
    case _ ⇒ Left(DateCoercionViolation)
  })



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



val LaunchLogs = ObjectType("LaunchLogs", "LaunchLog.",
   fields[CharacterRepo, BProcessDTO](
      Field("id", IntType,
        Some("The id of the droid."),
        resolve = _.value.id.getOrElse(0))
  )
)


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



        Field("elements", ListType(Elements),
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



  val RefsSch = RefSchema.schema




/////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////// PEOPLE QUERY
  val Employee = ObjectType("Employees", "Employee", 
    fields[CharacterRepo, EmployeeDTO](

      Field("id", IntType,
            Some("id"),
            resolve = ctx => Future.successful(ctx.value.id.getOrElse(-1)  )),
      Field("uid", StringType,
            Some("uid"),
            resolve = ctx => Future.successful(ctx.value.uid  )),
      Field("master_acc", StringType,
            Some("master_acc"),
            resolve = ctx => Future.successful(ctx.value.master_acc  )),
      Field("position", OptionType(StringType),
            Some("position"),
            resolve = ctx => Future.successful(ctx.value.position  )),
      Field("manager", BooleanType,
            Some("manager"),
            resolve = ctx => Future.successful(ctx.value.manager  )),
      Field("workbench", IntType,
            Some("workbench"),
            resolve = ctx => Future.successful(ctx.value.workbench  ))      
    )
  )
  val Group = ObjectType("Groups", "Group", 
    fields[CharacterRepo, GroupDTO](
      Field("id", IntType,
            Some("id"),
            resolve = ctx => Future.successful(ctx.value.id.getOrElse(-1)  )),
      Field("title", StringType,
            Some("title"),
            resolve = ctx => Future.successful(ctx.value.title  )),
      Field("business", IntType,
            Some("business"),
            resolve = ctx => Future.successful(ctx.value.business  )),
      Field("created_at", OptionType(DateTimeType),
            Some("created_at"),
            resolve = ctx => Future.successful(ctx.value.created_at  )),
      Field("updated_at", OptionType(DateTimeType),
            Some("updated_at"),
            resolve = ctx => Future.successful(ctx.value.updated_at  ))     
    )
  )
  val Account = ObjectType("Accounts", "Account", 
    fields[CharacterRepo, models.daos.DBUser](
      Field("userID", StringType,
            Some("userID"),
            resolve = ctx => Future.successful(ctx.value.userID  )),
      Field("firstName", OptionType(StringType),
            Some("firstName"),
            resolve = ctx => Future.successful(ctx.value.firstName  )),
      Field("lastName", OptionType(StringType),
            Some("lastName"),
            resolve = ctx => Future.successful(ctx.value.lastName  )),
      Field("fullName", OptionType(StringType),
            Some("fullName"),
            resolve = ctx => Future.successful(ctx.value.fullName  )),
      Field("email", OptionType(StringType),
            Some("email"),
            resolve = ctx => Future.successful(ctx.value.email  )),
      Field("avatarURL", OptionType(StringType),
            Some("avatarURL"),
            resolve = ctx => Future.successful(ctx.value.avatarURL  ))
    )
  )

  val ParticipatorContainerSchema = ObjectType("ParticipatorsContainer", "Participator", 
    fields[CharacterRepo, ParticipatorsContainer](
    Field("emps", ListType(Employee),
      Some("emps."),
      resolve = ctx => Future.successful(ctx.value.emps )),
    Field("creds", ListType(Account),
      Some("creds."),
      resolve = ctx => Future.successful(ctx.value.creds ))    
    )
  )

  val People = ObjectType("Peoples", "People", 
    fields[CharacterRepo, PeopleJSON](
    Field("employees", ListType(Employee),
      Some("employees."),
      resolve = ctx => Future.successful(ctx.value.employees  )),
    Field("employee_groups", ListType(Group),
      Some("employee_groups."),
      resolve = ctx => Future.successful(ctx.value.employee_groups  )),
    Field("accounts", ListType(Account),
      Some("accounts."),
      resolve = ctx => Future.successful(ctx.value.accounts  ))          

    )
  )
//////////////////////////////////////////////////////////////////


val ResourceSchema = ObjectType("Resources", "Resource",
  fields[CharacterRepo, ResourceDTO](
    Field("id", IntType, resolve = ctx => ctx.value.id.getOrElse(-1)),
    Field("title", StringType, resolve = ctx => ctx.value.title),
    Field("business", IntType, resolve = ctx => ctx.value.business),
    Field("created_at", OptionType(DateHelper.DateTimeType), resolve = ctx => ctx.value.created_at),
    Field("updated_at", OptionType(DateHelper.DateTimeType), resolve = ctx => ctx.value.updated_at), 
  )) 

val MetaTypeSchema = ObjectType("Metas", "Meta", 
  fields[CharacterRepo, MetaVal](
    Field("key", StringType, resolve = ctx => ctx.value.key),
    Field("value", StringType, resolve = ctx => ctx.value.value)
  )
)

val EntitySchema = ObjectType("Entities", "Entity", 
  fields[CharacterRepo, Entity](
    Field("id", OptionType(UUIDType),
      resolve = ctx => ctx.value.resource),
    Field("title", StringType,
      resolve = ctx => ctx.value.entities),  
    Field("boardId", UUIDType,
      resolve = ctx => ctx.value.resource),
    Field("description", StringType,
      resolve = ctx => ctx.value.entities),  
    Field("publisher", StringType,
      resolve = ctx => ctx.value.resource),
    Field("etype", StringType,
      resolve = ctx => ctx.value.entities),  
    Field("default", StringType,
      resolve = ctx => ctx.value.resource),
    Field("meta", ListType(MetaTypeSchema),
      resolve = ctx => ctx.value.entities),
    Field("creationDate", OptionType(DateHelper.DateTimeType),
      resolve = ctx => ctx.value.entities),
    Field("updateDate", OptionType(DateHelper.DateTimeType),
      resolve = ctx => ctx.value.entities)                                
  ))

val ResourceEntitySelectorSchema = ObjectType("Services", "Service",
  fields[CharacterRepo, ResourceEntitySelector](
    Field("resource", ResourceSchema,
      resolve = ctx => ctx.value.resource),
    Field("entities", ListType(EntitySchema),
      resolve = ctx => ctx.value.entities)    
))


val ElementResourceDTOSchema = ObjectType("ElementResources", "ElementResource",
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


val ElementResourceContainerSchema = ObjectType("ElementResourcesContainer", "ElementResourceContainer",
    fields[CharacterRepo, ElementResourcesContainer](
      Field("obj", ElementResourceDTOSchema, 
        resolve = ctx => ctx.value.obj
      ),
      Field("entities", ListType(EntitySchema),
        resolve = ctx => ctx.value.entities
      )
      // case class ElementResourceContainer(obj: ElementResourceDTO, entities: List[Entity])
))




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


  val User2 = ObjectType(
      "User2",
      "User.",
      fields[Unit, User2](
        Field("id", StringType,
          Some("The id of the droid."),
          tags = ProjectionName("_id") :: Nil,
          resolve = ctx => Future.successful(ctx.value.userID.toString  )),

        Field("firstName", OptionType( StringType ),
          Some("The id of the droid."),
          tags = ProjectionName("_id") :: Nil,
          resolve = ctx => Future.successful(ctx.value.firstName  )),
        Field("lastName", OptionType( StringType ),
          Some("The id of the droid."),
          tags = ProjectionName("_id") :: Nil,
          resolve = ctx => Future.successful(ctx.value.lastName  )),
        Field("fullName", OptionType( StringType ),
          Some("The id of the droid."),
          tags = ProjectionName("_id") :: Nil,
          resolve = ctx => Future.successful(ctx.value.fullName  )),
        Field("email", OptionType( StringType ),
          Some("The id of the droid."),
          tags = ProjectionName("_id") :: Nil,
          resolve = ctx => Future.successful(ctx.value.email  )),
        Field("avatarURL", OptionType( StringType ),
          Some("The id of the droid."),
          tags = ProjectionName("_id") :: Nil,
          resolve = ctx => Future.successful(ctx.value.avatarURL  ))
      ))



  val ID = Argument("id", StringType, description = "id of the character")

  val EpisodeArg = Argument("episode", OptionInputType(EpisodeEnum),
    description = "If omitted, returns the hero of the whole saga. If provided, returns the hero of that particular episode.")

  val Query = ObjectType(
    "Query", fields[CharacterRepo, Unit](
      Field("hero", Character,
        arguments = EpisodeArg :: Nil,
        resolve = (ctx) => ctx.ctx.getHero(ctx.arg(EpisodeArg))),
      Field("human", OptionType(Human),
        arguments = ID :: Nil,
        resolve = ctx => ctx.ctx.getHuman(ctx arg ID)),
      Field("humans", ListType(Human),
        arguments = Nil,
        resolve = ctx => ctx.ctx.getHumans),

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

      Field("cost_assign", ListType(ElementResourceContainerSchema),
        arguments = Nil,
        resolve = ctx => {
          val user = ctx.ctx.user.get
          //  /data/cost/assigns/130
          // CostFillController.assigns(process_id: Int) = silhouette.SecuredAction { implicit request =>
          var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(user.emailFilled).get
          val assigns = ElementResourceDAO.getByProcess(process_id).map { obj =>
              ElementResourceContainer(obj, findEntitiesElRes(List(obj)) )
          }
          assigns
      }),

      Field("cost_collection", ListType(ResourceEntitySelectorSchema),
        arguments = Nil,
        resolve = ctx => {
          val user = ctx.ctx.user.get
          // CostFillController.assignResourceCollection
          var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(user.emailFilled).get
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
        }),

      Field("droid", Droid,
        arguments = ID :: Nil,
        resolve = Projector((ctx, f) => ctx.ctx.getDroid(ctx arg ID).get))
    ))

  val StarWarsSchema = Schema(Query)






private def findEntitiesElRes(costs:List[ElementResourceDTO]):List[Entity] = {
  val resource_ids = costs.map(_.resource_id)
  val entities_ft = resource_ids.map(resource_id => wrapper.getEntityByResourceId(resource_id))
  val entities = entities_ft.map(ft => Await.result(ft, Duration(waitSeconds, MILLISECONDS)))
  entities.flatten
}


}
