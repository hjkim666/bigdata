package edu.jaen.spark

import org.apache.log4j.{Level, Logger}
import org.apache.spark.storage.StorageLevel
import org.apache.spark.streaming.{Seconds, StreamingContext}
import org.apache.spark.{SparkConf, SparkContext}

object StreamingSecond {
  def main(args: Array[String]) {
    Logger.getRootLogger.setLevel(Level.WARN)

    val sparkConf = new SparkConf().setAppName("StreamingFirst")
    val sc = new SparkContext(sparkConf)
    val ssc = new StreamingContext(sc, Seconds(10))
    ssc.checkpoint("/tmp")

    val lines = ssc.socketTextStream(args(0),
                                     args(1).toInt,
                                     StorageLevel.MEMORY_AND_DISK_SER)
    val errorLines = lines.filter(line => line.contains("ERROR") | line.contains("error"))
    errorLines.print()
    errorLines.countByWindow(Seconds(30), Seconds(10)).print()

    ssc.start()
    ssc.awaitTermination()
  }
}
