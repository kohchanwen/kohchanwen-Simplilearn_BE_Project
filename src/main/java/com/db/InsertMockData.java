package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class InsertMockData {
	
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
		      
		      //Use airline database
		      System.out.println("Connecting to airline database...\n");
		      conn = DriverManager.getConnection(DB_URL + DB_NAME, USER, PASS);
		      stmt = conn.createStatement();
		      
		      //Create admin_login table
		      System.out.println("Inserting mock admin_login data...");
		      stmt.executeUpdate("DELETE FROM admin_login");
		      String sql = "insert into admin_login (username, password) values ('mmonkman0@chron.com', 'rF6aurWd'),"
		      		+ "('yredit1@theglobeandmail.com', 'E3Wvi0bVgLt'),"
		      		+ "('bbreache2@canalblog.com', 'u9rjJ1p13nwq'),"
		      		+ "('aganforth3@amazon.de', 'veQZa9'),"
		      		+ "('amutlow4@jiathis.com', 'Y3JS5J'),"
		      		+ "('kzelland5@adobe.com', 'E2DGMFvU'),"
		      		+ "('gfernihough6@amazon.co.jp', 'Tw5zdg4'),"
		      		+ "('mstandring7@last.fm', 'yLtMB1JbxK'),"
		      		+ "('adisdel8@phoca.cz', 'xkog510O'),"
		      		+ "('rhazeltine9@unesco.org', 'ymCf46S4');";
		      stmt.executeUpdate(sql);
		      System.out.println("admin_login Data created successfully...\n");
		      
		      //Create user_Login table
		      System.out.println("Inserting mock user_login data...");
		      stmt.executeUpdate("DELETE FROM user_login");
		      sql = "insert into user_login (username, password) values ('lorth0@chicagotribune.com', 'ah6Xhr5SP'),"
		      		+ "('kchard1@themeforest.net', 'v5rxyuWadZh'),"
		      		+ "('fprandi2@google.cn', 'LMsldXf'),"
		      		+ "('csimioli3@ycombinator.com', 'lpLVCuwzj'),"
		      		+ "('aberndtssen4@walmart.com', 'apn13QkbU'),"
		      		+ "('kbowdery5@goodreads.com', 'Atl239s'),"
		      		+ "('rseel6@istockphoto.com', 'KzwjRVWB'),"
		      		+ "('plipson7@altervista.org', 'Bn8pjV'),"
		      		+ "('mapdell8@woothemes.com', 'RZBWCmRYp'),"
		      		+ "('berdes9@paypal.com', 'izPbWYl6MZT');";
		      stmt.executeUpdate(sql);
		      System.out.println("user_login Data created successfully...\n");
	      
		      //Create flight_detail table
		      System.out.println("Inserting mock flight_detail data...");
		      stmt.executeUpdate("DELETE FROM flight_detail");
		      sql = "insert into flight_detail (flight_no, airline_name, price, source_city, destination_city, departure_time_from_source, arrival_time_to_destination, total_seats, booked_seats, date_of_travel, class) values (959, 'Daltfresh', 1365, 'Comrat', 'Oslo', '10:29', '15:15', 122, 13, '2022-08-27', 'economy'),"
		      		+ "(930, 'Prodder', 1776, 'Comrat', 'Oslo', '6:35', '0:59', 157, 6, '2022-08-27', 'business'),"
		      		+ "(850, 'Stronghold', 1309, 'Comrat', 'Oslo', '9:53', '14:54', 126, 14, '2022-08-27', 'economy'),"
		      		+ "(422, 'Asoka', 1944, 'Comrat', 'Oslo', '23:10', '1:00', 94, 20, '2022-08-27', 'business'),"
		      		+ "(616, 'Pannier', 1608, 'Comrat', 'Oslo', '8:17', '5:49', 78, 3, '2022-08-27', 'business'),"
		      		+ "(120, 'Matsoft', 1762, 'Comrat', 'Oslo', '8:35', '11:08', 161, 6, '2022-08-27', 'economy'),"
		      		+ "(733, 'Fintone', 857, 'Comrat', 'Oslo', '0:26', '0:51', 127, 18, '2022-08-27', 'economy'),"
		      		+ "(257, 'Ventosanzap', 1584, 'Comrat', 'Oslo', '10:06', '13:26', 158, 8, '2022-08-27', 'business'),"
		      		+ "(385, 'Tempsoft', 1672, 'Comrat', 'Oslo', '19:13', '20:32', 124, 8, '2022-08-27', 'business'),"
		      		+ "(924, 'Alpha', 1381, 'Comrat', 'Oslo', '10:50', '16:40', 188, 19, '2022-08-27', 'business');";
		      stmt.executeUpdate(sql);
		      System.out.println("flight_detail Data created successfully...\n");
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
