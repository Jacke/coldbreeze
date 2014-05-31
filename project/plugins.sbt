resolvers += "Sonatype snapshots" at "http://oss.sonatype.org/content/repositories/snapshots/"

resolvers += "Kamon Releases" at "http://repo.kamon.io"

resolvers += "Maven Central" at "http://repo1.maven.org/maven2"

resolvers += "sbt-taglist-releases" at "http://johanandren.github.com/releases/"

resolvers += "spray repo" at "http://repo.spray.io"

addSbtPlugin("com.typesafe.sbt" % "sbt-atmos" % "0.3.2")

addSbtPlugin("com.typesafe.sbt" % "sbt-scalariform" % "1.2.1")

addSbtPlugin("io.spray" % "sbt-revolver" % "0.7.1")

addSbtPlugin("com.github.gseitz" % "sbt-release" % "0.8")

addSbtPlugin("com.markatta" % "taglist-plugin" % "1.3")

addSbtPlugin("com.orrsella" % "sbt-stats" % "1.0.5")

addSbtPlugin("com.github.mpeltonen" % "sbt-idea" % "1.6.0")

addSbtPlugin("com.typesafe.sbteclipse" % "sbteclipse-plugin" % "2.4.0")

addSbtPlugin("com.typesafe.play" % "sbt-plugin" % "2.3.0-RC1")

//addSbtPlugin("io.spray" % "sbt-twirl" % "0.7.0")

addSbtPlugin("org.scalastyle" %% "scalastyle-sbt-plugin" % "0.4.0")