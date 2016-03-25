package utilities

import models.DAO.resources._
import models.DAO._
import service.DemoUser
import securesocial.core._
import models.AccountDAO

object AccountCredHiding {
  def hide(ac: AccountDAO) = {
  	ac.copy(password = "hidden", hasher = "hidden", providerId = "hidden", authMethod = "hidden")
  }
} 