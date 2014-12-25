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
