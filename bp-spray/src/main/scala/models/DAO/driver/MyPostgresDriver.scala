package models.DAO.driver

import slick.driver.PostgresDriver
import com.github.tminglei.slickpg._
import com.github.tminglei.slickpg.PgArraySupport
import com.github.tminglei.slickpg.PgDateSupport
import com.github.tminglei.slickpg.utils.PgCommonJdbcTypes
import com.github.tminglei.slickpg.array.PgArrayJavaTypes

import models.DAO.CompositeValues

trait MyCompositeSupport extends PgCommonJdbcTypes with PgArrayJavaTypes { driver: PostgresDriver =>

    trait CompositeImplicts {
      import utils.TypeConverters.Util._


      utils.TypeConverters.register(mkCompositeConvFromString[CompositeValues])
      utils.TypeConverters.register(mkCompositeConvToString[CompositeValues])



      implicit val compositevaluesTypeMapper = new GenericJdbcType[CompositeValues]("compositevalues",
        mkCompositeConvFromString[CompositeValues], mkCompositeConvToString[CompositeValues])
      implicit val compositevaluesArrayTypeMapper = new ArrayListJavaType[CompositeValues]("compositevalues",
        mkArrayConvFromString[CompositeValues], mkArrayConvToString[CompositeValues])
    }
  }

trait MyPostgresDriver extends PostgresDriver 
with MyCompositeSupport 
with PgArraySupport
//with PgDateSupport
with PgDateSupportJoda 
 {
  ///
  override val Implicit = new ImplicitsPlus with CompositeImplicts {} 
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