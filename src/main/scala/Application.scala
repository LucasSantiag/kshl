import org.apache.spark._
import org.apache.spark.sql.SparkSession
import org.apache.spark.streaming.{Seconds, StreamingContext}

object Application extends App {

  def apply() = {
    val sparkConf = new SparkConf()
      .setAppName("lucas_sparking")
      .setMaster("local[4]")

    val session = SparkSession
      .builder()
      .config(sparkConf)
      .getOrCreate()

    val ssc = new StreamingContext(session.sparkContext, Seconds(1))
  }

}
