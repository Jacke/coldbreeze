import sbt._
import Keys._
import com.typesafe.sbt.web.Import._
import com.typesafe.sbt.web._

// 2.3.4
import play.PlayScala
import play.Play.autoImport._
// 2.4.3
//import play.sbt.PlayScala
//import play.sbt.Play.autoImport._
import PlayKeys._
import sass.Import._

import com.untyped.sbtjs.Plugin._
import com.untyped.sbtsass.Plugin._

import com.typesafe.sbt.less.Import._ 
import com.typesafe.sbt.uglify.Import._
import com.typesafe.sbt.rjs.Import._
import UglifyKeys._
import com.github.sbtliquibase.SbtLiquibase
import com.github.sbtliquibase.Import._
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
    .aggregate(bpCore, bpDao, bpWeb)
    .settings(basicSettings: _*)
    .settings(commonSettings: _*)
    //.settings(formatSettings: _*)
    .settings(noPublishing: _*)
    .settings(revolverSettings: _*)
    .settings(compilerSettings: _*)
    //.settings((helloTask in Test) <<= (test in Test) dependsOn (testJsTask))

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
          logback, 
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
          javaasist,
          javamail,
          courier,
          poi,poiscala,
          async, 
          amonite, 
          reflect, 
          wcs,
          akkaActor, 
          scaldiakka, 
          dispatch,
          //trireme,
          //triremenode10src,
          jsengine,
          futiles,
          scalaz, 
          scalazstream,
          mechanize,nscala, 
          scalatest, 
          scalaLog, 
          logback, 
          syslog,  
	        scaldi,
          sprayClient, 
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
          slick_migrate,
          hikari_core,
          jacksonbson,
          junit,
          jodatime,
          jshemavalid,
          jwtCore,
          akkastreams,
          jwtApi,
          slickpg,
          slickpgcore,
          jodaconvert,
          jodamapper, 
          scalatest,
          rediscache, 
          reflect, 
          postgres, 
          logbackClassic, 
          scalaLog, 
          sprayCan, 
          sprayRouting, 
          hdrHistogram, 
          sprayJson))
        .settings(libraryDependencies ~= { _.map(_.exclude("org.slf4j", "slf4j-simple")) })


        //compile(akkaActor, sprayCan, sprayClient, sprayRouting) ++
        //test(scalatest, akkaTestKit, sprayTestkit))
    .dependsOn(bpCore)

  lazy val bpWeb = Project("bp-web", file("bp-web"))
    .enablePlugins(SbtLiquibase)
    .enablePlugins(PlayScala)
    .enablePlugins(SbtWeb)
    //.enablePlugins(ScalaJSPlugin)
    .settings(basicSettings: _*)
    //.settings(pipelineStages in Assets := Seq(rjs))
    //.settings(RjsKeys.baseUrl := "javascripts")
    //.settings(RjsKeys.paths := Map.empty)
    //.settings(RjsKeys.mainModule := "main")
    .settings((WebKeys.public in Assets) := (classDirectory in Compile).value / "public")
    //.settings(formatSettings: _*)(WebKeys.public in Assets) := (classDirectory in Compile).value / "public",
    .settings(revolverSettings: _*)
    .settings(jsSettings : _*)
    .settings(sassSettings : _*)
    .settings(liquibaseUsername := "postgres")
    .settings(liquibasePassword := "12344321")
    .settings(liquibaseDriver   := "org.postgresql.Driver")
    .settings(liquibaseUrl      := "jdbc:postgresql://localhost/minority1?createDatabaseIfNotExist=true")
    //.settings((compile in Compile) <<= (compile in Compile).dependsOn(WebKeys.assets in Assets))
    .settings(sassOptions in Assets ++= Seq("--compass", "-r", "compass"))
