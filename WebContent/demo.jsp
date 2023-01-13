<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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

<link href="static/css/one.css" rel="stylesheet" type="text/css">
</head>

<body>
<%@include file="common/taglib.jsp" %>
<%@include file="common/header.jsp" %>
<%@include file="common/lefter.jsp" %>
<div id="right">
	<div id="right1">
		&nbsp;<h3>积分表介绍</h3>
		<br/>
		&nbsp;<h5>来源：</h5>
		&nbsp;&nbsp;&nbsp;<br/>积分表的概念来自《游戏改变人生》这本书。
		&nbsp;&nbsp;&nbsp;<br/>2009年，国际知名游戏设计师简•麦戈尼格尔遭遇了严重的脑震荡，她陷入了焦虑和沮丧，甚至想到了自杀。但她并没有消沉下去，而是把自己的恢复过程变成了一个复原力建设的游戏：SuperBetter。她在博客中分享了一套“创伤后成长”的规则，原本只是给自己设计的激励练习，没想到在美国迅速发酵。如今，美国有40多万人通过这款SuperBetter获得了个人成长，变得更加快乐和健康。SuperBetter也成为了美国国家卫生研究院的大型研究项目。
		&nbsp;&nbsp;&nbsp;<br/>在《游戏改变人生》中，麦戈尼格尔揭示了近10年的科学研究成果，包括游戏、运动和心理建设。她解释了如何改变我们应对压力、挑战和痛苦的反应，如何在日常生活中培养复原力，仅仅需要一种更加“冒险”的游戏化心态。当我们玩游戏时，我们会展示出强大的心理优势，比如乐观、创造力、勇气和决心。
		&nbsp;&nbsp;&nbsp;<br/>《游戏改变人生》包含了近100个有趣的任务，任何人都可以尝试这些游戏。另外，书中列举了很多人的真实案例，他们在面对疾病、受伤和其它重大挫折时，通过SuperBetter这款游戏变得更强大；有的人也通过这款游戏实现了减肥、跑马拉松、找到新工作等目标。
		&nbsp;&nbsp;&nbsp;<br/>积分表就是具象了奖励和任务的功能，实现了将生活转化成系统的任务，实现一个游戏化的可能。
		<br/>
		&nbsp;<h5>实现功能：</h5>
		&nbsp;&nbsp;&nbsp;<br/>1，登录
		&nbsp;&nbsp;&nbsp;<br/>2，注册
		&nbsp;&nbsp;&nbsp;<br/>3，动态显示首页
		&nbsp;&nbsp;&nbsp;<br/>4，购物车（选做，考虑要不要搞）
		&nbsp;&nbsp;&nbsp;<br/>只能用javaWeb实现，禁止使用任何框架
 		&nbsp;&nbsp;&nbsp;<br/>提交文件：
		&nbsp;&nbsp;&nbsp;<br/>	1，实训1，2，3，4
		&nbsp;&nbsp;&nbsp;<br/>	2，日记1，2，3，4，5（300字一篇
		&nbsp;&nbsp;&nbsp;<br/>	3，综合课程设计报告
		&nbsp;&nbsp;&nbsp;<br/>	4，网站本体
		&nbsp;&nbsp;&nbsp;<br/>	5，网站演示视频
	</div>
</div>
<%@include file="common/footer.jsp" %>
</body>
</html>