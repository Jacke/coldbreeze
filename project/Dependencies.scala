import sbt._

object Dependencies {

  val resolutionRepos = Seq(
              "spray repo" at "http://repo.spray.io/",
    "spray nightlies repo" at "http://nightlies.spray.io",
     "Typesafe Repository" at "http://repo.typesafe.com/typesafe/releases/",
    "Maven Central Server" at "http://repo1.maven.org/maven2",
    "MVN" at "http://repo.typesafe.com/typesafe/releases/",
    "Sonatype snapshots"   at "https://oss.sonatype.org/content/repositories/snapshots/",
    "p11k" at "http://pk11-scratch.googlecode.com/svn/trunk",
    "Atlassian Releases" at "https://maven.atlassian.com/public/",
    "scalaz-bintray" at "http://dl.bintray.com/scalaz/releases",
    "bintray-naftoligug-maven" at "http://dl.bintray.com/naftoligug/maven",

    "softprops-maven" at "http://dl.bintray.com/content/softprops/maven",
     Resolver.url( "Reflect GitHub Repository", url( "http://taig.github.io/Reflect/release/" ) )( Resolver.ivyStylePatterns ),
     Resolver.url("heroku-sbt-plugin-releases", url("http://dl.bintray.com/heroku/sbt-plugins/"))(Resolver.ivyStylePatterns),
     Resolver.url("Edulify Repository", url("http://edulify.github.io/modules/releases/"))(Resolver.ivyStylePatterns),
     Resolver.url("github repo for html5tags", url("http://loicdescotte.github.io/Play2-HTML5Tags/releases/"))(Resolver.ivyStylePatterns)

  )

  val akkaVersion     = "2.3.2"
  val sprayVersion    = "1.3.1-20140423"
  
  val heroku          = "com.heroku"                % "sbt-heroku"              % "0.1.4"
  val scalarx         = "com.lihaoyi"               %% "scalarx"                % "0.2.8"
  val async           = "org.scala-lang.modules"    %% "scala-async"            % "0.9.1"
  val shapeless       = "com.chuusai"               %% "shapeless"              % "1.2.4"
  val dispatch        = "net.databinder.dispatch"   %% "dispatch-core"          % "0.11.1"
  val scalaz          = "org.scalaz"                %% "scalaz-core"            % "7.0.6"
  val slick           = "com.typesafe.slick"        %% "slick"                  % "3.0.0"
  val slickpg         = "com.github.tminglei"       %% "slick-pg"               % "0.9.0"
  val slick_migrate   = "io.github.nafg"            %% "slick-migration-api"    % "0.1.1"
  val slickpgcore     = "com.github.tminglei"       %  "slick-pg_core_2.11"     % "0.9.0"
  //val slickpgplay     = "com.github.tminglei"       %% "slick-pg_play-json"     % "0.9.0"
  val slf4j           = "org.slf4j"                 %  "slf4j-nop"              % "1.7.3"
  val json4sNative    = "org.json4s"                %% "json4s-native"          % "3.2.10"
  val json4sJackson   = "org.json4s"                %% "json4s-jackson"         % "3.2.10"
  val autoschema      = "org.coursera"              %% "autoschema"             % "0.1"
  val postgres        = "postgresql"                %   "postgresql"            % "9.1-901.jdbc4"
//val mongodb         = "org.mongodb"               %% "casbah"                % "2.7.0-RC0"
  val reactivemongo   = "org.reactivemongo"         %% "reactivemongo"          % "0.10.5.0.akka23"
  val playreactmongo  = "org.reactivemongo"         %% "play2-reactivemongo"    % "0.10.5.0.akka23"
  val mechanize       = "com.gistlabs"              %  "mechanize"              % "0.11.0"
  val scaldi          = "org.scaldi"                %% "scaldi"                 % "0.4"
  val scaldiplay      = "org.scaldi"                %% "scaldi-play"            % "0.4.1"
  val scaldiakka      = "org.scaldi"                %% "scaldi-akka"            % "0.4"
  val hicaricp        = "com.edulify"               %% "play-hikaricp"          % "1.5.0"
  val javamail        = "javax.mail"                % "mail"                    % "1.5.0-b01"
  val courier         = "me.lessis"                 %% "courier"                % "0.1.3"