/*.settings(
    sassOptions := Seq("--compass")
)*/
    .settings(includeFilter in(Assets, LessKeys.less) := "*.less")
    .settings(excludeFilter in(Assets, LessKeys.less) := "_*.less")
    .settings(mainClass in Compile := Some("ProdNettyServer"))
    .settings(mainClass in (Compile, run) := Some("DevNettyServer"))
    .settings(helloTask)
    .settings(testJsTask <<= testJs)
    //.settings(test2Task)
    .settings(
      libraryDependencies ++=
        List(
          async, 
          akkaActor, 
         // akkaSlf4j, 
          slick, 
          playsctest,
          play, 
          play2oauth2,
          requirejs,
          selenium,
          selenide,
          fluentlenium,
          fluentleniumasj,
          underscore,
          jquery,
          bootstrap, 
          angular,
          angular,
          //swagger,
          scalamandrill,
          javamandrill,
          javamandrill2,
          //scalamandril2,
          angulartoastr,
          mailchimp,
          apamailer, 
          logentries, 
          playauth,
          securesocialold,
          deadbolt,
          scalacheck,
          compressor,
          mockito,
          formtag,
          ptest, 
          scaldiplay, 
          jsonvariants, 
          playflyway, 
          playctrl,
          cache, 
          filter, 
//          hicaricp,
          scalikejdbc,
          scalikejdbcconf,
          //scalikejdbcplay,
          jdbc, 
          anorm, 
          shapeless, 
          mailer, 
          mailerses,
          scalatest0,
          scalatest,
          scalatest2,
          scalatest3,
          reflect, 
          bcrypt, 
          postgres, 
          logbackClassic, 
          scalaLog, 
          hdrHistogram))
    .settings(libraryDependencies ~= { _.map(_.exclude("org.slf4j", "slf4j-simple")) })


        //compile(akkaActor, sprayCan, sprayClient, sprayRouting) ++
        //test(scalatest, akkaTestKit, sprayTestkit))
    .dependsOn(bpCore, bpDao)
    /*
  lazy val main = withProfile(Project("cms", file(".")).enablePlugins(com.typesafe.sbt.web.SbtWeb, play.PlayScala).settings(buildSettings ++ Seq(
    libraryDependencies ++= appDependencies,
    allDependencies := allDependencies.value.map(_.exclude("com.typesafe.play", "play-docs_2.10")),
    // Put all assets in the public classes directory
    (WebKeys.public in Assets) := (classDirectory in Compile).value / "public",
    // Ensure that assets are compiled when compile is done
    (compile in Compile) <<= (compile in Compile).dependsOn(WebKeys.assets in Assets),
    includeFilter in(Assets, LessKeys.less) := "*.less",
    excludeFilter in(Assets, LessKeys.less) := "_*.less",
    mainClass in Compile := Some("ProdNettyServer"),
    mainClass in (Compile, run) := Some("DevNettyServer"),
    //workaround for gen-idea
    sourceGenerators in Compile += task {
      val dir: File = (sourceManaged in Compile).value / "controllers"
      val dirs = Seq(dir / "ref", dir / "javascript")
      dirs.foreach(_.mkdirs)
      Seq[File]()
    }
  ): _*))
*/
/*
  lazy val reactivedocs = Project("databoard", file("databoard"))
    .enablePlugins(PlayScala)
    .enablePlugins(SbtWeb)
    .settings(basicSettings: _*)
    //.settings(pipelineStages in Assets := Seq(uglify))
    .settings((WebKeys.public in Assets) := (classDirectory in Compile).value / "public")
    //.settings(formatSettings: _*)(WebKeys.public in Assets) := (classDirectory in Compile).value / "public",
    .settings(revolverSettings: _*)
    .settings(jsSettings : _*)
    .settings(sassSettings : _*)
    //.settings((compile in Compile) <<= (compile in Compile).dependsOn(WebKeys.assets in Assets))
    .settings(sassOptions in Assets ++= Seq("--compass", "-r", "compass"))
/*.settings(
    sassOptions := Seq("--compass")
)*/
    .settings(includeFilter in(Assets, LessKeys.less) := "*.less")
    .settings(excludeFilter in(Assets, LessKeys.less) := "_*.less")
    .settings(mainClass in Compile := Some("ProdNettyServer"))
    .settings(mainClass in (Compile, run) := Some("DevNettyServer"))
    .settings(
      libraryDependencies ++=
        List(
          // async, 
          // akkaActor, 
          // akkaSlf4j, 
          // reactivemongo,
          // playreactmongo,
          // jshemavalid,
          // jacksonbson,
          // wcs,
          // simplereacmongo,
          // reactivemongoext,
          play4, 
          // requirejs,
          // underscore,
          // jquery,
          bootstrap, 
          // angular,      
          // playauth,
          guice,
          ficus,
          bootstrapplay,
          silhouette,
          silhouettetest,
          // jsonvariants, 
          // playflyway, 
          // playctrl, 
          // cache, 
          // scaldiplay,
          // salat,
          // filter, 
          // jdbc, 
          // anorm, 
          // shapeless, 
          // mailer, 
          // scalatest, 
          // reflect, 
          // bcrypt, 
          // postgres, 
          // logbackClassic, 
          // scalaLog, 
          hdrHistogram))
        //compile(akkaActor, sprayCan, sprayClient, sprayRouting) ++
        //test(scalatest, akkaTestKit, sprayTestkit))
    //.dependsOn(bpCore, bpDao)
*/


  val noPublishing = Seq(publish := (), publishLocal := ())
}
