import sbt._
import Keys._
import com.typesafe.sbt.web.Import._
import com.typesafe.sbt.web._

import play.PlayScala
import play.Play.autoImport._
import PlayKeys._


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
jodaconvert,
jodamapper, scalatest, reflect, postgres, logbackClassic, scalaLog, sprayCan, sprayRouting, hdrHistogram, sprayJson))
        //compile(akkaActor, sprayCan, sprayClient, sprayRouting) ++
        //test(scalatest, akkaTestKit, sprayTestkit))
    .dependsOn(bpCore)

  lazy val bpWeb = Project("bp-web", file("bp-web"))
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

          
      playauth,securesocial, jsonvariants, playflyway, playctrl, cache, filter, jdbc, anorm, shapeless, mailer, scalatest, reflect, bcrypt, postgres, logbackClassic, scalaLog, hdrHistogram))
        //compile(akkaActor, sprayCan, sprayClient, sprayRouting) ++
        //test(scalatest, akkaTestKit, sprayTestkit))
    .dependsOn(bpCore, bpDao)
  
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
          
      playauth,securesocial, jsonvariants, playflyway, playctrl, cache, filter, jdbc, anorm, shapeless, mailer, scalatest, reflect, bcrypt, postgres, logbackClassic, scalaLog, hdrHistogram))
        //compile(akkaActor, sprayCan, sprayClient, sprayRouting) ++
        //test(scalatest, akkaTestKit, sprayTestkit))
    .dependsOn(bpCore, bpDao)




  val noPublishing = Seq(publish := (), publishLocal := ())
}
