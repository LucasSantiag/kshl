ThisBuild / scalaVersion := "2.12.8"

val sparkVersion = "2.4.4"

lazy val kshl = (project in file("."))
  .settings(
    name := "kshl",
    version := "0.1",
    libraryDependencies ++= Seq(
      "org.apache.spark" %% "spark-sql" % sparkVersion,
      "org.apache.spark" %% "spark-streaming" % sparkVersion,
      "org.apache.spark" %%  "spark-streaming-kafka-0-10" % sparkVersion
    )
  )
