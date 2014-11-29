package com.yodde.mail;


import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailServiceImpl implements MailService {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
		
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MessageSource messageSource;	
	
	@Override
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	@Override
	public int sendMail(String subject, String text, String toUser,
			String[] toCC) {
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			if(toCC != null) {
				messageHelper.setCc(toCC);
			}
			messageHelper.setSubject(subject);
			messageHelper.setFrom(toUser);
			messageHelper.setTo(toUser);
			messageHelper.setText(text, true);
			
			mailSender.send(message);
			
		}catch (MessagingException e) {
			e.printStackTrace();
			return 1;
		}
		
		return 0;
	}

}
