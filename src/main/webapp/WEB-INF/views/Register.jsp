<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>     
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <link href="<c:url value="/resources/css/index.css" />" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="<c:url value="/resources/css/index.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/css/Register.css" />" rel="stylesheet">
<title>Insert title here</title>
</head>
<body background="${pageContext.request.contextPath}/resources/images/formbg.png">
<%@include file="Navigation.jsp"%>



 <form:form id="regForm" modelAttribute="user" action="RegisterProcess" method="post">
 <div class="sign" >
	<h2>Sign Up Form</h2>
</div>
 
                <table align="center">
                    <tr>
                        <td>
                            <form:label path="name">User name</form:label>
                        </td>
                        <td>
                            <form:input path="name" name="name" id="name" placeholder="User NAME"/>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <form:label path="address">address</form:label>
                        </td>
                        <td>
                            <form:input path="address" name="address" id="address" placeholder="USER ADDRESS" />
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <form:label path="email">email</form:label>
                        </td>
                        <td>
                            <form:input path="email" name="email" id="email" placeholder="USER EMAIL ADDRESS"/>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <form:label path="contact">Contact</form:label>
                        </td>
                        <td>
                            <form:input path="contact" name="contact" id="contact" placeholder="USER CONTACT" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="password" type="password">password</form:label>
                        </td>
                        <td>
                            <form:input path="password" name="password" id="password" placeholder="USER PASSWORD" />
                        </td>
                    </tr>
                         <tr>
                        <td>
                            <form:label path="role">role(user/admin)</form:label>
                        </td>
                        <td>
                            <form:input path="role" name="role" id="role" placeholder="USER ROLE"/>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                        <input type="submit" value="add" name="action" class="btn btn-primary btn-sm">
                        </td>
                    </tr>
                    
				</table>
</form:form>

<%@include file="footer.jsp"%>
</body>
</html>