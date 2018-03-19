<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
pageContext.setAttribute("basePath",basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css" />
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div style="width: 100%" >
		
			<!-- 左侧菜单栏 -->
			<div id="main-container">
				<div id="sidebar" class="col-md-2 column">
					<!-- 创建菜单树 -->
					<div class="col-md-12">

						<ul id="main-nav" class="nav nav-tabs nav-stacked" style="">

							<li>

								<a href="#systemSetting" class="nav-header collapsed" data-toggle="collapse">

									<i class="glyphicon glyphicon-cog"></i>服务

									<span class="pull-right glyphicon glyphicon-chevron-down"></span>

								</a>

								<ul id="systemSetting" class="nav nav-list collapse secondmenu" style="height: 0px;">

									<li>
										<a href="#" onclick="menuClick('${basePath }list')"><i class="glyphicon glyphicon-user"></i>选座</a>
									</li>

									<li>
										<a href="#" onclick=""><i class="glyphicon glyphicon-th-list"></i>bbb</a>
									</li>

								</ul>

							</li>

							<li>

								<a href="#systemSetting1" class="nav-header collapsed" data-toggle="collapse">

									<i class="glyphicon glyphicon-cog"></i>用户

									<span class="pull-right glyphicon glyphicon-chevron-down"></span>

								</a>

								<ul id="systemSetting1" class="nav nav-list collapse secondmenu" style="height: 0px;">

									<li>
										<a href="#" onclick="menuClick('/login.jsp')"><i class="glyphicon glyphicon-asterisk"></i>登录</a>
									</li>

									<li>
										<a href="#"><i class="glyphicon glyphicon-edit"></i>注册</a>
									</li>

									

								</ul>

							</li>

						</ul>

					</div>
				</div>
				<div class="col-md-10 column">
					<%-- <div class="breadcrumbs" id="breadcrumbs">
						<!-- 面包屑导航 -->
						<ul class="breadcrumb">
							<li>
								<a href="${base}toLoginIndex">Home</a>
							</li>
							<li class="active">Dashboard</li>
						</ul>
						
					</div> --%>

					<!-- 内容展示页 -->
					<div>
						<iframe id="iframe-page-content" src="${basePath }home" width="100%" frameborder="no" border="0" marginwidth="0" marginheight=" 0" scrolling="auto" allowtransparency="yes"></iframe>
					</div>
				</div>
				<!-- /.main-content -->
			</div>
			<!-- /.main-container -->
		</div>
		<script type="text/javascript">
			 $(function() {
				var height = document.documentElement.clientHeight;
				document.getElementById('iframe-page-content').style.height = height + 'px';
			});
			var menuClick = function(menuUrl) {
				$("#iframe-page-content").attr('src', menuUrl);
			};
		</script>
</body>
</html>