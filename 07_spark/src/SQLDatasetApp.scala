package edu.jaen.spark

import org.apache.spark.sql.{Row, SparkSession}
import org.apache.spark.sql.functions._
import org.apache.spark.sql.Encoder

object SQLDatasetApp
{
  val spark = SparkSession
  .builder
  .appName(getClass.getSimpleName)
  .getOrCreate()
  val sc = spark.sparkContext
  import spark.implicits._

  case class Trans(accNo: String, tranAmount: Double)
  def main(args: Array[String])
  {
    val acTransList = Seq(Trans("SB10001", 1000), Trans("SB10002",1200),
      Trans("SB10003", 8000), Trans("SB10004",400), Trans("SB10005",300), Trans("SB10006",10000),
      Trans("SB10007",500), Trans("SB10008",56), Trans("SB10009",30),Trans("SB10010",7000),
      Trans("CR10001",7000), Trans("SB10002",-10))
    val acTransDS = acTransList.toDS()
    acTransDS.show()
    val goodTransRecords = acTransDS.filter(_.tranAmount > 0).filter(_.accNo.startsWith("SB"))
    goodTransRecords.show()
    val highValueTransRecords = goodTransRecords.filter(_.tranAmount > 1000)
    highValueTransRecords.show()
    val badAmountLambda = (trans: Trans) => trans.tranAmount <= 0
    val badAcNoLambda = (trans: Trans) => trans.accNo.startsWith("SB") == false
    val badAmountRecords = acTransDS.filter(badAmountLambda)
    badAmountRecords.show()
    val badAccountRecords = acTransDS.filter(badAcNoLambda)
    badAccountRecords.show()
    val badTransRecords  = badAmountRecords.union(badAccountRecords)
    badTransRecords.show()
    val sumAmount = goodTransRecords.map(trans => trans.tranAmount).reduce(_ + _)
    val maxAmount = goodTransRecords.map(trans => trans.tranAmount).reduce((a, b) => if (a > b) a else b)
    val minAmount = goodTransRecords.map(trans => trans.tranAmount).reduce((a, b) => if (a < b) a else b)
    val acTransDF = acTransDS.toDF()
    acTransDF.show()
    acTransDF.createOrReplaceTempView("trans")
    val invalidTransactions = spark.sql("SELECT accNo, tranAmount FROM trans " +
      "WHERE (accNo NOT LIKE 'SB%') OR tranAmount <= 0")
    invalidTransactions.show()
    val acTransRDD = sc.parallelize(acTransList)
    val acTransRDDtoDF = acTransRDD.toDF()
    val acTransDFtoDS = acTransRDDtoDF.as[Trans]
    acTransDFtoDS.show()
  }
}

