addSbtPlugin("com.typesafe.play" % "sbt-plugin" % "2.6.13")

addSbtPlugin("com.scalapenos" % "sbt-prompt" % "1.0.2")


resolvers += Resolver.bintrayIvyRepo("rtimush", "sbt-plugin-snapshots")



// https://github.com/rtimush/sbt-updates
addSbtPlugin("com.timushev.sbt" % "sbt-updates" % "0.3.4")
