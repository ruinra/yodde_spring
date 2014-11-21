<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.apache.commons.httpclient.HttpClient" %>
<%@ page import="org.apache.commons.httpclient.methods.GetMethod" %>
<%@ page import="org.apache.commons.httpclient.HttpStatus" %>
<%
	String key = "fece5eed2b355fdeb56e8ce1c7aea4fc";
	String target = request.getParameter("target");
	String query = request.getParameter("query");
	String url = "http://openapi.naver.com/search?query="+query+"&target="+target+"&key="+key;
	request.setCharacterEncoding("utf-8");
	HttpClient client = new HttpClient();
	GetMethod method = new GetMethod(url);
	
	try{
		int statusCode = client.executeMethod(method);
		out.clearBuffer();
		response.reset();
		response.setStatus(statusCode);
		if(statusCode == HttpStatus.SC_OK) {
			String result = method.getResponseBodyAsString();
			response.setContentType("text/xml;charset=utf-8");
			out.println(result);
		}
	} catch (Exception e) {
		out.println(e.toString());
	} finally {
		if(method != null) method.releaseConnection();
	}
%>
