<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored ="False"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>
<meta charset="UTF-8">
<title>积分表</title>
<meta name=”viewport” content=”width=device-width, initial-scale=1″ />
<!--  viewport是网页默认的宽度和高度，上面这行代码的意思是，网页宽度默认等于屏幕宽度（width=device-width），原始缩放比例（initial-scale=1）为1.0，即网页初始大小占屏幕面积的100%。
所有主流浏览器都支持这个设置，包括IE9。对于那些老式浏览器（主要是IE6、7、8），需要使用css3-mediaqueries.js。-->

<!–[if lt IE 9]>
<script src=”http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js”>
</script>
<![endif]–>

<!--需要使用css3-mediaqueries.js。-->

<script src="static/js/jquery-3.6.0.min.js">
</script>



<link href="static/css/one.css" rel="stylesheet" type="text/css">
</head>

<body>
<%@include file="common/header.jsp" %>
<%@include file="common/lefter.jsp" %>
<div id="right">
	<div id="right1">
		<h3>用户登录</h3>
		<input type="text" id="username" autofocus="autofocus" autocomplete="off" maxlength="60" placeholder="请输入账号"/>
		<input type="password" id="password" autofocus="autofocus" autocomplete="off" maxlength="60" placeholder="请输入密码"/>
		<button onclick="login()">登录</button>
	</div>
</div>
<script>
function login(){
	var username = $('#username').val();
	var password = $('#password').val();
	$.ajax({
		type:"post",//请求方式
		url:"${basePath}/controller/loginController.jsp",//请求地址
		data:{"username":username,"password":password},//传递给controller的json数据
		error:function(){//如果出错了，将事件重新绑定
			alert("登陆出错！");
		},
		success:function(data){ //返回成功执行回调函数。
			if(data == -1){
				alert('用户名和密码不能为空！');
			}else if(data == -2){
				alert('用户名不存在！');
			}else if(data == -3){
				alert('用户名或密码错误！');
			}else{
				alert('登陆成功！');
				//登录成功后返回首页
				window.location.href = "${basePath}"; 
			}
		}
	});
	
	
}
</script>
<%@include file="common/footer.jsp" %>
</body>
</html>