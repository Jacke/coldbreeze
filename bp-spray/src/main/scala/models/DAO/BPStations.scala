package models.DAO

import scala.slick.driver.PostgresDriver.simple._

class BPStations(tag: Tag) extends Table[
  (Option[Int],
   Int,
   Int,
   Boolean,
   Int,
   Int,
   Array[Int],
   Array[Int],
   Boolean,
   Boolean,
   Boolean,
   Boolean,
   Boolean
   )](tag, "bpstations") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  //def title = column[String]("title")
  def process = column[Int]("process_id")


  def logger = column[Int]("logger_id")
  def state = column[Boolean]("state")
  def step = column[Int]("step")
  def space = column[Int]("space")
  def container_step = column[Array[Int]]
  def expand_step = column[Array[Int]]
  def started = column[Boolean]("started")
  def finished = column[Boolean]("finished")
  def inspace = column[Boolean]("inspace")
  def incontainer = column[Boolean]("incontainer")
  def inexpands = column[Boolean]("inexpands")
  def paused = column[Boolean]("paused")


  def * = (id.?,
    process,
    logger,
    state,
    step,
    space,
    container_step,
    expand_step,
    started,
    finished,
    inspace,
    incontainer,
    inexpands,
    paused) //<> (Supplier.tupled, Supplier.unapply)

}

object BPStationDTO {
  val bpstations = TableQuery[BPStations]


}