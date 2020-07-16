package com.scholarship.db;

public interface DbData {
	
	//This interface contains all the database connection related information
	
	String USER="root";
	String PWD="root";
	String URL = "jdbc:mysql://localhost:3306/scholarship_portal?useSSL=false";
	String DRIVER = "com.mysql.jdbc.Driver";
}
