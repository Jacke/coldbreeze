import sbt._

object Dependencies {

  val resolutionRepos = Seq(
              "spray repo" at "http://repo.spray.io/",
    "spray nightlies repo" at "http://nightlies.spray.io",
     "Typesafe Repository" at "http://repo.typesafe.com/typesafe/releases/",
     "Typesafe Snapshots" at "http://repo.typesafe.com/typesafe/snapshots/",
    "Maven Central Server" at "http://repo1.maven.org/maven2",
    "MVN" at "http://repo.typesafe.com/typesafe/releases/",
    "Sonatype snapshots"   at "https://oss.sonatype.org/content/repositories/snapshots/",
    "p11k" at "http://pk11-scratch.googlecode.com/svn/trunk",
    "Atlassian Releases" at "https://maven.atlassian.com/public/",
    "scalaz-bintray" at "http://dl.bintray.com/scalaz/releases",
    "bintray-naftoligug-maven" at "http://dl.bintray.com/naftoligug/maven",
    "Rhinofly Internal Release Repository" at "http://maven-repository.rhinofly.net:8081/artifactory/libs-release-local",
    "google-sedis-fix" at "http://pk11-scratch.googlecode.com/svn/trunk",
    "Sonatype OSS Snapshots" at "https://oss.sonatype.org/content/repositories/snapshots/",
    "softprops-maven" at "http://dl.bintray.com/content/softprops/maven",
     Resolver.url( "Reflect GitHub Repository", url( "http://taig.github.io/Reflect/release/" ) )( Resolver.ivyStylePatterns ),
     Resolver.url("heroku-sbt-plugin-releases", url("http://dl.bintray.com/heroku/sbt-plugins/"))(Resolver.ivyStylePatterns),
     Resolver.url("Edulify Repository", url("http://edulify.github.io/modules/releases/"))(Resolver.ivyStylePatterns),
     Resolver.url("github repo for html5tags", url("http://loicdescotte.github.io/Play2-HTML5Tags/releases/"))(Resolver.ivyStylePatterns),
     Resolver.jcenterRepo
  )

  val akkaVersion     = "2.4.6"
  val sprayVersion    = "1.3.1-20140423"
  val javaasist       = "org.javassist" % "javassist" % "3.20.0-GA"
  val heroku          = "com.heroku"                % "sbt-heroku"              % "0.1.4"
  val scalarx         = "com.lihaoyi"               %% "scalarx"                % "0.2.8"
  val async           = "org.scala-lang.modules"    %% "scala-async"            % "0.9.1"
  val shapeless       = "com.chuusai"               %% "shapeless"              % "1.2.4"
  val dispatch        = "net.databinder.dispatch"   %% "dispatch-core"          % "0.11.1"
  val scalaz          = "org.scalaz"                %% "scalaz-core"            % "7.1.0"
  val scalazstream    = "org.scalaz.stream" %% "scalaz-stream" % "0.7.2a"
  // DATABASES
  val slick           = "com.typesafe.slick"        %% "slick"                  % "3.1.1"
  val slickhikari     = "com.typesafe.slick"        %% "slick-hikaricp"         % "3.1.1"
  val slickpg         = "com.github.tminglei"       %% "slick-pg"               % "0.14.1"

