import sbt._
import Keys._
import com.typesafe.sbt.web.Import._
import com.typesafe.sbt.web._

import play.PlayScala
import play.Play.autoImport._
import sass.Import._
import PlayKeys._

import com.untyped.sbtjs.Plugin._
import com.untyped.sbtsass.Plugin._

import com.typesafe.sbt.less.Import._ 
import com.typesafe.sbt.uglify.Import._
import UglifyKeys._


object Build extends Build {
  import Settings._
  import Dependencies._

  mainClass := Some("main.scala.BPServiceApp")

  lazy val commonSettings = Seq(
    ivyScala := ivyScala.value map { _.copy(overrideScalaVersion = true) }
  )



  initialCommands in console := "ammonite.repl.Repl.main(null)"
    
  lazy val root = Project("root", file("."))
    .aggregate(bpCore, bpDao, bpWeb)
    .settings(basicSettings: _*)
    .settings(commonSettings: _*)
    //.settings(formatSettings: _*)
    .settings(noPublishing: _*)
    .settings(revolverSettings: _*)


  lazy val bpCore = Project("bp-core", file("bp-core"))
    .settings(basicSettings: _*)
    //.settings(formatSettings: _*)
    .settings(revolverSettings: _*)

    .settings(
      libraryDependencies ++=
        List(
          scalarx,
          async, 
          amonite, 
          reflect, 
          akkaActor, 
          scaldiakka, 
          dispatch, 
          scalaz, 
          mechanize,nscala, 
          play, 
          scalatest, 
          scalaLog, 
          logback, 
          syslog,  
	  scaldi,
          sprayClient, 
          hdrHistogram))

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
          akkaSlf4j, 
          slick, 
          play,
          jodatime,
          jwtCore,
          jwtApi,
          //slickpg,
          //slickpgcore,
          //slickpgplay,
          //slickjoda,
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

        //compile(akkaActor, sprayCan, sprayClient, sprayRouting) ++
        //test(scalatest, akkaTestKit, sprayTestkit))
    .dependsOn(bpCore)

  lazy val bpWeb = Project("bp-web", file("bp-web"))
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
          async, 
          akkaActor, 
          akkaSlf4j, 
          slick, 
          play, 
          requirejs,
          underscore,
          jquery,
          bootstrap, 
          angular,
          apamailer, 
          logentries, 
          playauth,
          securesocial,
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
          hicaricp,
          jdbc, 
          anorm, 
          shapeless, 
          mailer, 
          scalatest, 
          reflect, 
          bcrypt, 
          postgres, 
          logbackClassic, 
          scalaLog, 
          hdrHistogram))

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
          async, 
          akkaActor, 
          akkaSlf4j, 
          slick, 
          play, 
          requirejs,
          underscore,
          jquery,
          bootstrap, 
          angular,      
          playauth,
          guice,
          silhouette,
 //         silhouettetest,
          jsonvariants, 
          playflyway, 
          playctrl, 
          cache, 
          filter, 
          jdbc, 
          anorm, 
          shapeless, 
          mailer, 
          scalatest, 
          reflect, 
          bcrypt, 
          postgres, 
          logbackClassic, 
          scalaLog, 
          hdrHistogram))
        //compile(akkaActor, sprayCan, sprayClient, sprayRouting) ++
        //test(scalatest, akkaTestKit, sprayTestkit))
    .dependsOn(bpCore, bpDao)




  val noPublishing = Seq(publish := (), publishLocal := ())
}
