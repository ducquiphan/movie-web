package com.java4.utils;

public class XValidate {
	public static Boolean checkMail(String mail) {
		String regexParttern = "^(?=.{1,64}@)[A-Za-z0-9_-]+(\\\\.[A-Za-z0-9_-]+)*@[^-][A-Za-z0-9-]+(\\\\.[A-Za-z0-9-]+)*(\\\\.[A-Za-z]{2,})$";
		return mail.matches(regexParttern);
	}
}
