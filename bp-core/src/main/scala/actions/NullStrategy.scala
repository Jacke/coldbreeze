package us.ority.min.actions
import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable.ListBuffer

class NullStrategy(
	  id: Option[Long] = None,
	  ident: String = "Null",
	  created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
    updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)
	) {

	def execute():StrategyResult = {
		println("Strategy executed")
		StrategyResult("nullStratedy", true)
	}
	def asStrategy():Strategy = new Strategy(id,
											ident,
											-1L,
											true,
											created_at,
											updated_at)

}
