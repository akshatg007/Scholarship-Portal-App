package com.scholarship.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class ScholarshipDb implements DbData{
	
	//This class will provide the database connection
	
private static Connection conn = null;

//We have made the constructor private, so that no one can make object of this class
private ScholarshipDb() {}

//This method will return the connection
//We have made this method static in order to call it using the class name
public static Connection getScholarshipDb() {
	return conn;
}

//This static method will execute in the starting automatically and will establish a database connection
static {
	try {
		//Registering the driver
		Class.forName(DRIVER);
		//establishing the connection
		conn = DriverManager.getConnection(URL,USER,PWD);
	} catch (Exception e) {
		System.out.println("Connection failed :"+e);
	}
}
public static void main(String[] args) {
	//you can run this class to check whether we are getting the connection or not
	System.out.println(getScholarshipDb());
}
}
