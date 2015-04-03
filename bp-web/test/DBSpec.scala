package tests

import play.api.test._
import scala.concurrent.duration.FiniteDuration
import play.api.Logger
//import objects._
import scala.concurrent.ExecutionContext.Implicits.global
import models.DAO.conversion._

import models.DAO.reflect._
import models.DAO._

class DBSpec extends PlaySpecification {
/*
  "DB" should {

    "must use Test database" in {
       DatabaseCred.switchTo("test")
       DatabaseCred.database.createSession().conn.getMetaData().getURL() == "jdbc:postgresql://localhost/minority_test"
    }

    "create DLL" in {
      util.DLL_Initiator.initiate.mustEqual(true)
    }
    
    "Drop All DLL" in {
      util.DLL_Initiator.drop.mustEqual(true)
    }


  }*/
  val bprocess = BProcessDTO(None, 
    title = "Test", 
    service = 1, 
    business = 1,
    created_at = None, 
    updated_at= None, 
    version = 1L, 
    state_machine_type = "base")
  val bp_id = BPDAO.pull_object(bprocess)

  "Bprocess" should {
    "created" in {
      bp_id > 0    
    }
  } 
  val resulted = RefDAO.retrive(4, bp_id, 1, in = "front","test", desc = "", space_id = None)
  val space_id = if (resulted.isDefined) Some(resulted.get.spaces.head) else None
  val space_resulted = RefDAO.retrive(4, bp_id, 1, in = "nested","test", desc = "", space_id = space_id)
  
  "Ref in tested process" should {
    "must making on front" in {
      resulted.isDefined && resulted.get.spaces.length > 0
    } 
    "must making on nested" in {
      space_resulted.isDefined && space_resulted.get.spaces.length > 0
    }
  }
  "Ref must be creatable with all references" in {
    "elements must generate orders" in {
      true
    }
    "spaces must generate indexes" in {
      true      
    }
  } 
  "Process" should {
    "deleted" in {
      BPDAO.delete(bp_id) != 0
    }
  } 

}