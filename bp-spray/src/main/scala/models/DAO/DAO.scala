package models.DAO

/**
 * Case classes for casting
 */
import main.scala.utils.Keepr



/**
 * DAO Config
 */

object FirstExample {
  import scala.slick.driver.PostgresDriver.simple._
  val database = Database.forURL("jdbc:postgresql://localhost/minority", driver = "org.postgresql.Driver", user = "postgres", password = "12344321")

}

object BPSerial {
  import main.scala.bprocesses.BProcess
  def instance(bpdto: BProcessDTO, els: List[UndefElement]):BProcess = {
    println(bpdto)
    println(els)

    /**
     * Clean Run
     * new process
     * push blocks
     * push space
     * add to space
     */
  }
  // def dirt_instance

  def save(bp: BProcess):Boolean = {
  // station save
  // logger save
  }
}