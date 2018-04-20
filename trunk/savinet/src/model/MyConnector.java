/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author imdadareeph
 */
public class MyConnector {

    private static String DBUrl = "jdbc:mysql://localhost:3306/asinet";
    private Connection conn = null;

    // returns a Statement on successful connection
    public Connection connect()
            throws SQLException, Exception {
        // try to make a JDBC connection to the "test" database
        Class.forName("com.mysql.jdbc.Driver").newInstance();
       try {
			conn = DriverManager.getConnection(DBUrl,"root", "root");

		} catch (SQLException e) {
			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
			//return;
		}
       // Statement stmt = conn.createStatement();
        //return the new statement for use by other objects
        return conn;
    }
    
    public Connection connectAws() {
   	 if (System.getProperty("RDS_HOSTNAME") != null) {
   	 try {
   	 Class.forName("com.mysql.jdbc.Driver");
   	 String dbName = System.getProperty("RDS_DB_NAME");
   	 String userName = System.getProperty("RDS_USERNAME");
   	 String password = System.getProperty("RDS_PASSWORD");
   	 String hostname = System.getProperty("RDS_HOSTNAME");
   	 String port = System.getProperty("RDS_PORT");
   	 String jdbcUrl = "jdbc:mysql://" + hostname + ":" + port + "/" + dbName + "?user=" + userName + "&password=" + password;
   	 Connection con = DriverManager.getConnection(jdbcUrl);
   	 return con;
   	 }
   	 catch (ClassNotFoundException e) { }
   	 catch (SQLException e) { }
   	 }
   	 return null;
   	 }

    public void disconnect(Statement stmt) {
        // close the statement and connection if they exist
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException sqlEx) {
                // ignore
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException sqlEx) {
                // ignore
            }
        }
    }

}