  val slick_migrate   = "io.github.nafg"            %% "slick-migration-api"    % "0.1.1"
  val scalikejdbc     = "org.scalikejdbc"           %% "scalikejdbc"                  % "2.2.9"
  val scalikejdbcconf = "org.scalikejdbc"           %% "scalikejdbc-config"           % "2.2.9"
  //val scalikejdbcplay = "org.scalikejdbc"           %% "scalikejdbc-play-initializer" % "2.4.3"
  //val slickpgplay     = "com.github.tminglei"       %% "slick-pg_play-json"     % "0.9.0"
  //val slf4j           = "org.slf4j"                 %  "slf4j-nop"              % "1.7.3"
  val slf4j           = "org.slf4j"                 % "slf4j-simple"            % "1.7.12"
  val json4sNative    = "org.json4s"                %% "json4s-native"          % "3.2.10"
  val json4sJackson   = "org.json4s"                %% "json4s-jackson"         % "3.2.10"
  val autoschema      = "org.coursera"              %% "autoschema"             % "0.1"
  val postgres        =  "org.postgresql"           % "postgresql"              % "9.4-1201-jdbc41"
//val mongodb         = "org.mongodb"               %% "casbah"                % "2.7.0-RC0"
  val reactivemongo   = "org.reactivemongo"         %% "reactivemongo"          % "0.10.5.0.akka23"
  val playreactmongo  = "org.reactivemongo"         %% "play2-reactivemongo"    % "0.10.5.0.akka23"
  val simplereacmongo = "uk.gov.hmrc"               %% "simple-reactivemongo"   % "2.3.0"
  val reactivemongoext= "org.reactivemongo"         % "reactivemongo-extensions-bson_2.11" % "0.10.5.0.0.akka23"
  val mechanize       = "com.gistlabs"              %  "mechanize"              % "0.11.0"
  val scaldi          = "org.scaldi"                %% "scaldi"                 % "0.4"
  val scaldiplay      = "org.scaldi"                %% "scaldi-play"            % "0.4.1"
  val salat           = "com.novus"                 %% "salat"                  % "1.9.8"
  val jshemavalid     = "com.github.fge"            %  "json-schema-validator"  % "2.2.6"
  val jacksonbson     = "de.undercouch"             %  "bson4jackson"           % "2.5.0"
  val wcs             = "eu.piotrbuda"              % "scalawebsocket_2.10"     % "0.1.1"


  val azurestorage    = "com.microsoft.azure"       % "azure-storage"           % "4.0.0"
  val rollback        = "com.tapstream"             % "rollbar-logback"         % "0.1.4"
  //val trireme         = "io.apigee.trireme"         % "trireme-core"            % "0.8.5"
  //val triremenode10src= "io.apigee.trireme"         % "trireme-node10src"       % "0.8.5"
  val jsengine        = "com.typesafe"              %% "jse"                    % "1.1.2"
  val futiles         = "com.markatta"              %% "futiles"                % "1.1.3"
  val scaldiakka      = "org.scaldi"                %% "scaldi-akka"            % "0.4"
  val hikari_core     = "com.zaxxer"                % "HikariCP"                % "2.3.5"
  //val hicaricp        = "com.edulify"               %% "play-hikaricp"          % "1.5.0"
  val hicaricp        = "com.sandinh"               %% "play-hikaricp"          % "1.7.1"
  val javamail        = "javax.mail"                % "mail"                    % "1.5.0-b01"
  val courier         = "me.lessis"                 %% "courier"                % "0.1.3"
  val scalamandrill   = "com.github.dzsessona"      % "scamandrill_2.11"       % "1.1.0"
  val javamandrill    = "com.mandrillapp.wrapper.lutung" % "lutung"             % "0.0.5"
  val javamandrill2   = "com.cribbstechnologies.clients" % "mandrillClient"     % "1.1"
  //val scalamandril2   = "org.globalmoney"           % "play-mandrill"           % "0.1.1-SNAPSHOT"
  val mailchimp       = "com.ecwid" % "ecwid-mailchimp" % "2.0.1.0"

  val selenium        = "org.seleniumhq.selenium"   % "selenium-java"           % "2.44.0" //% "test"
  val selenide        = "com.codeborne"             % "selenide"                % "2.23"
  val fluentlenium    = "org.fluentlenium"          % "fluentlenium-core"       % "0.10.3" //% "test"
  val fluentleniumasj = "org.fluentlenium"          % "fluentlenium-assertj"    % "0.10.3" //% "test"

  val play            = "com.typesafe.play"         % "play_2.11"               % "2.3.10"
  val play2oauth2     = "com.nulab-inc"             %% "play2-oauth2-provider"  % "0.14.0"
  val play4           = "com.typesafe.play"         %% "play"                   % "2.4.3"
  val slackapi        = "com.github.gilbertw1"      %% "slack-scala-client"     % "0.1.3"
  val playslick       = "com.typesafe.play"         %  "play-slick_2.11"        % "1.1.1"
  val playauth        = "jp.t2v"                    %% "play2-auth"             % "0.12.0"
  val formtag         = "com.loicdescotte.coffeebean"% "html5tags_2.11"         % "1.2.1"
  val formtag4        = "com.loicdescotte.coffeebean"% "html5tags_2.11"         % "1.2.2"

