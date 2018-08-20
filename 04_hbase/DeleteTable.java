import java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;

public class DeleteTable {
	public static void main(String[] args) throws IOException {
		Configuration config = HBaseConfiguration.create();

		// Create an admin object using the config
		Connection conn = ConnectionFactory.createConnection(config);
		Admin admin = conn.getAdmin();

		// Disable, and then delete the table
		admin.disableTables("people");
		admin.deleteTables("people");
		admin.close();
	}
}
