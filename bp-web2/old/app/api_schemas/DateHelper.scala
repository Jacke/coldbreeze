package api_schemas

import sangria.schema._
import sangria.marshalling._


import scala.concurrent.Future
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

object DateHelper {


case object DateCoercionViolation extends ValueCoercionViolation("Date value expected")

def parseDate(s: String) = Try(new DateTime(s, DateTimeZone.UTC)) match {
  case Success(date) ⇒ Right(date)
  case Failure(_) ⇒ Left(DateCoercionViolation)
}
val DateTimeType = ScalarType[DateTime]("DateTime",
  coerceOutput = (d, caps) ⇒
    if (caps.contains(DateSupport)) d.toDate
    else ISODateTimeFormat.dateTime().print(d),
  coerceUserInput = {
    case s: String ⇒ parseDate(s)
    case _ ⇒ Left(DateCoercionViolation)
  },
  coerceInput = {
    case ast.StringValue(s, _, _) ⇒ parseDate(s)
    case _ ⇒ Left(DateCoercionViolation)
  })




}