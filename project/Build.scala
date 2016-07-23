import sbt._
import Keys._
import com.typesafe.sbt.web.Import._
import com.typesafe.sbt.web._

// 2.3.4
//import play.PlayScala
//import play.Play.autoImport._
// 2.4.3
import play.sbt.PlayScala
import play.sbt.Play.autoImport._



import PlayKeys._
import sass.Import._

import com.untyped.sbtjs.Plugin._
import com.untyped.sbtsass.Plugin._
import play.twirl.sbt.Import._

import com.typesafe.sbt.less.Import._
import com.typesafe.sbt.uglify.Import._
import com.typesafe.sbt.rjs.Import._
import UglifyKeys._
//import com.github.sbtliquibase.SbtLiquibase
//import com.github.sbtliquibase.Import._
import org.scalajs.sbtplugin.ScalaJSPlugin
import org.scalajs.sbtplugin.ScalaJSPlugin.autoImport._
import spray.revolver.RevolverPlugin.Revolver._
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration._
import scala.concurrent.{Await, Future}
import scala.language.postfixOps

object Build extends Build {
  import Settings._
  import Dependencies._
import scala.sys.process._

  mainClass := Some("main.scala.BPServiceApp")

  lazy val commonSettings = Seq(
    ivyScala := ivyScala.value map { _.copy(overrideScalaVersion = true) }
  )


  val hello = InputKey[Unit]("routeGenerator", "Prints 'Hello World'")
  val testJsTask = TaskKey[Int]("testJs", "Run javascript tests.")
  //val test2Task = TaskKey[Int]("test2taskAct", "Run javascript tests.")


