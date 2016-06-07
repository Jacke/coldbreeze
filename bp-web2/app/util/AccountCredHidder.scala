package utilities

import models.DAO.resources._
import models.DAO._

object AccountCredHiding {
  def hide(ac: models.daos.DBUser ) = {
  	ac //.copy(password = "hidden", hasher = "hidden", providerId = "hidden", authMethod = "hidden")
  }
}
