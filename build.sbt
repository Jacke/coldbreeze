name := """coldbreeze"""
organization := "com.spreadway"

version := "2.0.alpha1"

scalaVersion := "2.12.4"

libraryDependencies += guice
libraryDependencies += "org.scalatestplus.play" %% "scalatestplus-play" % "3.1.2" % Test


lazy val global = project
  .in(file("."))
  .settings(settings)
  .enablePlugins(PlayScala)

lazy val core = project
  .settings(
    name := "bp-core",
    settings,
    libraryDependencies ++= commonDependencies
  )

lazy val dao = project
  .settings(
    name := "bp-dao",
    settings,
    libraryDependencies ++= commonDependencies ++ Seq(
      dependencies.monocleCore,
      dependencies.monocleMacro
    )
  )
  .dependsOn(
    core
  )

lazy val web = project
  .settings(
    name := "bp-web2",
    settings,
    libraryDependencies ++= commonDependencies ++ Seq(
      dependencies.pureconfig
    )
  )
  .dependsOn(
    core
  )



// DEPENDENCIES

lazy val dependencies =
  new {
    val logbackV        = "1.2.3"
    val logstashV       = "4.11"
    val scalaLoggingV   = "3.7.2"
    val slf4jV          = "1.7.25"
    val typesafeConfigV = "1.3.1"
    val pureconfigV     = "0.8.0"
    val monocleV        = "1.4.0"
    val akkaV           = "2.5.6"
    val scalatestV      = "3.0.4"
    val scalacheckV     = "1.13.5"

    val logback        = "ch.qos.logback"             % "logback-classic"          % logbackV
    val logstash       = "net.logstash.logback"       % "logstash-logback-encoder" % logstashV
    val scalaLogging   = "com.typesafe.scala-logging" %% "scala-logging"           % scalaLoggingV
    val slf4j          = "org.slf4j"                  % "jcl-over-slf4j"           % slf4jV
    val typesafeConfig = "com.typesafe"               % "config"                   % typesafeConfigV
    val akka           = "com.typesafe.akka"          %% "akka-stream"             % akkaV
    val monocleCore    = "com.github.julien-truffaut" %% "monocle-core"            % monocleV
    val monocleMacro   = "com.github.julien-truffaut" %% "monocle-macro"           % monocleV
    val pureconfig     = "com.github.pureconfig"      %% "pureconfig"              % pureconfigV
    val scalatest      = "org.scalatest"              %% "scalatest"               % scalatestV
    val scalacheck     = "org.scalacheck"             %% "scalacheck"              % scalacheckV
  }

lazy val commonDependencies = Seq(
  dependencies.logback,
  dependencies.logstash,
  dependencies.scalaLogging,
  dependencies.slf4j,
  dependencies.typesafeConfig,
  dependencies.akka,
  dependencies.scalatest  % "test",
  dependencies.scalacheck % "test"
)

// SETTINGS

lazy val settings =
commonSettings

lazy val compilerOptions = Seq(
  "-unchecked",
  "-feature",
  "-language:existentials",
  "-language:higherKinds",
  "-language:implicitConversions",
  "-language:postfixOps",
  "-deprecation",
  "-encoding",
  "utf8"
)

lazy val commonSettings = Seq(
  scalacOptions ++= compilerOptions,
  resolvers ++= Seq(
    "Local Maven Repository" at "file://" + Path.userHome.absolutePath + "/.m2/repository",
    Resolver.sonatypeRepo("releases"),
    Resolver.sonatypeRepo("snapshots")
  )
)



shellPrompt := { state =>
  def textColor(color: Int)      = { s"\033[38;5;${color}m" }
  def backgroundColor(color:Int) = { s"\033[48;5;${color}m" }
  def reset                      = { s"\033[0m" }

  def formatText(str: String)(txtColor: Int, backColor: Int) = {
    s"${textColor(txtColor)}${backgroundColor(backColor)}${str}${reset}"
  }
  val red    = 1
  val green  = 2
  val yellow = 11
  val white  = 15
  val black  = 16
  val orange = 166

  formatText(s"[${name.value}]")(white, orange) +
   "\n " +
   formatText("\u276f")(green, black) +
   formatText("\u276f")(yellow, black) +
   formatText("\u276f ")(red, black)
}


import com.scalapenos.sbt.prompt.SbtPrompt.autoImport._

promptTheme := com.scalapenos.sbt.prompt.PromptThemes.ScalapenosTheme




// Adds additional packages into Twirl
//TwirlKeys.templateImports += "com.spread.controllers._"

// Adds additional packages into conf/routes
// play.sbt.routes.RoutesKeys.routesImport += "com.spread.binders._"
