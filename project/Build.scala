import sbt._
import Keys._
import com.typesafe.sbt.web.Import._
import com.typesafe.sbt.web._

import play.PlayScala
import play.Play.autoImport._
import PlayKeys._

import com.typesafe.sbt.less.Import._ 

object Build extends Build {
  import Settings._
  import Dependencies._

  mainClass := Some("main.scala.BPServiceApp")

  lazy val root = Project("root", file("."))
    .aggregate(bpCore, bpDao, bpWeb)
    .settings(basicSettings: _*)
    //.settings(formatSettings: _*)
    .settings(noPublishing: _*)
    .settings(revolverSettings: _*)


  lazy val bpCore = Project("bp-core", file("bp-core"))
    .settings(basicSettings: _*)
    //.settings(formatSettings: _*)
    .settings(revolverSettings: _*)

    .settings(
      libraryDependencies ++=
        List(async, reflect, akkaActor, dispatch, scalaz, mechanize,nscala, play, scalatest, scalaLog, 
logback, 
sprayClient, hdrHistogram))

        //compile(akkaActor, sprayCan, sprayClient, sprayRouting) ++
        //provided(logback) ++
        //test(scalatest, akkaTestKit, sprayTestkit, akkaSlf4j, logback))


  lazy val bpDao = Project("bp-dao", file("bp-dao"))
    .settings(basicSettings: _*)
    //.settings(formatSettings: _*)
    .settings(revolverSettings: _*)
    .settings(
      libraryDependencies ++=
        List(async, akkaSlf4j, slick, play,jodatime,
slickpg, slickpgcore,
slickjoda,
jodaconvert,
jodamapper, scalatest, reflect, postgres, logbackClassic, scalaLog, sprayCan, sprayRouting, hdrHistogram, sprayJson))
        //compile(akkaActor, sprayCan, sprayClient, sprayRouting) ++
        //test(scalatest, akkaTestKit, sprayTestkit))
    .dependsOn(bpCore)

  lazy val bpWeb = Project("bp-web", file("bp-web"))
    .enablePlugins(PlayScala)
    .enablePlugins(SbtWeb)
    .settings(basicSettings: _*)
    .settings((WebKeys.public in Assets) := (classDirectory in Compile).value / "public")
    //.settings(formatSettings: _*)(WebKeys.public in Assets) := (classDirectory in Compile).value / "public",
    .settings(revolverSettings: _*)
    //.settings((compile in Compile) <<= (compile in Compile).dependsOn(WebKeys.assets in Assets))
    .settings(includeFilter in(Assets, LessKeys.less) := "*.less")
    .settings(excludeFilter in(Assets, LessKeys.less) := "_*.less")
    .settings(mainClass in Compile := Some("ProdNettyServer"))
    .settings(mainClass in (Compile, run) := Some("DevNettyServer"))
    .settings(
      libraryDependencies ++=
        List(async, akkaActor, akkaSlf4j, slick, play, 
          requirejs,
          underscore,
          jquery,
          bootstrap, 
          angular,

          
      playauth,securesocial, jsonvariants, playflyway, playctrl, cache, filter, jdbc, anorm, shapeless, mailer, scalatest, reflect, bcrypt, postgres, logbackClassic, scalaLog, hdrHistogram))
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
  lazy val reactivedocs = Project("reactive-docs", file("reactive-docs"))
    .enablePlugins(PlayScala)
    .enablePlugins(SbtWeb)
    .settings(basicSettings: _*)
    //.settings(formatSettings: _*)
    .settings(revolverSettings: _*)
    .settings(
      libraryDependencies ++=
        List(async, akkaActor, akkaSlf4j, slick, play, 
          requirejs,
          underscore,
          jquery,
          bootstrap, 
          angular,
          
      playauth,
      securesocial, 
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
