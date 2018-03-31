<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
  <%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="utf-8">


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
	<div class="content" style="width: 60%">
		<!-- here the href's value will be used to decide the 
				 controller to be executed on click of this link.
				 here "home" is mapped in spring mvc controller-->
		<fieldset>
			<legend>Error occurred</legend>
			${exception}
		</fieldset>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>