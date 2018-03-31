<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
  <%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="utf-8">

  <link href="<c:url value="/resources/css/index.css" />" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="<c:url value="/resources/css/index.css" />" rel="stylesheet">

<title>Home Page</title>


</head>

<body>
	<%@include file="Navigation.jsp"%>
	
	<!- image slider-!>
	<div id="myCarousel" class="carousel slide" data-ride="carousel"  >
    	<ol class="carousel-indicators">
			<li data-target="#myCarousel"	data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel"	data-slide-to="1" ></li>
			<li data-target="#myCarousel"	data-slide-to="2" ></li>
		</ol>
		<div class="carousel-inner" role="listbox">
		   <div class="item active">
		   		<img src ="${pageContext.request.contextPath}/resources/images/c4.png" align="middle" width=480px height=480px >
				
			</div>
			<div class="item">
				<img src ="${pageContext.request.contextPath}/resources/images/c1.png" width=480px height=480px>
			</div>
			<div class="item">
				<img src ="${pageContext.request.contextPath}/resources/images/c3.png" width=480px height=480px>
			</div>
			
		</div>	
		 <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    		<span class="glyphicon glyphicon-chevron-left"></span>
   			 <span class="sr-only">Previous</span>
  		</a>
 		 <a class="right carousel-control" href="#myCarousel" data-slide="next">
   			 <span class="glyphicon glyphicon-chevron-right"></span>
   			 <span class="sr-only">Next</span>
 		 </a>	
	</div>
	<div class="container text-center" id="product">
	<h1>Our Products</h1><br/>
		<div class="col-sm-4">
			<a href="${pageContext.request.contextPath}/product1">
			<img src="${pageContext.request.contextPath}/resources/images/p1.png" id="icon" />
			<h4>Product 1</h4>
			</a>
		</div>
		<div class="col-sm-4">
			<a href="${pageContext.request.contextPath}/product1">
			<img src="${pageContext.request.contextPath}/resources/images/p2.png" id="icon" />
			<h4>Product 2</h4>
			</a>
		</div>
		<div class="col-sm-4">
			<a href="${pageContext.request.contextPath}/product1">
			<img src="${pageContext.request.contextPath}/resources/images/p3.png" id="icon" />
			<h4>Product 3</h4>
			</a>
		</div>
	</div>
	
	
	
	
<%@include file="footer.jsp"%>
</body>
</html>