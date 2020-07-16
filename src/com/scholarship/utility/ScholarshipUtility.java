package com.scholarship.utility;

import java.util.ArrayList;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class ScholarshipUtility {

	private static String host = "localhost";
	private static final String MAIL_SERVER = "smtp.gmail.com";
	private static String uname = "aktkasyap@gmail.com";
	private static String pwd = "*****";

	public static ArrayList<String> getAllStates() {
		ArrayList<String> list = new ArrayList<String>();
		list.add("Delhi");
		list.add("Kerela");
		list.add("Rajasthan");
		list.add("Uttar Pradesh");
		list.add("Jammu & Kashmir");
		list.add("Karnataka");
		list.add("Maharashtra");
		list.add("Tamil Nadu");
		list.add("Bihar");
		list.add("Gujrat");
		list.add("Goa");
		list.add("Madhya Pradesh");
		list.add("Andra Pradesh");
		list.add("Punjab");
		list.add("Haryana");
		list.add("Telangana");
		list.add("West Bengal");
		list.add("Odhisa");
		list.add("Chhattisgarh");
		list.add("Assam");
		list.add("Jharkhand");
		list.add("Uttrakhand");
		list.add("Himachal Pradesh");
		list.add("Arunachal Pradesh");
		list.add("Sikkim");
		list.add("Tripura");
		list.add("Meghalaya");
		return list;
	}

	public static ArrayList<String> getAllStates1() {
		ArrayList<String> list = new ArrayList<String>();
		list.add("All");
		list.add("Delhi");
		list.add("Kerela");
		list.add("Rajasthan");
		list.add("Uttar Pradesh");
		list.add("Jammu & Kashmir");
		list.add("Karnataka");
		list.add("Maharashtra");
		list.add("Tamil Nadu");
		list.add("Bihar");
		list.add("Gujrat");
		list.add("Goa");
		list.add("Madhya Pradesh");
		list.add("Andra Pradesh");
		list.add("Punjab");
		list.add("Haryana");
		list.add("Telangana");
		list.add("West Bengal");
		list.add("Odhisa");
		list.add("Chhattisgarh");
		list.add("Assam");
		list.add("Jharkhand");
		list.add("Uttrakhand");
		list.add("Himachal Pradesh");
		list.add("Arunachal Pradesh");
		list.add("Sikkim");
		list.add("Tripura");
		list.add("Meghalaya");
		return list;
	}

	public static ArrayList<String> getAllStreams() {
		ArrayList<String> list = new ArrayList<String>();
		list.add("CSE");
		list.add("ME");
		list.add("EE");
		list.add("EC");
		return list;
	}

	public static ArrayList<String> getAllStreams1() {
		ArrayList<String> list = new ArrayList<String>();
		list.add("All");
		list.add("CSE");
		list.add("ME");
		list.add("EE");
		list.add("EC");
		return list;
	}

	public static int getRandom() {
		return new Random().nextInt(99999);
	}

	public static boolean sendMail(String otp, String toEmail) {
		boolean flag = false;
		try {
			Properties properties = System.getProperties();
			properties.put("mail.smtps.host", MAIL_SERVER);
			properties.put("mail.smtps.auth", "true");
			Session session = Session.getInstance(properties);
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(host));
			// msg.addRecipients(Message.RecipientType.TO, new InternetAddress(toSend));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			msg.setSubject("your OTP");
			msg.setText(otp);
			Transport tr = session.getTransport("smtps");
			tr.connect(MAIL_SERVER, uname, pwd);
			tr.sendMessage(msg, msg.getAllRecipients());
			tr.close();
			flag = true;
		} catch (Exception e) {
			System.out.println(e);
		}
		return flag;
	}

	public static boolean sendMailSpecific(String toEmail) {
		boolean flag = false;
		try {
			Properties properties = System.getProperties();
			properties.put("mail.smtps.host", MAIL_SERVER);
			properties.put("mail.smtps.auth", "true");
			Session session = Session.getInstance(properties);
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(host));
			// msg.addRecipients(Message.RecipientType.TO, new InternetAddress(toSend));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			msg.setSubject("Scholarship Notification");
			msg.setText(
					"New Scholarships are added for you,please visit website : http://localhost:8080/scholarship_portal_app/login.jsp");
			Transport tr = session.getTransport("smtps");
			tr.connect(MAIL_SERVER, uname, pwd);
			tr.sendMessage(msg, msg.getAllRecipients());
			tr.close();
			flag = true;
			System.out.println("sending success");
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			return flag;
		}
	}

}
