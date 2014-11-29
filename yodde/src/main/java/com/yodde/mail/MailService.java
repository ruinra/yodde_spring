package com.yodde.mail;

import java.io.Serializable;

import org.springframework.mail.javamail.JavaMailSender;

public interface MailService extends Serializable {
	void setMailSender(JavaMailSender mailSender);
	int sendMail(String subject, String text, String toUser, String[] toCC);
}
