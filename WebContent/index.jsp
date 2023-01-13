<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored ="False" import="java.util.*"%>
<%@ page import="dao.GoodsDao" %>
<%@ page import="bean.Goods"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>积分表</title>
<meta name="viewport" content="width=device-width,initial-scale=1" />
<!--  viewport是网页默认的宽度和高度，上面这行代码的意思是，网页宽度默认等于屏幕宽度（width=device-width），原始缩放比例（initial-scale=1）为1.0，即网页初始大小占屏幕面积的100%。
所有主流浏览器都支持这个设置，包括IE9。对于那些老式浏览器（主要是IE6、7、8），需要使用css3-mediaqueries.js。-->
<!–[if lt IE 9]>
<script src=”http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js”>
</script>
<![endif]–>
<!--需要使用css3-mediaqueries.js。-->

<link href="static/css/index.css" rel="stylesheet" type="text/css">
<link href="static/css/one.css" rel="stylesheet" type="text/css">

</head>
<script language="JavaScript" type="text/javascript"> 
function djs(){ 
	var urodz= new Date("2/1/2022");
	var now = new Date(); 
	var num 
	var ile = urodz.getTime() - now.getTime();
	var dni = Math.floor(ile / (1000 * 60 * 60 * 24));
	if (dni >1){
		num=dni+1;
	}else if (dni == 1){
		num=2;
		} 
	else if (dni == 0){
		num=1; 
		}
	else{ 
		num=0;
		}
	document.write(num);
} 
</script> 
<body id="showTime()">
<%@include file="common/taglib.jsp" %>
<%@include file="common/header.jsp" %>
<%@include file="common/lefter.jsp" %>
</div>
<div id="right">
 	<%
		request.setCharacterEncoding("UTF-8");
		String msg = "";		
		String back = "&emsp;<a href='javascript:window.history.back();'>后退</a>";		//后退链接
		back += "</span></div></body></html>";
		
		String search 	= "";									//搜索内容
		String buttonSearch	= request.getParameter("buttonSearch");	//数据查询按钮	
		
		if (buttonSearch != null) { 								//如果按下了数据查询按钮
			search = request.getParameter("search").trim(); 		//搜索内容	
		}
		
		List<Goods> list = null;
		
		if (search.equals("")) {
			//list = GoodsDAO.getGoodsList();							//列出所有
		} else {		
			//list = GoodsDAO.findGoods(search);						//模糊查询
		}
  	%> 
	<div id="right1" class="bg"></div>
		<div id="right2" class="bantou">
		<div id="game-top" class="gamejs">
		<p><a class="wzzz">本网站为???</a></p>
		<p><a class="wzhy">欢迎来到<a class="lan">积分统计表</a></a></p>
		<p><a class="wzyd" >可以使用侧边栏<a class="noduit"  title="你知道的太多了">和首页导航（等等，有这个东西么</a>进行检索，也可以使用右上角的搜索。编辑前请先阅读<a class="lanse">帮助</a></a></p>
		</div>
		<div id="jianjie" class="jj">
		<table cellspacing="1%" cellpadding="1%">
		  		<form action="" method="post">
			
			<table width="800" align="center">
				<tr>
					<td>
						<h3>商品管理</h3>					
						<div class="right note" style="margin:40px 0px 5px 0px;">
							<div style="display:inline-block; padding-right:100px;">
								（<a href="goodsAdd.jsp">新添商品</a>）&emsp;&emsp;
								（<a href="goodsAdmin.jsp">商品管理</a>&emsp;
								<a href="goodsAdmin_DynamicSQL.jsp">动态SQL</a>）
							</div>						
							&emsp;&emsp;搜索：
							<input type="text" name="search" value="<%= search %>" style="width:80px;">
							<input type="submit" name="buttonSearch" value="搜索">
							<span class="note">（搜索）</span>
						</div>
					</td>
				</tr>	
	
				<tr>
					<td>
						<table class="table_border table_border_bg table_hover" width="100%">
							<tr class="tr_header">
								<td>序号</td>
								<td>名称</td>
								<td>分类</td>
								<td>数量</td>
								<td>更新时间</td>
								<td>详情/修改/删除</td>
							</tr>0
							<%
								int i = 0;
								Integer userId = 0;
								String username = "", job = "", num = "", timeRenewString = "";
	
								if (list != null) {
									for (Goods goods : list) {
										userId 			= goods.getUserId();
										username 		= goods.getUsername();
										job 			= goods.getJob();
										num 			= goods.getPhone();
										timeRenewString	= goods.getTimeRenewString();
										i ++;
							%>
							<tr>
								<td><%= i %></td>
								<td><%= username %></td>
								<td><%= job %></td>
								<td><%= num %></td>
								<td><%= timeRenewString %></td>
								<td>
									<a href="goodsShow.jsp?userId=<%= userId %>" title="显示">
										<img src="sc/icon_show.gif" border="0"></a>&emsp;
									<a href="goodsEdit.jsp?userId=<%= userId %>" title="修改">
										<img src="sc/icon_edit.gif" border="0"></a>&emsp;
									<a href="goodsDelete.jsp?userId=<%= userId %>" title="删除"
										onclick="return confirm('确认删除吗？')">
										<img src="sc/icon_delete.gif" border="0"></a>
								</td>
							</tr>
							<%
									}
								}
							%>
						</table>
					</td>
				</tr>
			</table>
			<table cellspacing="1%" cellpadding="1%">
  <tbody>
    <tr>
      <td class="tp"><img src="sc/pinkstar.png" alt="" width="25" height="25" class="star"/><a class="bt">弹幕作（新）</a></td>
      <td><a class="lanse">上一页/下一页</a></td>
    </tr>
    <tr>
      <td><img src="sc/game/东方天空璋封面.jpg" alt="" class="yxtp"/></td>
      <td><img src="sc/game/东方绀珠传封面.jpg" alt="" class="yxtp"/></td>
      <td><img src="sc/game/东方辉针城封面.jpg" alt="" class="yxtp"/></td>
    </tr>
    <tr>
      <td><a class="nr">东方天空璋</a></td>
      <td><a class="nr">东方绀珠传</a></td>
      <td><a class="nr">东方辉针城</a></td>
    </tr>
  </tbody>
</table>

			
		</form>
		</table>
		</div>

		<div class="time">
		<p>距新年还有 [<script language="JavaScript" type="text/javascript">djs()</script>] 天   </p>
		<a class="noduit">想放假……</a>
		</div>
	
	</div>
</div>
<%@include file="common/footer.jsp" %>
</body>
</html>