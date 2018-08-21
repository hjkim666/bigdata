package edu.jaen.spark


import org.apache.spark.{SparkConf, SparkContext}

object Top3 {

  def main(args: Array[String]) {
    require(args.length >= 1,
      "드라이버 프로그램의 인자에 단어를 세고자 하는 " +
        "파일의 경로를 지정해 주세요")

    val conf = new SparkConf
    val sc = new SparkContext(conf)

    try {
      // 모든 단어에 대해 (단어, 등장횟수)형식의 튜플을 만든다
      val filePath = args(0)
      val wordAndCountRDD = sc.textFile(filePath)
        .flatMap(_.split("[ ,.]"))
        .filter(_.matches("""\p{Alnum}+"""))
        .map((_, 1))
        .reduceByKey(_ + _)

      // 등장횟수가 가장 많은 단어 세개를 찾는다
      val top3Words = wordAndCountRDD.map {
        case (word, count) => (count, word)
      }.sortByKey(false).map {
        case (count, word) => (word, count)
      }.take(3)

      // 등장횟수가 가장 많은 단어 톱쓰리를 표준출력으로 표시한다
      top3Words.foreach(println)
    } finally {
      sc.stop()
    }
  }
}