  val playctrl        = "jp.t2v"                    %% "stackable-controller"   % "0.4.0"
  val paypal          = "com.paypal.sdk"            %  "rest-api-sdk"           % "1.2.3"
  val logentries      = "com.logentries"            %  "logentries-appender"    % "1.1.21"
  val logfmt          = "com.heroku"                %  "logfmt"                 % "0.1"
  val loggly          = "org.logback-extensions"    %  "logback-ext-loggly"     % "0.1.2"
  val syslog   	      = "com.papertrailapp"   	    %  "logback-syslog4j"       % "1.0.0"
  val compressor      = "com.mohiva"                %% "play-html-compressor"   % "0.3.1"
  val jsonvariants    = "org.julienrf"              %% "play-json-variants"     % "0.2"
  val playflyway      = "com.github.tototoshi"      %% "play-flyway"            % "1.1.0"
  val angular         = "org.webjars"               %  "angularjs"              % "1.3.0"  exclude("org.webjars", "jquery")
  val requirejs       = "org.webjars"               %  "requirejs"              % "2.1.20"
  val underscore      = "org.webjars"               %  "underscorejs"           % "1.8.3"
  val jquery          = "org.webjars"               %  "jquery"                 % "2.1.4"
  val bootstrap       = "org.webjars"               %  "bootstrap"              % "3.1.1-1"   exclude("org.webjars", "jquery")
  val angulartoastr   = "org.webjars"               %  "angular-toastr"          % "1.3.0"

  val securesocial    = "ws.securesocial"           %% "securesocial"           % "3.0-M4"
  val securesocialold = "ws.securesocial"           %% "securesocial"           % "3.0-M3"
  val swaggerRoute    = "com.iheart"                %% "play-swagger"           % "0.2.0"

  val deadbolt        = "be.objectify"              %% "deadbolt-scala"         % "2.3.3"
  val securesocialmas = "ws.securesocial"           %% "securesocial"           % "master-SNAPSHOT"
  val jwtCore         = "com.atlassian.jwt"         % "jwt-core"                % "1.2.4"
  val jwtApi          = "com.atlassian.jwt"         % "jwt-api"                 % "1.2.4"
  val silhouette      = "com.mohiva"                %% "play-silhouette"        % "3.0.0"
  val silhouettetest  = "com.mohiva"                %% "play-silhouette-testkit"% "3.0.0"   % "test"

  val amonite         = "com.lihaoyi"               %% "ammonite-repl"          % "0.2.4" % "test"

  val poi             = "com.norbitltd"             % "spoiwo"                  % "1.0.3"
  val poiscala        = "info.folone"               %% "poi-scala"              % "0.15"

  val bcrypt          = "com.github.t3hnar"         % "scala-bcrypt_2.11"       % "2.4"
  val scalacheck      = "org.scalacheck"            %% "scalacheck"             % "1.11.1"
  val mockito         = "org.mockito"               % "mockito-all"             % "1.9.5"
  val mailer          = "com.typesafe"              % "play-plugins-mailer_2.10"% "2.2.0"

  val mailer4         = "com.typesafe.play" %% "play-mailer" % "4.0.0"

  val mailerses       = "nl.rhinofly"               %% "play-mailer"            % "3.0.0"
  val apamailer       = "org.apache.commons"        %  "commons-email"          % "1.3.1"
  val filter          = "com.typesafe.play"         %% "filters-helpers"        % "2.4.6"
  val filter4         = "com.typesafe.play"         %% "filters-helpers"        % "2.4.6"
  val cache           = "com.typesafe.play"         %% "play-cache"             % "2.4.6"
  val cache4           = "com.typesafe.play.modules" %% "play-modules-redis" % "2.4.1"

  val rediscache      = "com.typesafe.play.plugins" %% "play-plugins-redis"     % "2.3.1"
  val ptest           = "com.typesafe.play"         %% "play-test"              % "2.4.6"
  val jdbc4            = "com.typesafe.play"         %% "play-jdbc"              % "2.4.6"
  val jdbc            = "com.typesafe.play"         %% "play-jdbc"              % "2.4.6"
  val playjson        = "com.typesafe.play"         %% "play-json"              % "2.4.6"
  val junit           = "com.novocode"              % "junit-interface"         % "0.10" % "test"
  val anorm           = "com.typesafe.play"         %% "anorm"                  % "2.4.6"
  val anorm4          =  "com.typesafe.play"        %% "anorm"                  % "2.4.0"


