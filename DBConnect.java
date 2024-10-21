package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

	private static Connection conn = null;

	public static Connection getConn() {
		if (conn == null) {
			try {
				// Load the JDBC driver (make sure to use the right one)
				Class.forName("com.mysql.cj.jdbc.Driver");

				// Establish the connection (replace with your database details)
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/a", // Database URL
						"root", // Username
						"Admin@123" // Password
				);
			} catch (ClassNotFoundException e) {
				System.out.println("JDBC Driver not found: " + e.getMessage());
			} catch (SQLException e) {
				System.out.println("SQL Exception: " + e.getMessage());
			}
		}
		return conn;
	}
}

//import java.sql.*;
//public class DBConnect {
//
//	private static Connection conn;
//	public  static Connection getconn()
//	{
//		try
//		{
//			Class.forName("com.mysql.cj.jdbc.Driver");
//			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/a","root","Admin@123");
//		}
//		catch(Exception e)
//		{
//			e.printStackTrace();
//		}
//		return conn;
//	}
//}
