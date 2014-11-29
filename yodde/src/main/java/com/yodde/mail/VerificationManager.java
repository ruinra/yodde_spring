package com.yodde.mail;

public class VerificationManager {
	private int isOk = 1;
	
	public VerificationManager(){}
	
	public VerificationManager(String emailAddress){
		MailService ms = new MailServiceImpl();
		MailConfig mc = new MailConfig();
		ms.setMailSender(mc.mailSender());
		isOk = ms.sendMail("testSendMail", "인증하실래여?ㅋㅋㅋ", emailAddress, null);
	}
	
	public int getIsOk() {return isOk;}
	
	public int sendVerificationMail(String email, int code){
		MailService ms = new MailServiceImpl();
		MailConfig mc = new MailConfig();
		ms.setMailSender(mc.mailSender());
		
		//String content = "<a href='localhost:8081/lake/verification?code=" + code +"'>localhost:8081/lake/verification?code="+code+"<a>";
		String content = "<a href='www.naver.com'>localhost:8081/lake/verification?code="+code+"<a>";
		isOk = ms.sendMail("[요때]회원가입 인증메일입니다.", content, email, null);
		
		return isOk;
	}
}
