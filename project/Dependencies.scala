import sbt._

object Dependencies {

  val resolutionRepos = Seq(
              "spray repo" at "http://repo.spray.io/",
    "spray nightlies repo" at "http://nightlies.spray.io",
     "Typesafe Repository" at "http://repo.typesafe.com/typesafe/releases/",
    "Maven Central Server" at "http://repo1.maven.org/maven2",
    "Sonatype snapshots"   at "https://oss.sonatype.org/content/repositories/snapshots/",
     Resolver.url( "Reflect GitHub Repository", url( "http://taig.github.io/Reflect/release/" ) )( Resolver.ivyStylePatterns )
  )

  val akkaVersion  = "2.3.2"
  val sprayVersion = "1.3.1-20140423"


  val async           = "org.scala-lang.modules"    %% "scala-async"            % "0.9.1"
  val shapeless       = "com.chuusai"               %% "shapeless"              % "1.2.4"
  val dispatch        = "net.databinder.dispatch"   %% "dispatch-core"          % "0.11.1"
  val scalaz          = "org.scalaz"                %% "scalaz-core"            % "7.0.6"
  val slick           = "com.typesafe.slick"        %  "slick_2.11.0-RC4"       % "2.1.0-M1"
//val slickpg         = "com.github.tminglei"       % "slick-pg_2.11"           % "0.6.0-M1"
//val slickpgcore     = "com.github.tminglei"       % "slick-pg_core_2.11"      % "0.6.0-M1"
  val slf4j           = "org.slf4j"                 %   "slf4j-nop"             % "1.7.3"
//val json4s-n        = "org.json4s"                %%  "json4s-native"         % "3.2.6"
//val json4s-j        = "org.json4s"                %%  "json4s-jackson"        % "3.2.6"
  val postgres        = "postgresql"                %   "postgresql"            % "9.1-901.jdbc4"
//val mongodb         = "org.mongodb"               %% "casbah"                % "2.7.0-RC0"
  val mechanize       = "com.gistlabs"              %  "mechanize"              % "0.11.0"

  val play            = "org.webjars"               %% "webjars-play"           % "2.3.0"
  val playslick       = "com.typesafe.play"         %  "play-slick_2.10"        % "0.7.0-M1"
  val playauth        = "jp.t2v"                    %% "play2-auth"             % "0.12.0"
  val playctrl        = "jp.t2v"                    %% "stackable-controller"   % "0.4.0"
  val jsonvariants    = "org.julienrf"              %% "play-json-variants"     % "0.2-SNAPSHOT"
  val playflyway      = "com.github.tototoshi"      %% "play-flyway"            % "1.1.0"
  val angular         = "org.webjars"               %  "angularjs"              % "1.2.16-2"  exclude("org.webjars", "jquery")
  val requirejs       = "org.webjars"               %  "requirejs"              % "2.1.11-1"
  val underscore      = "org.webjars"               %  "underscorejs"           % "1.6.0-3"
  val jquery          = "org.webjars"               %  "jquery"                 % "1.11.1"
  val bootstrap       = "org.webjars"               %  "bootstrap"              % "3.1.1-1"   exclude("org.webjars", "jquery")


  val bcrypt          = "com.github.t3hnar"         % "scala-bcrypt_2.11"       % "2.4"
  val mailer          = "com.typesafe"              % "play-plugins-mailer_2.10"% "2.2.0"
  val cache           = "com.typesafe.play"         %% "filters-helpers"        % "2.3.0-RC1" 
  val filter          = "com.typesafe.play"         %% "play-cache"             % "2.3.0-RC1" 
  val jdbc            = "com.typesafe.play"         %% "play-jdbc"              % "2.3.0-RC1"
  val anorm           = "com.typesafe.play"         %% "anorm"                  % "2.3.0-RC1"


  val akkaActor       = "com.typesafe.akka"         %%  "akka-actor"            % akkaVersion
  val akkaSlf4j       = "com.typesafe.akka"         %%  "akka-slf4j"            % akkaVersion
  val akkaTestKit     = "com.typesafe.akka"         %%  "akka-testkit"          % akkaVersion
  val logback         = "ch.qos.logback"            %   "logback-classic"       % "1.0.13"
  val reflect         = "com.taig"                  %%  "reflect"               % "0.9.3-BETA"
  val nscala          = "com.github.nscala-time"    %%  "nscala-time"           % "1.0.0"
  //val slickjoda       = "com.github.tminglei"       % "slick-pg_joda-time_2.11" % "0.6.0-M1"
  val hdrHistogram    = "org.hdrhistogram"          %   "HdrHistogram"          % "1.0.8"
  val sprayCan        = "io.spray"                  %%   "spray-can"             % sprayVersion
  val sprayRouting    = "io.spray"                  %%   "spray-routing"         % sprayVersion
  val sprayTestkit    = "io.spray"                  %%   "spray-testkit"         % sprayVersion
  val sprayJson       = "io.spray"                  %%  "spray-json"            % "1.2.6"
  val sprayJsonLenses = "net.virtual-void"          %%  "json-lenses"           % "0.5.5-SNAPSHOT"
  val sprayClient     = "io.spray"                  %%  "spray-client"          % sprayVersion
  val scalatest       = "org.specs2"                %%  "specs2" % "2.3.12"     % "test"
  val scalaLog        = "com.typesafe.scala-logging"%%  "scala-logging-slf4j"   % "2.1.2"
  val snakeYaml       = "org.yaml"                  %   "snakeyaml"             % "1.13"
  val logbackClassic  = "ch.qos.logback"            % "logback-classic"         % "1.0.13"
  
  def compile   (deps: ModuleID*): Seq[ModuleID] = deps map (_ % "compile")
  def provided  (deps: ModuleID*): Seq[ModuleID] = deps map (_ % "provided")
  def test      (deps: ModuleID*): Seq[ModuleID] = deps map (_ % "test")
  def runtime   (deps: ModuleID*): Seq[ModuleID] = deps map (_ % "runtime")
  def container (deps: ModuleID*): Seq[ModuleID] = deps map (_ % "container")
}
