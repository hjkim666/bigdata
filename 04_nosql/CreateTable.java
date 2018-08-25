import java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;

public class CreateTable {
	public static void main(String[] args) throws IOException {
		Configuration config = HBaseConfiguration.create();

		// create an admin object using the config
		Connection conn = ConnectionFactory.createConnection(config);
		Admin admin = conn.getAdmin();

		// create the table
		HTableDescriptor tableDescriptor = new HTableDescriptor(TableName.valueOf("people"));
		//with two column families
		tableDescriptor.addFamily(new HColumnDescriptor("name"));
		tableDescriptor.addFamily(new HColumnDescriptor("contactinfo"));
		admin.createTable(tableDescriptor);

		// define some people
		String[][] people = { 
				{ "1", "Marcel", "Haddad", "marcel@fabrikam.com" },
				{ "2", "Franklin", "Holtz", "franklin@contoso.com" },
				{ "3", "Dwayne", "McKee", "dwayne@fabrikam.com" },
				{ "4", "Rae", "Schroeder", "rae@contoso.com" }, 
				{ "5", "Rosalie", "burton", "rosalie@fabrikam.com" },
				{ "6", "Gabriela", "Ingram", "gabriela@contoso.com" } };


		Table table = conn.getTable(TableName.valueOf("people"));

		try {
			// Add each person to the table
			// Use the `name` column family for the name
			// Use the `contactinfo` column family for the email
			for (int i = 0; i < people.length; i++) {
				Put person = new Put(Bytes.toBytes(people[i][0]));
				person.addColumn(Bytes.toBytes("name"), Bytes.toBytes("first"), Bytes.toBytes(people[i][1]));
				person.addColumn(Bytes.toBytes("name"), Bytes.toBytes("last"), Bytes.toBytes(people[i][2]));
				person.addColumn(Bytes.toBytes("contactinfo"), Bytes.toBytes("email"), Bytes.toBytes(people[i][3]));
				table.put(person);
			}
		} finally {
			table.close();
			conn.close();
		}

	}
}