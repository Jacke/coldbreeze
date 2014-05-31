import sbt._
import Keys._
import play.PlayScala
import play.Play.autoImport._
import PlayKeys._


object Build extends Build {
  import Settings._
  import Dependencies._

  mainClass := Some("main.scala.BPServiceApp")

  lazy val root = Project("root", file("."))
    .aggregate(bpCore, bpSpray, bpPlay)
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
        List(async, reflect, scalaz, nscala, play, scalatest, scalaLog, logback, sprayClient, hdrHistogram))
        //compile(akkaActor, sprayCan, sprayClient, sprayRouting) ++
        //provided(logback) ++
        //test(scalatest, akkaTestKit, sprayTestkit, akkaSlf4j, logback))


  lazy val bpSpray = Project("bp-spray", file("bp-spray"))
    .settings(basicSettings: _*)
    //.settings(formatSettings: _*)
    .settings(revolverSettings: _*)
    .settings(
      libraryDependencies ++=
        List(async, akkaActor,akkaSlf4j, slick, play, scalatest, reflect, postgres, logbackClassic, scalaLog, sprayCan, sprayRouting, hdrHistogram, sprayJson))
        //compile(akkaActor, sprayCan, sprayClient, sprayRouting) ++
        //test(scalatest, akkaTestKit, sprayTestkit))
    .dependsOn(bpCore)

  lazy val bpPlay = Project("bp-play", file("bp-play"))
    .enablePlugins(PlayScala)
    .settings(basicSettings: _*)
    //.settings(formatSettings: _*)
    .settings(revolverSettings: _*)
    .settings(
      libraryDependencies ++=
        List(async, akkaActor, akkaSlf4j, slick, play, cache, filter, jdbc, anorm, shapeless, mailer, angular, scalatest, reflect, bcrypt, postgres, logbackClassic, scalaLog, hdrHistogram))
        //compile(akkaActor, sprayCan, sprayClient, sprayRouting) ++
        //test(scalatest, akkaTestKit, sprayTestkit))
    .dependsOn(bpCore)



  val noPublishing = Seq(publish := (), publishLocal := ())
}