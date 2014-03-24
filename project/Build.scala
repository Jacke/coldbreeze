import sbt._
import Keys._

object Build extends Build {
  import Settings._
  import Dependencies._



  mainClass := Some("main.scala.BPServiceApp")

  lazy val root = Project("root", file("."))
    .aggregate(bpCore, bpSpray)
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
        List(akkaActor, sprayCan, scalatest, sprayClient, mongodb, sprayRouting, hdrHistogram, sprayJson)) 
        //compile(akkaActor, sprayCan, sprayClient, sprayRouting) ++
        //provided(logback) ++
        //test(scalatest, akkaTestKit, sprayTestkit, akkaSlf4j, logback))


  lazy val bpSpray = Project("bp-spray", file("bp-spray"))
    .settings(basicSettings: _*)
    //.settings(formatSettings: _*)
    .settings(revolverSettings: _*)
    .settings(
      libraryDependencies ++=
        List(akkaActor,akkaSlf4j, slick, postgres, slickpg, logbackClassic, sprayCan, sprayClient, sprayRouting, hdrHistogram, sprayJson))
        //compile(akkaActor, sprayCan, sprayClient, sprayRouting) ++
        //test(scalatest, akkaTestKit, sprayTestkit))
    .dependsOn(bpCore)



  val noPublishing = Seq(publish := (), publishLocal := ())
}