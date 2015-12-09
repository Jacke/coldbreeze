package models

//import scalikejdbc._
//import scalikejdbc.config._
import play.api.db._
import play.api.Play.current

import anorm._
import anorm.SqlParser._



object LoadTesting {

  def all() = DB.withConnection { implicit c =>
    SQL("select * from accounts") //.as(simple *)
  }

 /* val simple = {
    get[String]("token.token") ~
    get[String]("token.email") ~
    get[String]("token.action") ~
    get[Date]("token.created") map {
      case token~email~action~created => Token(token, email, action, created)
    }
  }*/
	/*
  def test() = {
	DBs.setupAll()
	// DBs.setup()
	// DBs.setup('legacy)
	// // Unlike DBs.setupAll(), DBs.setup() doesn't load configurations under global settings automatically
	// DBs.loadGlobalSettings()

	// loaded from "db.default.*"
	val memberIds = DB readOnly { implicit session =>
	  sql"select email from accounts".map(_.string(1)).list.apply()
	}
	// loaded from "db.legacy.*"
	val legacyMemberIds = NamedDB('legacy) readOnly { implicit session =>
	  sql"select email from accounts".map(_.string(1)).list.apply()
	}
    memberIds.foreach { e => println(e) }
	legacyMemberIds.foreach { e => println(e) }
	// wipes out ConnectionPool
	DBs.closeAll()
  }
  */

}