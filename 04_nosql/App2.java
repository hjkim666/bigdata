package com.oj.mgapp;
import java.net.UnknownHostException;
import java.util.Date;
import org.bson.Document;
import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

public class App2 {
	public static void main(String[] args) throws UnknownHostException {

		try {

			/**** Connect to MongoDB ****/
			MongoClient mongo = new MongoClient("localhost", 27017);

			/**** Get database ****/
			MongoDatabase  db = mongo.getDatabase("test");

			/**** Get collection / table from 'testdb' ****/
			MongoCollection<Document> table = db.getCollection("stud");
			
			/**** Insert ****/
			 Document doc = new Document("name", "mkyong")
		                .append("class", "10")
		                .append("createdDate", new Date());
	
			table.insertOne(doc);

			/**** Find and display ****/
			Document searchQuery = new Document("name", "mkyong");
			Document cursor = table.find(searchQuery).first();
			System.out.println(cursor.toJson());
			
			MongoCursor<Document> cursor2 = table.find().iterator();
			try {
			    while (cursor2.hasNext()) {
			        System.out.println(cursor2.next().toJson());
			    }
			} finally {
				cursor2.close();
			}
			
			for (Document cur : table.find()) {
			    System.out.println(cur.toJson());
			}
 
			/**** Update ****/
			Document doc2 = new Document("name", "mkyong");
			table.updateOne(doc2, new Document("$set", new Document("name", "mkyong-updated")));
			
			/**** Find and display ****/
			Document searchQuery2 = new Document("name", "mkyong-updated");
			MongoCursor<Document> cursor3 = table.find(searchQuery2).iterator();
			try {
			    while (cursor3.hasNext()) {
			        System.out.println(cursor3.next().toJson());
			    }
			} finally {
			    cursor3.close();
			}

			System.out.println("Done");

		} catch (MongoException e) {
			e.printStackTrace();
		}
	}
}
