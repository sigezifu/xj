<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored ="False"%>
<%
	String path=request.getContextPath();
	int port=request.getServerPort();
	String basePath=null;
	if(port==90){
		basePath=request.getScheme()+"://"+request.getServerName()+path;
	}else{
		basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	}
	request.setAttribute("basePath",basePath);
%>