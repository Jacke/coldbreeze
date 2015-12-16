resolvers += "Sonatype snapshots" at "http://oss.sonatype.org/content/repositories/snapshots/"

resolvers += "sonatype-releases" at "https://oss.sonatype.org/content/repositories/releases/"

resolvers += "bintray-sbt-plugin-releases" at "http://dl.bintray.com/content/sbt/sbt-plugin-releases"

resolvers += "Kamon Releases" at "http://repo.kamon.io"

resolvers += "Maven Central" at "http://repo1.maven.org/maven2"

resolvers += "scalaz-bintray" at "http://dl.bintray.com/scalaz/releases"

resolvers += "MVN" at "http://repo.typesafe.com/typesafe/releases/"

resolvers += "sonatype-snapshots" at "https://oss.sonatype.org/content/repositories/snapshots/"

resolvers += Resolver.url("GitHub repository", url("http://shaggyyeti.github.io/releases"))(Resolver.ivyStylePatterns)


resolvers += "Typesafe"     at "http://repo.typesafe.com/typesafe/maven-releases"

resolvers += "sbt-taglist-releases" at "http://johanandren.github.com/releases/"

resolvers += "spray repo" at "http://repo.spray.io"

resolvers += Resolver.url("heroku-sbt-plugin-releases",
  url("http://dl.bintray.com/heroku/sbt-plugins/"))(Resolver.ivyStylePatterns)


resolvers += Resolver.url("untyped", url("http://ivy.untyped.com"))(Resolver.ivyStylePatterns)

//resolvers += "Linter Repository" at "https://hairyfotr.github.io/linteRepo/releases"

//addCompilerPlugin("com.foursquare.lint" %% "linter" % "0.1.9")

addSbtPlugin("org.scalastyle" %% "scalastyle-sbt-plugin" % "0.6.0")


addSbtPlugin("com.typesafe.sbt" % "sbt-atmos" % "0.3.2")


addSbtPlugin("io.spray" % "sbt-revolver" % "0.7.1")

addSbtPlugin("com.github.gseitz" % "sbt-release" % "0.8")

addSbtPlugin("com.markatta" % "taglist-plugin" % "1.3")

addSbtPlugin("com.orrsella" % "sbt-stats" % "1.0.5")

addSbtPlugin("com.github.mpeltonen" % "sbt-idea" % "1.6.0")

addSbtPlugin("com.typesafe.sbteclipse" % "sbteclipse-plugin" % "2.4.0")

addSbtPlugin("com.typesafe.play" % "sbt-plugin" % "2.3.0" exclude("org.slf4j", "slf4j-simple"))

// gulp required new version of play

//addSbtPlugin("com.github.mmizutani" % "sbt-play-gulp" % "0.0.6")

//addSbtPlugin("io.spray" % "sbt-twirl" % "0.7.0")

addSbtPlugin("org.scalastyle" %% "scalastyle-sbt-plugin" % "0.4.0")

//addSbtPlugin("com.typesafe.sbt" % "sbt-jshint" % "1.0.1")

addSbtPlugin("com.typesafe.sbt" % "sbt-less" % "1.0.0")

addSbtPlugin("com.typesafe.sbt" % "sbt-rjs" % "1.0.7")

addSbtPlugin("com.typesafe.sbt" % "sbt-digest" % "1.0.0")

addSbtPlugin("io.teamscala.sbt" % "sbt-babel" % "1.0.2")

addSbtPlugin("com.typesafe.sbt" % "sbt-gzip" % "1.0.0")

addSbtPlugin("com.typesafe.sbt" % "sbt-coffeescript" % "1.0.0")

addSbtPlugin("com.typesafe.sbt" % "sbt-mocha" % "1.0.0")

addSbtPlugin("me.lessis" % "bintray-sbt" % "0.1.1")
  
  
//addSbtPlugin("default" % "sbt-sass" % "0.1.9")


resolvers += Resolver.url("GitHub repository", url("http://shaggyyeti.github.io/releases"))(Resolver.ivyStylePatterns)

addSbtPlugin("default" % "sbt-sass" % "0.1.9")


//addSbtPlugin("au.com.onegeek.sbtdotenv" % "sbt-dotenv" % "1.0.17")


addSbtPlugin("com.typesafe.sbt" % "sbt-uglify" % "1.0.3")

addSbtPlugin("net.ground5hark.sbt" % "sbt-css-compress" % "0.1.3")

addSbtPlugin("com.untyped" % "sbt-js"       % "0.8-M3")

addSbtPlugin("com.untyped" % "sbt-sass"     % "0.8-M3")

addSbtPlugin("com.github.sbtliquibase" % "sbt-liquibase" % "0.1.0-SNAPSHOT")


addSbtPlugin("fi.gekkio.sbtplugins" % "sbt-jrebel-plugin" % "0.10.0")


//addSbtPlugin("com.tuplejump" % "sbt-yeoman" % "0.8.1")

addSbtPlugin("com.typesafe.sbt" % "sbt-scalariform" % "1.3.0")


libraryDependencies += "com.novocode" % "junit-interface" % "0.11" % "test"


addSbtPlugin("net.virtual-void" % "sbt-dependency-graph" % "0.8.0")