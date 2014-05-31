import sbt._
import Keys._
import spray.revolver.RevolverPlugin.Revolver
import sbtrelease.ReleasePlugin._
import com.typesafe.sbt.SbtScalariform
import com.typesafe.sbt.SbtScalariform.ScalariformKeys
//import twirl.sbt.TwirlPlugin._

object Settings {
    import com.markatta.sbttaglist.TagListPlugin
    TagListPlugin.tagListSettings

  lazy val basicSettings = seq(
    organization  := "minority-bp",
    scalaVersion  := "2.11.0",
    resolvers    ++= Dependencies.resolutionRepos,
    //org.scalastyle.sbt.ScalastylePlugin.Settings,
    //resolvers    ++= Seq("snapshots", "releases").map(Resolver.sonatypeRepo),
    resolvers ++= Seq("Maven Central Server" at "http://repo1.maven.org/maven2"),
    //resolvers += Resolver.sonatypeRepo("snapshots"),

    unmanagedJars in Compile += file("lib/slick-pg_2.11.jar"),
    unmanagedJars in Compile += file("lib/slick-pg_core_2.11.jar"),
    unmanagedJars in Compile += file("lib/slick-pg_joda-time_2.11.jar"),

    fork in run   := true,
    scalacOptions := Seq(
      "-encoding",
      "utf8",
      "-g:vars",
      "-feature",
      "-unchecked",
      "-deprecation",
      "-target:jvm-1.6",
      "-language:postfixOps",
      "-language:implicitConversions",
      "-Xlog-reflective-calls"
    ),
    publishTo <<= version { (v: String) =>

      if (v.trim.endsWith("SNAPSHOT"))
        Some(Resolver.sftp("Kamon Snapshots Repository", "snapshots.kamon.io", "/var/local/snapshots-repo"))
      else
        Some(Resolver.sftp("Kamon Repository", "repo.kamon.io", "/var/local/releases-repo"))
    }
    ) ++ releaseSettings

    scalacOptions in Test ++= Seq("-Yrangepos")
  
  import spray.revolver.RevolverPlugin.Revolver._
  lazy val revolverSettings = Revolver.settings ++ seq(reJRebelJar := "~/.jrebel/jrebel.jar")
  //lazy val formatSettings = Twirl.settings
  //SbtScalariform.scalariformSettings ++ Seq(
  //  Twirl.settings,
    //ScalariformKeys.preferences in Compile := formattingPreferences,
  //  ScalariformKeys.preferences in Test    := formattingPreferences
  //)



  import scalariform.formatter.preferences._
  def formattingPreferences =
    FormattingPreferences()
      .setPreference(RewriteArrowSymbols, false)
      .setPreference(AlignParameters, false)
      .setPreference(AlignSingleLineCaseStatements, false)
      .setPreference(DoubleIndentClassDeclaration, false)
}
