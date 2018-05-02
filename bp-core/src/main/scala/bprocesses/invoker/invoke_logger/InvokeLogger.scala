package main.scala.bprocesses

import com.typesafe.scalalogging.Logger
import main.scala.simple_parts.process._
import main.scala.utils.Space
import main.scala.bprocesses._
import main.scala.simple_parts.process._

trait InvokeLogger {
  def getStation(bp: BProcess): BPStation = { bp.station }
  def pushToLogger(bp: BProcess, result: BPLoggerResult) = bp.logger.log(result)
  def pushToLoggerBefore(bp: BProcess, result: BPLoggerResult) = bp.logger.logBefore(result)
  def pushToStationLogger(bp: BProcess, signal: String) = bp.station.station_logger.log(
  	BPStationLoggerResult(bp.station, signal, bp.station.state_represent)
  )
  def pushToSessionStateLog(bp: BProcess, state_id: Int, on: Boolean, on_rate: Int, reason: String) { 
	val result:SessionStateLog = SessionStateLog(None, bp.session_id, state_id, on, on_rate, reason, created_at = Some(org.joda.time.DateTime.now), updated_at = Some(org.joda.time.DateTime.now)) 
	bp.station.station_logger.sessionStateLog(result)
 }
}