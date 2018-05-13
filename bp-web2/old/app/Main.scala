import java.io.File
import java.io._

import play.api.{Play, DefaultApplication, Mode}
import play.core.ApplicationProvider
import scala.util.{Try, Properties}



import com.google.inject.{ TypeLiteral, Scopes, AbstractModule }
import net.codingwell.scalaguice.ScalaModule
//import securesocial.core.{ BasicProfile, RuntimeEnvironment }
import javax.inject.Inject

import play.api.http.HttpFilters
import play.filters.cors.CORSFilter

class Filters @Inject() (corsFilter: CORSFilter) extends HttpFilters {
  def filters = Seq(corsFilter)
}


class DemoModule extends AbstractModule with ScalaModule {
  override def configure() {
    //val environment: MyEnvironment = new MyEnvironment
    //bind(new TypeLiteral[RuntimeEnvironment] {}).toInstance(environment)

  }
}
