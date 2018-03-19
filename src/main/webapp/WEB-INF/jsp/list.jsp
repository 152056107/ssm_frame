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
		<div class="row" style="padding: 10px;">
			<ul class="list-inline">
			<c:forEach var="bus" items="${allBus }">
				<li class=" col-md-3" style="list-style:;">
					<div class="thumbnail">
						<img src="img/car_1.jpg" alt="通用的占位符缩略图">
						<div class="caption">
							<h3>${bus.type }</h3>
							<p>
								该车共 <span style="color: green;">${bus.total } </span> 座,当前只剩 <span
									style="color: red;">${bus.last } </span> 座
							</p>
							<c:if test="${bus.last eq 0 }">
								<button
									class="btn btn-danger btn-sm pull-right ">无座</button>
							</c:if>
							<c:if test="${bus.last > 0 }">
							<a href="${basePath }seat_detail?busId=${bus.id }&seatsMessage=${bus.seatsMessage }"><button
									class="btn btn-primary btn-sm pull-right ">抢座</button></a>
									</c:if>
							<div class="clearfix"></div>
						</div>
					</div>
				</li>
			</c:forEach>
				

			</ul>
			</div>
			<ul class="pagination pagination-lg">
    <li ><a href="${basePath }list?page=${currentPage-1 }">&laquo;</a></li>
    <c:forEach begin="1"    end="${pageTimes }" varStatus="status">
    	<li><a href="${basePath }list?page=${status.index }"  title="${status.index }">${status.index }</a></li>
    </c:forEach>
    <!--  onclick="clickPage(this)" -->
    
    <li><a href="${basePath }list?page=${currentPage+1 }">&raquo;</a></li>
</ul>
			</div>
			<script type="text/javascript">
				if()
				/* function clickPage(obj){
					$.get(getRealPath()+"/list?page="+obj.title,function(data,status){
						window.location.reload();
					});	
				} */
				function getRealPath(){

	                var localObj = window.location;
	        		var contextPath = localObj.pathname.split("/")[1];
					var basePath = localObj.protocol + "//" + localObj.host + "/"+ contextPath;

	                  return basePath ;

	                 }
			</script>
</body>
</html>