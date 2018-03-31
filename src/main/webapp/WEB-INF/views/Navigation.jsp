<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!- navbar-!>
	<nav class = "navbar navbar-inverse">
		<div class="container-fluid">
			<div  class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" 	data-target="#MyNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					
				</button>
				<a class = "navbar-brand" href="${pageContext.request.contextPath}/index" ><img src="${pageContext.request.contextPath}/resources/images/logo2.png" /></a> 
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class=" nav navbar-nav navbar right">
					<li class ="active"><a href="${pageContext.request.contextPath}/index">HOME</a></li>
					<li ><a href="${pageContext.request.contextPath}/login" >LOGIN</a></li>
					<li ><a href="${pageContext.request.contextPath}/Register" >REGISTER</a></li>
					<li ><a href="${pageContext.request.contextPath}/product1">PRODUCTS</a></li>
					<li ><a href="${pageContext.request.contextPath}/About">ABOUT US</a></li>
				</ul>
				 <ul class="nav navbar-nav navbar-right">
      <li><a href="${pageContext.request.contextPath}/Register"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="${pageContext.request.contextPath}/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
			</div>
		</div>
	</nav>