  val play            = "org.webjars"               %% "webjars-play"           % "2.3.0"
  val playslick       = "com.typesafe.play"         %  "play-slick_2.10"        % "0.8.0"
  val playauth        = "jp.t2v"                    %% "play2-auth"             % "0.12.0"
  val formtag         = "com.loicdescotte.coffeebean"% "html5tags_2.11"         % "1.2.1"
  val playctrl        = "jp.t2v"                    %% "stackable-controller"   % "0.4.0"
  val paypal          = "com.paypal.sdk"            %  "rest-api-sdk"           % "1.2.3"
  val logentries      = "com.logentries"            %  "logentries-appender"    % "1.1.21"
  val syslog   	      = "com.papertrailapp"   	    %  "logback-syslog4j"       % "1.0.0"
  val compressor      = "com.mohiva"                %% "play-html-compressor"   % "0.3.1"
  val jsonvariants    = "org.julienrf"              %% "play-json-variants"     % "0.2"
  val playflyway      = "com.github.tototoshi"      %% "play-flyway"            % "1.1.0"
  val angular         = "org.webjars"               %  "angularjs"              % "1.2.16-2"  exclude("org.webjars", "jquery")
  val requirejs       = "org.webjars"               %  "requirejs"              % "2.1.11-1"
  val underscore      = "org.webjars"               %  "underscorejs"           % "1.6.0-3"
  val jquery          = "org.webjars"               %  "jquery"                 % "1.11.1"
  val bootstrap       = "org.webjars"               %  "bootstrap"              % "3.1.1-1"   exclude("org.webjars", "jquery")
  val securesocial    = "ws.securesocial"           %% "securesocial"           % "3.0-M3"
  val deadbolt        = "be.objectify"              %% "deadbolt-scala"         % "2.3.3"
  val securesocialmas = "ws.securesocial"           %% "securesocial"           % "master-SNAPSHOT"
  val jwtCore         = "com.atlassian.jwt"         % "jwt-core"                % "1.2.4"
  val jwtApi          = "com.atlassian.jwt"         % "jwt-api"                 % "1.2.4"
  val silhouette      = "com.mohiva"                %% "play-silhouette"        % "2.0"
  val silhouettetest  = "com.mohiva"                %% "play-silhouette-testkit"% "2.0"   % "test"

  val amonite         = "com.lihaoyi"               %% "ammonite-repl"          % "0.2.4" % "test"

  val bcrypt          = "com.github.t3hnar"         % "scala-bcrypt_2.11"       % "2.4"
  val scalacheck      = "org.scalacheck"            %% "scalacheck"             % "1.11.1"
  val mockito         = "org.mockito"               % "mockito-all"             % "1.9.5"
  val mailer          = "com.typesafe"              % "play-plugins-mailer_2.10"% "2.2.0"
  val apamailer       = "org.apache.commons"        % "commons-email"           % "1.3.1"
  val filter          = "com.typesafe.play"         %% "filters-helpers"        % "2.3.7"
  val cache           = "com.typesafe.play"         %% "play-cache"             % "2.3.7"
  val rediscache      = "com.typesafe.play.plugins" %% "play-plugins-redis"     % "2.3.1"
  val ptest           = "com.typesafe.play"         %% "play-test"              % "2.3.7"
  val jdbc            = "com.typesafe.play"         %% "play-jdbc"              % "2.3.7"
  val playjson        = "com.typesafe.play"         %% "play-json"              % "2.3.7"
  val junit           = "com.novocode"              % "junit-interface"         % "0.10" % "test"
  val anorm           = "com.typesafe.play"         %% "anorm"                  % "2.3.7"

  val jodatime        = "joda-time"                 % "joda-time"               % "2.7"
  val jodaconvert     = "org.joda"                  % "joda-convert"            % "1.7"
  val jodamapper      = "com.github.tototoshi"      %% "slick-joda-mapper"      % "2.0.0"

  val akkaActor       = "com.typesafe.akka"         %%  "akka-actor"            % akkaVersion
  val akkaSlf4j       = "com.typesafe.akka"         %%  "akka-slf4j"            % akkaVersion
  val akkaTestKit     = "com.typesafe.akka"         %%  "akka-testkit"          % akkaVersion
  val logback         = "ch.qos.logback"            %   "logback-classic"       % "1.0.13"
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
  val guice           = "net.codingwell"            %% "scala-guice"            % "4.0.0-beta5"
  val scalatest       = "org.specs2"                %%  "specs2" % "2.3.12"     % "test"
  val scalaLog        = "com.typesafe.scala-logging"%%  "scala-logging"         % "3.1.0"
  val snakeYaml       = "org.yaml"                  %   "snakeyaml"             % "1.13"
  val logbackClassic  = "ch.qos.logback"            % "logback-classic"         % "1.0.13"

  def compile   (deps: ModuleID*): Seq[ModuleID] = deps map (_ % "compile")
  def provided  (deps: ModuleID*): Seq[ModuleID] = deps map (_ % "provided")
  def test      (deps: ModuleID*): Seq[ModuleID] = deps map (_ % "test")
  def runtime   (deps: ModuleID*): Seq[ModuleID] = deps map (_ % "runtime")
  def container (deps: ModuleID*): Seq[ModuleID] = deps map (_ % "container")
}
