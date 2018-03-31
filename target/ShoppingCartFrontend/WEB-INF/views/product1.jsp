<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
  <%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="<c:url value="/resources/css/product1.css" />" rel="stylesheet">
<title>PRODUCT</title>
</head>
<body>
<%@include file="Navigation.jsp"%>
<table bgcolor="#ffff"><br/>
				<tr>
					<th></th>
					<th>Name </th>
					<th>Brand </th>
					<th>Description </th>
					<!-- <td>Category</td> -->
					<th>Supplier </th>
					<th>Price </th>
					<th>Quantity </th>
				</tr>
				
				<tr>
					<th><img src="${pageContext.request.contextPath}/resources/images/c4.png"
						height="200" width="200"></th>
					<th>${msg.name}PRODUCT1</th>
					<th>${msg.brand}KRISHNA PACKERS</th>
					<th>${msg.description}120*70*80CM</th>
					<%-- <td>${msg.category}</td> --%>
					<th>${msg.supplier}KP,ROHINI</th>
					<th>&#8377;&nbsp;${msg.price}105/-</th>
					<th>${msg.quantity}MAX-150</th>
				</tr>
				<tr><th class=""><a class="btn btn-primary"
						href="${pageContext.request.contextPath}/login">Add
							To Cart</a></th></tr>
			
</table>
<br/><br/>	
<%@include file="footer.jsp"%>
</body>
</html>