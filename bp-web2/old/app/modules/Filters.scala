package utils

import javax.inject.Inject

import play.api.http.HttpFilters
import play.api.mvc.EssentialFilter
import play.filters.cors._
import play.filters.csrf.CSRFFilter
import play.filters.headers.SecurityHeadersFilter
import play.api.db.slick.DatabaseConfigProvider
import play.api.db.slick.HasDatabaseConfigProvider
import play.api.libs.concurrent.Execution.Implicits.defaultContext
import slick.driver.JdbcProfile



import com.kenshoo.play.metrics.Metrics
import com.codahale.metrics.Counter
import com.codahale.metrics._
import com.codahale.metrics.graphite._
import java.util.concurrent.TimeUnit;
import java.net._
import com.bealetech.metrics.reporting._

import org.coursera.metrics.datadog.DatadogReporter
import org.coursera.metrics.datadog.DatadogReporter.Expansion._
import org.coursera.metrics.datadog.transport.Transport
import org.coursera.metrics.datadog.transport.HttpTransport
import org.coursera.metrics.datadog.transport.UdpTransport

/**
 * Provides filters.
 */
class Filters @Inject() (dbConfigProvider: DatabaseConfigProvider,
  corsFilter: CORSFilter,
  csrfFilter: CSRFFilter,
  metrics: Metrics,
  securityHeadersFilter: SecurityHeadersFilter) extends HttpFilters  {

val graphite = new Graphite(new InetSocketAddress("graphite.example.com", 2003));
val reporter = GraphiteReporter.forRegistry(metrics.defaultRegistry)
                                                  .prefixedWith("web1.example.com")
                                                  .convertRatesTo(TimeUnit.SECONDS)
                                                  .convertDurationsTo(TimeUnit.MILLISECONDS)
                                                  .filter(MetricFilter.ALL)
                                                  .build(graphite);
reporter.start(1, TimeUnit.SECONDS);

val reporter2 = ConsoleReporter.forRegistry(metrics.defaultRegistry)
                                                .convertRatesTo(TimeUnit.SECONDS)
                                                .convertDurationsTo(TimeUnit.MILLISECONDS)
                                                .build();
//reporter2.start(1, TimeUnit.SECONDS);


val statsd = new com.bealetech.metrics.reporting.Statsd("localhost", 8125);

 val reporter3 = StatsdReporter.forRegistry(metrics.defaultRegistry)
         .prefixedWith("foo")
         .convertDurationsTo(TimeUnit.MILLISECONDS)
         .convertRatesTo(TimeUnit.SECONDS)
         .filter(MetricFilter.ALL)
         .build(statsd);
reporter3.start(15, TimeUnit.SECONDS);

val expansions = java.util.EnumSet.of(COUNT, RATE_1_MINUTE, RATE_15_MINUTE, MEDIAN, P95, P99)
val httpTransport = new HttpTransport.Builder().withApiKey("c4e3f2d3f26d2a68d3d942435ca806df").build()
val reporter4 = DatadogReporter.forRegistry(metrics.defaultRegistry)
  .withTransport(httpTransport)
  .withExpansions(expansions)
  .build()

reporter4.start(10, TimeUnit.SECONDS)


println(reporter4)

println(">")
println(">")
println(">")
println(">")
println(">")

  models.DAO.conversion.DatabaseCred.dbConfigTemp = Some ( dbConfigProvider.get[JdbcProfile] )

  override def filters: Seq[EssentialFilter] =  {
    Seq(securityHeadersFilter, corsFilter)
  }
}
