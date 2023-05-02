package com.chanyongyang.examples;

import java.util.Properties;

public class GMailer {

	public static void gmailSend(){
		String user = "yijiyoon06@gmail.com";
		String password = "password";
		
		Properties prop = new Properties();
		prop.put("mail.smtp", "smtp.gmail.com");
	}
	
}
