<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("basePath", basePath);
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
	<div class="container">
		<div class="row" style="padding: 50px;">
			<ul class="list-inline">
			<c:forEach var="bus" items="${allBus }">
				<li class=" col-md-3" style="list-style:;">
					<div class="thumbnail">
						<img src="img/car_1.jpg" alt="通用的占位符缩略图">
						<div class="caption">
							<h3>豪华跑车</h3>
							<p>
								该车共 <span style="color: green;">${bus.total } </span> 座,当前只剩 <span
									style="color: red;">${bus.last } </span> 座
							</p>
							<a href="${basePath }seat_detail?busId=${bus.id }&seatsMessage=${bus.seatsMessage }"><button
									class="btn btn-primary btn-sm pull-right ">抢座</button></a>
							<div class="clearfix"></div>
						</div>
					</div>
				</li>
			</c:forEach>
				

			</ul>
			</div>
			</div>
</body>
</html>