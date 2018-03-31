<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
  <%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">

  <link href="<c:url value="/resources/css/index.css" />" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="<c:url value="/resources/css/RegResultPage.css" />" rel="stylesheet">

<title>Insert title here</title>
</head>
<body>

<%@include file="Navigation.jsp"%>
	<div class="container">
		<div class="success">
			<h1>Your Process has been processed.</h1>
			<ul class="nav navbar-nav">
				<li class="active"><a href="${pageContext.request.contextPath}/login"><h2>LOGIN</h2></a></li>
			</ul>
		</div>
	</div>

<%@include file="footer.jsp"%>
</body>
</html>