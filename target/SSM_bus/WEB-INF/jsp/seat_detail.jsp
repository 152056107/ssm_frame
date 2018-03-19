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
	<div id="choose_seat"
		style="width: 500px; height: 400px; border: solid 1px #a1bece; position: absolute; left: 50%; top: 50%; margin-top: -200px; margin-left: -250px; z-index: 10000; background-color: #EEF7EA;">
		<h3 class="text-center">
			点击绿色座位进行选座<small>红色表示已经被选了</small>
		</h3>
		<div class="row" style="padding: 20px;">
			<ul class="list-inline">
				<c:forEach var="seat" items="${seats }" varStatus="status">
					<li class="col-sm-2" style="height: 50px;"><c:if
							test='${seat eq "0" }'>
							<button class=" btn btn-block btn-success seat"
								onclick="changeColor(this)" id="${status.index }">${status.index+1 }</button>
						</c:if> <c:if test='${seat eq "1" }'>
							<button class=" btn btn-block btn-danger seat"
								onclick="changeColor(this)" id="${status.index }">${status.index+1 }</button>
						</c:if></li>
				</c:forEach>


			</ul>
		</div>

		<div class="btn-group pull-right">
			<button class="btn btn-default" onclick="submit()">
				<span class="glyphicon glyphicon-ok"></span>
			</button>
			<button class="btn btn-default">
				<span class="glyphicon glyphicon-refresh"></span>
			</button>
			<button class="btn btn-default" onclick="">
				<span class="glyphicon glyphicon-remove"></span>
			</button>
		</div>

	</div>
	<script type="text/javascript">
		var set=new Set();
			/*改变按钮颜色为黄色*/
		   	function changeColor(obj){
				
		   		if($(obj).hasClass("btn-success")){
		   			$(obj).removeClass("btn-success").addClass("btn-info");
		   			set.add($(obj).attr("id"));
		   		}else if($(obj).hasClass("btn-info")){
		   			$(obj).removeClass("btn-info").addClass("btn-success");
		   			set.delete($(obj).attr("id"));
		   		}
		   	}
		   	/*提交选座申请*/
		   	function submit(){
		   		var a="";
		   		for(var x of set){
		   			a=a+x+" ";
		   		}
		   		$.get(getRealPath()+"/submit?str="+a, function(data,status){
		   			alert("数据："+data+ "\n状态: " + status);
		   			});
		   		
		   	}
		   
		    function getRealPath(){

                var localObj = window.location;
        var contextPath = localObj.pathname.split("/")[1];
var basePath = localObj.protocol + "//" + localObj.host + "/"+ contextPath;

                  return basePath ;

                 }
		</script>
</body>
</html>