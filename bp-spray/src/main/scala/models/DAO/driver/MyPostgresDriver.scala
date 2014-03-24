package models.DAO.driver

import com.github.tminglei.slickpg._
import slick.driver.PostgresDriver

trait MyPostgresDriver extends PostgresDriver
with PgArraySupport
with PgDateSupport
 {
  ///
  override val Implicit = new ImplicitsPlus {}
  override val simple = new SimpleQLPlus {}

  //////
  trait ImplicitsPlus extends Implicits
  with ArrayImplicits
  with DateTimeImplicits


  trait SimpleQLPlus extends SimpleQL
  with ImplicitsPlus

}

object MyPostgresDriver extends MyPostgresDriver