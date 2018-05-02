package models.DAO.driver

import com.github.tminglei.slickpg._

trait MyPostgresDriver extends ExPostgresDriver
                          with PgArraySupport {
  def pgjson = "jsonb" // jsonb support is in postgres 9.4.0 onward; for 9.3.x use "json"

  // Add back `capabilities.insertOrUpdate` to enable native `upsert` support; for postgres 9.5+
  //override protected def computeCapabilities: Set[Capability] =
  //  super.computeCapabilities + JdbcProfile.capabilities.insertOrUpdate

  override val api = MyAPI

  object MyAPI extends API with ArrayImplicits {
    implicit val strListTypeMapper = new SimpleArrayJdbcType[String]("text").to(_.toList)

  }
}

object MyPostgresDriver extends MyPostgresDriver

/*
import slick.driver.PostgresDriver
import com.github.tminglei.slickpg._
import com.github.tminglei.slickpg.PgArraySupport
import com.github.tminglei.slickpg.PgDateSupport
import com.github.tminglei.slickpg.utils.PgCommonJdbcTypes

import com.github.tminglei.slickpg.array.PgArrayJdbcTypes

import models.DAO._

import slick.driver.PostgresDriver._
import slick.driver.PostgresDriver.simple._

trait WithMyDriver {
  val driver: MyPostgresDriver
}

trait MyCompositeSupport extends PgCommonJdbcTypes
       with PgArrayJdbcTypes
       with PgCompositeSupport { driver: PostgresDriver =>

    trait CompositeImplicts {


      //utils.TypeConverters.register(mkCompositeConvFromString[CompositeValues])
      //utils.TypeConverters.register(mkCompositeConvToString[CompositeValues])


      //implicit val compositeTypeMapper = createCompositeJdbcType[CompositeValues]("compositevalues")
      //implicit val compositeArrayTypeMapper = createCompositeListJdbcType[CompositeValues]("compositevalues")


      //implicit val compositevaluesTypeMapper = new GenericJdbcType[CompositeValues]("compositevalues",
      //  mkCompositeConvFromString[CompositeValues], mkCompositeConvToString[CompositeValues])
      //implicit val compositevaluesArrayTypeMapper = new SimpleArrayListJdbcType[CompositeValues]("compositevalues",
      //  mkArrayConvFromString[CompositeValues], mkArrayConvToString[CompositeValues])
    }
  }

trait MyPostgresDriver extends PostgresDriver
with MyCompositeSupport
with PgArraySupport
//with PgDateSupport
with PgDateSupportJoda
 {
  ///
  override lazy val Implicit = new ImplicitsPlus with CompositeImplicts {}
  override val simple = new SimpleQLPlus with CompositeImplicts {}


  //////
  trait ImplicitsPlus extends Implicits
  with ArrayImplicits
  with DateTimeImplicits



  trait SimpleQLPlus extends SimpleQL
  with ImplicitsPlus
  with DateTimeImplicits

}

object MyPostgresDriver extends MyPostgresDriver











trait WithMyDriver1 {
  val driver: MyPostgresDriver1
}


trait MyPostgresDriver1 extends PostgresDriver
with PgArraySupport
//with PgDateSupport
with PgDateSupportJoda
 {
  ///
   override lazy val Implicit = new ImplicitsPlus {}
override val simple = new SimpleQLPlus {}


  //////
  trait ImplicitsPlus extends Implicits
  with ArrayImplicits
  with DateTimeImplicits



  trait SimpleQLPlus extends SimpleQL
  with ImplicitsPlus
  with DateTimeImplicits

}

object MyPostgresDriver1 extends MyPostgresDriver1
*/
