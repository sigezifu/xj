<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored ="False"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="service.LoginService"%>
<%@ page language="java" import="bean.*"%>
<%@ page language="java" import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="util.*"%>
<%

	//设置请求的编码
	//request.setCharacterEncoding("UTF-8");
	//获取客户端传递过来参数
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String telephone = request.getParameter("telephone");
	//System.out.println(username);
	//System.out.println(password);
	//System.out.println(telephone);
	//如果不为空
	
	if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password) || StringUtils.isEmpty(telephone)) {
		out.print("-1");
		}else if (telephone.length() < 13 || telephone.length() > 13) {
			out.print("-2");
		}else{
			out.print("1");
			String id = UUID.randomUUID() + "";
			String createTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			DataBaseUtils.update("INSERT INTO t_user(id,username,password,sex,create_time,is_delete,address,telephone) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)", id,username,password,0,createTime,0,"保密",telephone);

		}
%>