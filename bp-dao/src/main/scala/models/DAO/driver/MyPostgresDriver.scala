package models.DAO.driver

import slick.driver.PostgresDriver
import com.github.tminglei.slickpg._
import com.github.tminglei.slickpg.PgArraySupport
import com.github.tminglei.slickpg.PgDateSupport
import com.github.tminglei.slickpg.utils.PgCommonJdbcTypes

import com.github.tminglei.slickpg.array.PgArrayJdbcTypes

import models.DAO.CompositeValues

trait MyCompositeSupport extends PgCommonJdbcTypes
       with PgArrayJdbcTypes
       with PgCompositeSupport { driver: PostgresDriver =>

    trait CompositeImplicts {


      //utils.TypeConverters.register(mkCompositeConvFromString[CompositeValues])
      //utils.TypeConverters.register(mkCompositeConvToString[CompositeValues])


      implicit val compositeTypeMapper = createCompositeJdbcType[CompositeValues]("compositevalues")
      implicit val compositeArrayTypeMapper = createCompositeListJdbcType[CompositeValues]("compositevalues")
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