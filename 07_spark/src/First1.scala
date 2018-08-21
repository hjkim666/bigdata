package edu.jaen.spark

import org.apache.spark.{SparkConf, SparkContext}

object First1{

  def main(args: Array[String]) {

    //val conf = new SparkConf().setAppName("First1").setMaster("local[*]")
    //val conf = new SparkConf().setAppName("First1").setMaster("local")
    //val conf = new SparkConf().setAppName("First1").setMaster("spark://hadoop01:7077")
    val conf = new SparkConf().setAppName("First1").setMaster("yarn")
    val sc = new SparkContext(conf)

    val readme = sc.textFile("README.md")

    val logData = sc.textFile("README.md", 2).cache()
    val numAs = logData.filter(line => line.contains("a")).count()
    val numBs = logData.filter(line => line.contains("b")).count()
    println("Lines with a: %s, Lines with b: %s".format(numAs, numBs))
  }
}