  val helloTask = hello := {
     //val a = (compile in bpWeb).value
     ////val b = (compile in bpWeb).value
     reStart.parsed.value
        testJs.taskValue
        Thread.sleep(6000)
        println(url("http://127.0.0.1:9000/jsroutes.js") #> file("bp-web/app/assets/javascripts/testroute.js") !)
        reStop.taskValue
     println('a')
     //()
  }
  def testJs = (streams) map { (s) => {
    s.log.info("Executing router downloading")
    Thread.sleep(6000)
    url("http://127.0.0.1:9000/jsroutes.js") #> file("jsroutes.js") !
    // Your implementation
  }
  }
  //test2Task:= {
  //      "curl http://192.168.1.102/jsroutes.js > jsroutes.js" !
  //}
/*
lazy val setEnvironmentTask = inputKey[Unit]("Sets environment variable")
lazy val runIntegrationTest = inputKey[Unit]("Runs everything")
lazy val integrationTest = taskKey[Unit]("Runs integration test")
lazy val setEnvTask: Def.Initialize[InputTask[Unit]] = Def.inputTask{
  val env = spaceDelimited("<arg>").parsed.head
  System.setProperty("checkEnv", env)
}
setEnvironmentTask <<= setEnvTask
runIntegrationTest := setEnvironmentTask.parsed.flatMap{ _ =>
  integrationTest.taskValue
}.value
integrationTest := {
  println("integration test")
}*/


  initialCommands in console := "ammonite.repl.Repl.main(null)"

  lazy val root = Project("root", file("."))
    .aggregate(bpCore, bpDao, bpWeb2)
    .settings(basicSettings: _*)
    .settings(commonSettings: _*)
    //.settings(formatSettings: _*)
    .settings(noPublishing: _*)
    .settings(revolverSettings: _*)
    .settings(compilerSettings: _*)
    //.settings((helloTask in Test) <<= (test in Test) dependsOn (testJsTask))



    lazy val bpWeb2 = Project("bp-web2", file("bp-web2"))
      .enablePlugins(PlayScala)
      .enablePlugins(SbtWeb)
      .settings(basicSettings: _*)
      .settings((WebKeys.public in Assets) := (classDirectory in Compile).value / "public")
      .settings(jsSettings : _*)
      .settings(TwirlKeys.templateImports ++= Seq(
        "play.api.Play.current",
        "play.api.i18n.Messages.Implicits._"
      ))
      .settings(sassOptions in Assets ++= Seq("--compass", "-r", "compass"))
      .settings(sassSettings : _*)
          .settings(libraryDependencies ++=
        List(
          play4, // good
          playslick,
          bootstrap, // good
          guice,
          filter4, // good
          formtag4, // good
          bcrypt,
          requirejs,
          cache4,
          mailer4,
          ficus,
          anorm,
          jdbc4,
          
          swaggerRoute,
          sourcecode,
          silhouette,
          scalatest0,
          playsctest,
          selenide,
          logfmt,
          captcha,


          scalamandrill,
          javamandrill,
          javamandrill2,

          bootstrapplay4
        //  securesocial
        ))
      .settings(libraryDependencies ~= { _.map(_.exclude("org.slf4j", "slf4j-simple")) })
      .dependsOn(bpCore, bpDao)




  lazy val bbSDK = Project("bbSDK", file("bb-sdk"))
    .settings(basicSettings: _*)
    .settings(revolverSettings: _*)
    .settings(
      libraryDependencies ++=
        List(
          scalarx,
          courier,
          async,
          amonite,
          reflect,
          wcs,
          akkaActor,
          scaldiakka,
          dispatch,
          scalaz,
          webserviceclient,
          scalazstream,
          slackapi,
          mechanize,nscala,
          scalatest,
          scalaLog,
          logbackClassic,
          syslog,
          scaldi,
          sprayClient,
          play4,
          hdrHistogram))
    .settings(libraryDependencies ~= { _.map(_.exclude("org.slf4j", "slf4j-simple")) })


  lazy val bpCore = Project("bp-core", file("bp-core"))
    .settings(basicSettings: _*)
    //.settings(formatSettings: _*)
    .settings(revolverSettings: _*)

    .settings(
      libraryDependencies ++=
        List(
          scalarx,
          loggly,
          javaasist,
          javamail,
          courier,
          poi,poiscala,
          async,
          amonite,
          reflect,
          wcs,
          akkaActor,
          akkaSlf4j,
          rollback,
          akkaQuartz,
          dispatch,
          //trireme,
          //triremenode10src,
          jsengine,
          azurestorage,
          futiles,
          scalaz,
          scalazstream,
          mechanize,nscala,
          scalatest,
          scalaLog,
          sourcecode,
          logbackClassic,
          syslog,
	        scaldi,
          sprayClient,

// PLAY STUFF
          playjson,
          wiremock,
          webserviceclient,


          hdrHistogram))
    .settings(libraryDependencies ~= { _.map(_.exclude("org.slf4j", "slf4j-simple")) })


        //compile(akkaActor, sprayCan, sprayClient, sprayRouting) ++
        //provided(logback) ++
        //test(scalatest, akkaTestKit, sprayTestkit, akkaSlf4j, logback))


  lazy val bpDao = Project("bp-dao", file("bp-dao"))
    .settings(basicSettings: _*)
    //.settings(formatSettings: _*)
    .settings(revolverSettings: _*)
    .settings(
      libraryDependencies ++=
        List(
          async,
          //akkaSlf4j,
          paypal,
          slick,
          slickhikari,

          //slick_migrate,
          //hikari_core,
          jacksonbson,
          junit,
          jodatime,
          jshemavalid,
          jwtCore,
          jwtApi,
          slickpg,
          jodaconvert,
          jodamapper,
          scalatest,
          rediscache,
          reflect,
          postgres,
          scalaLog,
          sprayCan,
          sprayRouting,
          hdrHistogram,
          sprayJson))
        .settings(libraryDependencies ~= { _.map(_.exclude("org.slf4j", "slf4j-simple")) })


        //compile(akkaActor, sprayCan, sprayClient, sprayRouting) ++
        //test(scalatest, akkaTestKit, sprayTestkit))
    .dependsOn(bpCore)








  val noPublishing = Seq(publish := (), publishLocal := ())
}
