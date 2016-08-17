package controllers.pipes

import play.api._
import play.api.mvc._
import play.twirl.api.Html
import play.api.http.MimeTypes
import play.api.libs.json._
import play.api.cache._
import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats
import play.api.data.format.Formatter
import play.api.data.FormError
import play.api.Logger
import play.api.i18n.{ I18nSupport, MessagesApi }

import javax.inject.Inject
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import play.api.mvc.{ Action, RequestHeader }
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
import scala.util.Try

import play.api.ApplicationLoader
import play.api.Configuration
import play.api.inject._
import play.api.inject.guice._
import models.DAO._
import models.DAO.resources._



trait ProcessesPipes {
  def a:Boolean
  def listForServicesByUserAndWorkbench(user: models.User2, workBenchId:Int):Future[List[BProcessDTO]] 

}

class ProcessesPipesImpl extends ProcessesPipes {
  def a:Boolean = true


  def listForServicesByUserAndWorkbench(user: models.User2, currentWorkbench:Int):Future[List[BProcessDTO]] = {

    val user_services = BusinessServiceDAO.getAllByBusiness(currentWorkbench).map(_.id.getOrElse(-1))


    val bprocess = BPDAO.getByServices(user_services) // TODO: Not safe
    // TODO: Add for actor, if they assigned to process
    /**
     * Simple employee
     * Restricted by Act Permission
     */
    if (user.isEmployee && !user.isManager) {
       println(user.isEmployee)
       println("Restricted by Act Permission")
       // Employee assigned process
       val acts = ActPermissionDAO.getByUID(user.emailFilled)
       val bpIds = ActPermissionDAO.getByUIDprocIDS(user.emailFilled)
       val procOut = bprocess.filter(bp => bpIds.contains(bp.id.get))
       Future.successful(procOut)
    } else {
      //***
      //** Primary manager processes
      //***
      println("Primary manager processes")
      val procOut = bprocess.filter(bp => user_services.contains(bp.service))
      Future.successful(procOut)
    }
  }

}