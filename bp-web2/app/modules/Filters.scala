package utils

import javax.inject.Inject

import play.api.http.HttpFilters
import play.api.mvc.EssentialFilter
import play.filters.csrf.CSRFFilter
import play.filters.headers.SecurityHeadersFilter
import play.filters.cors.CORSFilter

import play.api.db.slick.DatabaseConfigProvider
import play.api.db.slick.HasDatabaseConfigProvider
import play.api.libs.concurrent.Execution.Implicits.defaultContext
import slick.driver.JdbcProfile

/**
 * Provides filters.
 */
class Filters @Inject() (dbConfigProvider: DatabaseConfigProvider,
  corsFilter: CORSFilter,
  csrfFilter: CSRFFilter,
  securityHeadersFilter: SecurityHeadersFilter) extends HttpFilters  {

  models.DAO.conversion.DatabaseCred.dbConfigTemp = Some ( dbConfigProvider.get[JdbcProfile] )

  override def filters: Seq[EssentialFilter] =  {
    Seq(securityHeadersFilter, corsFilter)
  }
}


