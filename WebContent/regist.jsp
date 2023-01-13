<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h3>用户注册</h3>
		<input type="text" id="username" autofocus="autofocus" autocomplete="off" maxlength="60" placeholder="请输入账号"/>
		<input type="password" id="password" autofocus="autofocus" autocomplete="off" maxlength="60" placeholder="请输入密码"/>
		<input type="text" oninput = "value=value.replace(/[^\d]/g,'')" id="phone" autofocus="autofocus" autocomplete="off" maxlength="60" placeholder="请输入电话号码"/>
		<button onclick="regist()">提交</button>	
	</div>
</div>
<script type="text/javascript">
	function regist(){
		var username = $('#username').val();
		var password = $('#password').val();
		var telephone = $('#phone').val();
		$.ajax({
			type:"post",//请求方式
			url:"${basePath}/controller/registController.jsp",//请求地址
			data:{"username":username,"password":password,"telephone":telephone},//传递给controller的json数据
			error:function(){
				alert("注册出错！");
			},
			success:function(data){ //返回成功执行回调函数。
				if(data == -1){
					alert('就三个空，都填上好么！');
				}else if(data == -2){
					alert('电话的格式野蛮之极了,13位的电话才是好的。');
				}else{
					alert('注册成功！');
					//注册成功后返回首页
					window.location.href = "${basePath}"; 
				}
			}
		});
	}

</script>
<%@include file="common/footer.jsp" %>
</body>
</html>