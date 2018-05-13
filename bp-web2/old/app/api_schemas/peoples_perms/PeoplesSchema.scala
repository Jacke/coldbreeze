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


object PeoplesSchema {


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

val DateTimeType = DateHelper.DateTimeType

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
    Field("updated_at", OptionType(DateHelper.DateTimeType), resolve = ctx => ctx.value.updated_at) 
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
      resolve = ctx => ctx.value.id),
    Field("title", StringType,
      resolve = ctx => ctx.value.title),  
    Field("boardId", UUIDType,
      resolve = ctx => ctx.value.boardId),
    Field("description", StringType,
      resolve = ctx => ctx.value.description),  
    Field("publisher", StringType,
      resolve = ctx => ctx.value.publisher),
    Field("etype", StringType,
      resolve = ctx => ctx.value.etype),  
    Field("default", StringType,
      resolve = ctx => ctx.value.default),
    Field("meta", ListType(MetaTypeSchema),
      resolve = ctx => ctx.value.meta),
    Field("creationDate", OptionType(DateHelper.DateTimeType),
      resolve = ctx => ctx.value.creationDate),
    Field("updateDate", OptionType(DateHelper.DateTimeType),
      resolve = ctx => ctx.value.updateDate)                                
  ))

val ResourceEntitySelectorSchema = ObjectType("ResourceEntitySelectors", "ResourceEntitySelector",
  fields[CharacterRepo, ResourceEntitySelector](
    Field("resource", ResourceSchema,
      resolve = ctx => ctx.value.resource),
    Field("entities", ListType(EntitySchema),
      resolve = ctx => ctx.value.entities)    
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



}
