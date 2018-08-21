p100 

#Read a textfile
val textRDD = sc.textFile("file:/home/hadoop/spark/README.md")
val textArray = textRDD.collect
textArray.foreach(println) 

textRDD.map(_.split("[ ,.]")).collect  
textRDD.flatMap(_.split("[ ,.]")).collect 

val textMapRDD = textRDD.flatMap(_.split("[ ,.]"))
val wordRDD = textMapRDD.filter(_.matches("""\p{Alnum}+"""))

val wordArray = wordRDD.collect
결과> wordRDD: Array[String] = Array(Apache, Spark, Spark, is, a, fast, and, general, cluster, computing, system, for, Big, Data, It, provides, APIs, in, Scala, Java, Python, and, R, and, an, optimized, engine, that, supports, general, computation, graphs, for, data, analysis, It, also, supports, a, rich, set, of, tools, including, Spark, SQL, for, SQL, and, DataFrames, MLlib, for, machine, learning, GraphX, for, graph, processing, and, Spark, Streaming, for, stream, processing, apache, Online, Documentation, You, can, find, the, latest, Spark, documentation, including, a, programming, guide, on, the, web, apache, This, README, file, only, contains, basic, setup, instructions, Building, Spark, Spark, is, built, using, apache, To, build, Spark, and, its, example, programs, clean, package, do, ...

wordRDD.map((_,1)).take(10)

val mapRDD = wordRDD.map((_,1))
val reducedRDD = mapRDD.reduceByKey((a,b) => a+b)	

reducedRDD.foreach(println)

# 최종  
val textRDD = sc.textFile("file:/home/hadoop/spark/README.md")
val textMapRDD = textRDD.flatMap(_.split("[ ,.]"))
val wordRDD = textMapRDD.filter(_.matches("""\p{Alnum}+"""))
val mapRDD = wordRDD.map((_,1))
val reducedRDD = mapRDD.reduceByKey((a,b) => a+b)
reducedRDD.collect
reducedRDD.sortBy(_._2, false).collect


#
