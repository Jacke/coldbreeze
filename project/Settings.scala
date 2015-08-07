import sbt._
import Keys._
import spray.revolver.RevolverPlugin.Revolver
import sbtrelease.ReleasePlugin._
import com.typesafe.sbt.SbtScalariform
import com.typesafe.sbt.SbtScalariform.ScalariformKeys
import com.typesafe.sbt.web.Import._
import com.typesafe.sbt.gzip.Import._ 

import com.typesafe.sbt.digest.Import._
import com.typesafe.sbt.rjs.Import._
import net.ground5hark.sbt.css.Import._
import com.typesafe.sbt.uglify.Import._
import com.untyped.sbtjs.Plugin._
import com.untyped.sbtsass.Plugin._
import UglifyKeys._

//import twirl.sbt.TwirlPlugin._

object Settings {
    import com.markatta.sbttaglist.TagListPlugin
    TagListPlugin.tagListSettings

    // sbt-web configuration
    // https://github.com/sbt/sbt-web
    //

    // Configure the steps of the asset pipeline (used in stage and dist tasks)
    // rjs = RequireJS, uglifies, shrinks to one file, replaces WebJars with CDN
    // digest = Adds hash to filename
    // gzip = Zips all assets, Asset controller serves them automatically when client accepts them
    pipelineStages := Seq(uglify, rjs, digest, gzip, cssCompress)
    pipelineStages in Assets := Seq(rjs)//uglify)
    //includeFilter in uglify := GlobFilter("*.js")

    CssCompress.suffix := ".min.css"
    // RequireJS with sbt-rjs (https://github.com/sbt/sbt-rjs#sbt-rjs)
    // ~~~
    JsKeys.filenameSuffix in Compile := ".min"
    RjsKeys.paths += ("jsRoutes" -> ("/jsroutes" -> "empty:"))
    RjsKeys.mainModule := "main"

    // Asset hashing with sbt-digest (https://github.com/sbt/sbt-digest)
    // ~~~
    // md5 | sha1
    //DigestKeys.algorithms := "md5"
    //includeFilter in digest := "..."
    //excludeFilter in digest := "..."

    // HTTP compression with sbt-gzip (https://github.com/sbt/sbt-gzip)
    // ~~~
    // includeFilter in GzipKeys.compress := "*.html" || "*.css" || "*.js"
    // excludeFilter in GzipKeys.compress := "..."

    // JavaScript linting with sbt-jshint (https://github.com/sbt/sbt-jshint)
    // ~~~
    // JshintKeys.config := ".jshintrc"

  lazy val basicSettings = seq(
    organization  := "net.empireinc",
    scalaVersion  := "2.11.0",
    version       := "1.0.3",
    resolvers    ++= Dependencies.resolutionRepos,
    //org.scalastyle.sbt.ScalastylePlugin.Settings,
    //resolvers    ++= Seq("snapshots", "releases").map(Resolver.sonatypeRepo),
    resolvers ++= Seq("Maven Central Server" at "http://repo1.maven.org/maven2"),
    //resolvers += Resolver.sonatypeRepo("snapshots"),


    //unmanagedJars in Compile += file("lib/slick-pg_2.11.jar"),
    //unmanagedJars in Compile += file("lib/slick-pg_core_2.11.jar"),
    //unmanagedJars in Compile += file("lib/slick-pg_joda-time_2.11.jar"),

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
  //lazy val revolverSettings = Revolver.settings ++ Revolver.enableDebugging(port = 9999, suspend = true) ++ seq(reJRebelJar := "~/.jrebel/jrebel.jar")
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
