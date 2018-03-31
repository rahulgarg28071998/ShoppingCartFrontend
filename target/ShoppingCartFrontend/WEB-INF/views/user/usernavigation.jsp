<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!- navbar-!>
	<nav class = "navbar navbar-inverse">
		<div class="container-fluid">
			<div  class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" 	data-target="#MyNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					
				</button>
				<a class = "navbar-brand" href="${pageContext.request.contextPath}/user/userindex" ><img src="${pageContext.request.contextPath}/resources/images/logo2.png" /></a> 
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class=" nav navbar-nav navbar right">
					<li class ="active"><a href="${pageContext.request.contextPath}/user/userindex">HOME</a></li>
					<li ><a href="${pageContext.request.contextPath}/user/cart">CART</a></li>
				</ul>
				 <ul class="nav navbar-nav navbar-right">
     <li><a href="${pageContext.request.contextPath}/#"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    </ul>
			</div>
		</div>
	</nav>