  val jodatime        = "joda-time"                 % "joda-time"               % "2.7"
  val jodaconvert     = "org.joda"                  % "joda-convert"            % "1.7"
  val jodamapper      = "com.github.tototoshi"      %% "slick-joda-mapper"      % "2.2.0"

  val akkaActor       = "com.typesafe.akka"         %%  "akka-actor"            % akkaVersion
  val akkaSlf4j       = "com.typesafe.akka"         %%  "akka-slf4j"            % akkaVersion
  val akkaTestKit     = "com.typesafe.akka"         %%  "akka-testkit"          % akkaVersion
  val akkaQuartz      = "com.enragedginger"         %%  "akka-quartz-scheduler" % "1.5.0-akka-2.4.x"

  val reflect         = "com.taig"                  %%  "reflect"               % "0.9.3-BETA"
  val nscala          = "com.github.nscala-time"    %%  "nscala-time"           % "2.0.0"
  //val slickjoda       = "com.github.tminglei"       %%  "slick-pg_joda-time"    % "0.9.1"
  val hdrHistogram    = "org.hdrhistogram"          %   "HdrHistogram"          % "1.0.8"
  val sprayCan        = "io.spray"                  %%   "spray-can"            % sprayVersion
  val sprayRouting    = "io.spray"                  %%   "spray-routing"        % sprayVersion
  val sprayTestkit    = "io.spray"                  %%   "spray-testkit"        % sprayVersion
  val sprayJson       = "io.spray"                  %%  "spray-json"            % "1.2.6"
  val sprayJsonLenses = "net.virtual-void"          %%  "json-lenses"           % "0.5.5-SNAPSHOT"
  val sprayClient     = "io.spray"                  %%  "spray-client"          % sprayVersion
  val guice           = "net.codingwell"            %% "scala-guice"            % "4.0.0"
  val ficus           = "net.ceedubs"               %% "ficus" % "1.1.2"
  val bootstrapplay   = "com.adrianhurt"            %% "play-bootstrap3"     % "0.4.4-P24"
  val bootstrapplay4  = "com.adrianhurt"            %% "play-bootstrap"      % "1.1-P24-B3-SNAPSHOT"
  val scalatest0      = "org.scalatest"             %% "scalatest"           % "2.2.6"
  val wiremock        = "com.github.tomakehurst"    % "wiremock"             % "1.33"
  val playsctest      = "org.scalatestplus"         %  "play_2.11"           % "1.4.0"
  val scalatest       = "org.specs2"                %% "specs2-core"         % "2.3.13-scalaz-7.1.0-RC1" % "test"
  val scalatest2      = "org.specs2"                %% "specs2-junit"        % "2.3.13-scalaz-7.1.0-RC1" % "test"
  val scalatest3      = "org.specs2"                %% "specs2-mock"         % "2.3.13-scalaz-7.1.0-RC1" % "test"




  val webserviceclient =   "com.typesafe.play"      %% "play-ws"         % "2.4.6"


  val scalaLog        = "com.typesafe.scala-logging"%%  "scala-logging"         % "3.4.0"
  val sourcecode      = "com.lihaoyi"               %%  "sourcecode"            % "0.1.1"
  val snakeYaml       = "org.yaml"                  %   "snakeyaml"             % "1.13"
  val logbackClassic  = "ch.qos.logback"            % "logback-classic"         % "1.1.7"

  def compile   (deps: ModuleID*): Seq[ModuleID] = deps map (_ % "compile")
  def provided  (deps: ModuleID*): Seq[ModuleID] = deps map (_ % "provided")
  def test      (deps: ModuleID*): Seq[ModuleID] = deps map (_ % "test")
  def runtime   (deps: ModuleID*): Seq[ModuleID] = deps map (_ % "runtime")
  def container (deps: ModuleID*): Seq[ModuleID] = deps map (_ % "container")
}
