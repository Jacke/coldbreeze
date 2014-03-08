//name := "MajorityBP"

//version := "0.1"

//scalaVersion := "2.10.2"


//libraryDependencies ++= Dependencies.bp_core

//scalacOptions in Test ++= Seq("-Yrangepos")

// Read here for optional dependencies:
// http://etorreborre.github.io/specs2/guide/org.specs2.guide.Runners.html#Dependencies

//resolvers ++= Seq("snapshots", "releases").map(Resolver.sonatypeRepo)

libraryDependencies += "com.lihaoyi.utest" % "utest_2.10" % "0.1.1"

testFrameworks += new TestFramework("utest.runner.JvmFramework")

