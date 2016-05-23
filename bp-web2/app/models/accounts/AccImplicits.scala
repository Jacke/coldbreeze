package models


import models.DAO.resources.{EmployeesBusinessDAO, AccountPlanDAO}
import models.DAO.resources.BusinessDTO._
import models.DAO.conversion.DatabaseCred

import securesocial.core.providers._
import securesocial.core._
import securesocial.core.services.{UserService, SaveMode}

//import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import slick.model.ForeignKeyAction

import slick.driver.PostgresDriver.api._
import com.github.tototoshi.slick.PostgresJodaSupport._
import service.DemoUser

object AccImplicits {
  implicit def tuple2OAuth1Info(tuple: (Option[String], Option[String])): Option[OAuth1Info] = tuple match {
    case (Some(token), Some(secret)) => Some(OAuth1Info(token, secret))
    case _ => None
  }

  implicit def tuple2OAuth2Info(tuple: (Option[String], Option[String], Option[Int], Option[String])): Option[OAuth2Info] = tuple match {
    case (Some(token), tokenType, expiresIn, refreshToken) => Some(OAuth2Info(token, tokenType, expiresIn, refreshToken))
    case _ => None
  }
  implicit def typlePassInfo(tuple: (String, String, Option[String])):Option[PasswordInfo] = { tuple match {
    case (hasher, password, Some(salt)) => Some(PasswordInfo(hasher, password, Some(salt)))
    case (hasher, password, None) => Some(PasswordInfo(hasher, password, None))
    case _ =>  None
  }}


  implicit def ob2OAuth1Info(a: Option[String], b: Option[String]): Option[OAuth1Info] = {
    tuple2OAuth1Info(tuple = (a, b))
  }

  implicit def ob2OAuth2Info(a: Option[String], b: Option[String], c: Option[Int], d: Option[String]): Option[OAuth2Info] = {
    tuple2OAuth2Info(tuple = (a, b, c, d))
  }

  implicit def obPassInfo(a: String, b: String, c: Option[String]):Option[PasswordInfo] = {
    typlePassInfo(tuple = (a, b, c))
  }
}