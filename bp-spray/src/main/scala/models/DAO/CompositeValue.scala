package models.DAO
/*
import java.sql.Timestamp
import java.text.SimpleDateFormat

import slick.driver.PostgresDriver
import com.github.tminglei.slickpg._
import com.github.tminglei.slickpg.PgArraySupport
import com.github.tminglei.slickpg.PgDateSupport
import com.github.tminglei.slickpg.utils.PgCommonJdbcTypes
import com.github.tminglei.slickpg.array.PgArrayJavaTypes
import scala.slick.jdbc.{StaticQuery => Q}

trait MyPostgresDriver extends PostgresDriver
with PgArraySupport
 {
  ///
  override val Implicit = new ImplicitsPlus {}
  override val simple = new SimpleQLPlus {}

  //////
  trait ImplicitsPlus extends Implicits
  with ArrayImplicits


  trait SimpleQLPlus extends SimpleQL
  with ImplicitsPlus
}

object MyPostgresDriver extends MyPostgresDriver

object PgCompositeSupportTest {
  case class CompositeValues(
                              id: Long,
                              a_string: String = "",
                              b_string: String = "",
                              a_int: Int = 0,
                              b_int: Int = 0,
                              a_bool: Boolean = false,
                              b_bool: Boolean = false
                              )

  //-------------------------------------------------------------
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

  object MyPostgresDriver1 extends MyPostgresDriver with MyCompositeSupport {
    override val Implicit = new ImplicitsPlus with CompositeImplicts {}
    override val simple = new SimpleQLPlus with CompositeImplicts {}
  }
}

class PgCompositeSupportTest {
  import PgCompositeSupportTest._
  import MyPostgresDriver1.simple._

  val db = Database.forURL("jdbc:postgresql://localhost/minority", driver = "org.postgresql.Driver", user = "postgres", password = "12344321")

  case class TestBean(
                       id: Long,
                       comps: List[CompositeValues]
                       )

  class TestTable(tag: Tag) extends Table[TestBean](tag, "CompositeValues") {
    def id = column[Long]("id")
    def comps = column[List[CompositeValues]]("comps", O.DBType("compositevalues[]"))

    def * = (id,comps) <> (TestBean.tupled, TestBean.unapply)
  }
  val CompositeTests = TableQuery[TestTable]


  val rec1 = TestBean(121,  List(CompositeValues(21L, "ff", a_bool = true)))
  val rec2 = TestBean(1213, List(CompositeValues(211L, "ff", b_bool = true)))



  def testCompositeTypes(): Unit = {

    db withSession { implicit session: Session =>
      //CompositeTests forceInsertAll (rec1, rec2)

      val q1 = CompositeTests.filter(_.id === 12L.bind).map(r => r)
      //assertEquals(rec1, q1.first)
      println(rec1)
      println(rec2)
      val result = q1.first
      println(q1)
      println(result)


      val q2 = CompositeTests.filter(_.id === 335L.bind).map(r => r)
      //assertEquals(rec2, q2.first)
    }
  }

  def createShit(): Unit = {
    db withSession { implicit session: Session =>
      (Q[Int] + "create type compositevalues as (id int8, a_string text, b_string text, a_int int8, b_int int8, a_bool boolean, b_bool boolean)").first
      new MyPostgresDriver1.TableDDLBuilder(CompositeTests.baseTableRow).buildDDL create
    }
  }


ProcElemCRUD.update(6, (Option(6), "xx", "", 2,2,"block","test block", None,None,1,Option(List(CompositeValues(a_string = "betas")))))

  /**
   *
   *
   *
  @Before
  def createTables(): Unit = {
    db withSession { implicit session: Session =>
      (Q[Int] + "create type composite1 as (id int8, txt text, date timestamp)").first
      (Q[Int] + "create type composite2 as (id int8, comp1 composite1)").first

      new MyPostgresDriver1.TableDDLBuilder(CompositeTests.baseTableRow).buildDDL create
    }
  }

  @After
  def dropTables(): Unit = {
    //db withSession { implicit session: Session =>
    //  new MyPostgresDriver1.TableDDLBuilder(CompositeTests.baseTableRow).buildDDL drop
    //
    //  (Q[Int] + "drop type composite2").first
    //  (Q[Int] + "drop type composite1").first
    //}
  }
   *
   */
}
*/