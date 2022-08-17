package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class CreateDatabase {
	
	// JDBC driver name and database URL
	   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	   static final String DB_URL = "jdbc:mysql://localhost:3306/";
	   static final String DB_NAME = "airline";
	   //  Database credentials
	   static final String USER = "root";
	   static final String PASS = "simplilearn";
	   
	   public static void main(String[] args) {
		   Connection conn = null;
		   Statement stmt = null;
		   try{
		      //STEP 2: Register JDBC driver
		      Class.forName("com.mysql.jdbc.Driver");

		      //STEP 3: Open a connection
		      System.out.println("Connecting to database...\n");
		      conn = DriverManager.getConnection(DB_URL, USER, PASS);

		      //STEP 4: Execute a query	    
		      stmt = conn.createStatement();
		      
		      //Drop database if exist
		      String sql = "DROP DATABASE IF EXISTS airline";
		      stmt.executeUpdate(sql);
		           
		      //Create Airline database
		      System.out.println("Creating database...");
		      sql = "CREATE DATABASE airline";
		      stmt.executeUpdate(sql);
		      System.out.println("airline Database created successfully...\n");
		      conn.close();
		      stmt.close();
		      
		      //Use airline database
		      System.out.println("Connecting to airline database...\n");
		      conn = DriverManager.getConnection(DB_URL + DB_NAME, USER, PASS);
		      stmt = conn.createStatement();
		      
		      //Create admin_login table
		      System.out.println("Creating admin_login Table...");
		      sql = "CREATE TABLE admin_login ("
		      		+ "username VARCHAR(255) NOT NULL PRIMARY KEY,"
		      		+ "password VARCHAR(50));";
		      stmt.executeUpdate(sql);
		      System.out.println("admin_login Table created successfully...\n");
		      
		      //Create user_Login table
		      System.out.println("Creating user_login Table...");
		      sql = "CREATE TABLE user_login ("
		      		+ "username VARCHAR(255) NOT NULL PRIMARY KEY,"
		      		+ "password VARCHAR(50));";
		      stmt.executeUpdate(sql);
		      System.out.println("user_login Table created successfully...\n");
		      
		      //Create flight_detail table
		      System.out.println("Creating flight_detail Table...");
		      sql = "CREATE TABLE flight_detail ("
		      		+ "flight_no INT NOT NULL PRIMARY KEY,"
		      		+ "airline_name VARCHAR(50),"
		      		+ "price INT,"
		      		+ "source_city VARCHAR(100),"
		      		+ "destination_city VARCHAR(100),"
		      		+ "departure_time_from_source TIME,"
		      		+ "arrival_time_to_destination TIME,"
		      		+ "total_seats INT,"
		      		+ "booked_seats INT,"
		      		+ "date_of_travel DATE,"
		      		+ "class ENUM('economy','business'));";
		      stmt.executeUpdate(sql);
		      System.out.println("flight_detail Table created successfully...\n");
		      
		    //Create register_detail table
		      System.out.println("Creating register_detail Table...");
		      sql = "CREATE TABLE register_detail ("
		      		+ "username VARCHAR(255) NOT NULL PRIMARY KEY,"
		      		+ "address VARCHAR(1000),"
		      		+ "age INT,"
		      		+ "mobile INT,"
		      		+ "full_name VARCHAR(255),"
		      		+ "identity_no VARCHAR(255),"
		      		+ "country VARCHAR(255));";	
		      stmt.executeUpdate(sql);
		      System.out.println("register_detail Table created successfully...\n");
		      
		    //Create booking table
		      System.out.println("Creating booking Table...");
		      sql = "CREATE TABLE booking ("
		      		+ "booking_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,"
		      		+ "username VARCHAR(255),"
		      		+ "flight_no INT,"
		      		+ "FOREIGN KEY (username) REFERENCES register_detail (username),"
		      		+ "FOREIGN KEY (flight_no) REFERENCES flight_detail (flight_no));";	
		      stmt.executeUpdate(sql);
		      System.out.println("booking Table created successfully...\n");
		   }catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		   }catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		   }finally{
		      //finally block used to close resources
		      try{
		         if(stmt!=null)
		            stmt.close();
		      }catch(SQLException se2){
		      }// nothing we can do
		      try{
		         if(conn!=null)
		            conn.close();
		      }catch(SQLException se){
		         se.printStackTrace();
		      }//end finally try
		   }//end try
		   System.out.println("Have A Nice Day");
		}//end main
}
