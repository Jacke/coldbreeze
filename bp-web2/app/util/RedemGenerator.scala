package util
import models._
import models.DAO._
import models.DAO.resources._
import org.joda.time.DateTime

object RedemGenerator {
  def gen {
    // TODO: RedemCodesDAO.
    1  
  }
  def forceToDay(code: Option[RedemCodeDTO]):Option[DateTime] = {
     code match {
        case Some(c) => Some(DateTime.now().plusDays(c.force))
        case _ => None
     }
  }
  def check(code: String):Tuple2[Boolean, Option[DateTime]] = {
     val code_dto:Option[RedemCodeDTO] = RedemCodesDAO.getByCode(code)

     (code_dto.isDefined, forceToDay(code_dto))
  }
}
