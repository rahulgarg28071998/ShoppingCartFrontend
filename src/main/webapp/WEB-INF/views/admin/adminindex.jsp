<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Basic Bootstrap Template</title>
<s:url value="/resources/css" var="css" />
<s:url value="/resources/js" var="js" />
<s:url value="/resources/fonts" var="fonts" />
  <link href="<c:url value="/resources/css/index.css" />" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="<c:url value="/resources/css/index.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/css/Register.css" />" rel="stylesheet">
<link rel="stylesheet" href="${css}/bootstrap.min.css">
<link rel="stylesheet" href="${css}/bootstrap-theme.min.css">

<script src="${js}/jquery-1.10.2.js"></script>
<script src="${js}/bootstrap.min.js"></script>
<script type="text/javascript" src="${js}/jquery.dataTables.js"></script>
<style>
body {
	background: #d3d3d3;
}

.align-center {
	text-align: center;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#mytable')
				.DataTable(
						{
							ajax : {
								url : '/shoppingFrontEnd/product1/all/data',
								dataSrc : ''
							},
							columns : [
									{
										data : 'name',
										mRender : function(data, type, row) {
											return '<img src="/shoppingFrontEnd/resources/Image/'+ data +'.jpg" height="50" width="50">';
										}
									},
									{
										data : 'name'
									},
									{
										data : 'brand'
									},
									{
										data : 'description'
									},
									{
										data : 'supplier'
									},
									{
										data : 'price'
									},
									{
										data : 'quantity'
									},

									{
										data : null,
										mRender : function(data, type, row) {
											//return '<a class="btn btn-primary" href="/NiitProject/product11/userName="'+row.name+'">View Item</a>';
											return "<a class='btn btn-primary' href='/shoppingFrontEnd/deleteorUpdate/"+row.id+"'>Edit</a>";
										}
									},
									{
										data : null,
										mRender : function(data, type, row) {
											return "<a class='btn btn-primary' href='/shoppingFrontEnd/deleteorUpdate/"+row.id+"'>Delete</a>";
										}
									} ]
						});
	});
</script>
</head>
<body background="${pageContext.request.contextPath}/resources/images/formbg.png">
	<%@include file="adminnavigation.jsp"%>
	<div class="container">
 <form:form id="regForm" modelAttribute="product" action="admin/productData" method="post" class="xyz">
 
	<h2>Sign Up Form</h2>

 
                <table align="center" id="abc">
                	<tr>
                        <td>
                            <label path="brand">Brand name</label>
                        </td>
                        <td>
                            <input path="brand" name="brand" id="brand" placeholder="Brand name"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label path="name"> name</label>
                        </td>
                        <td>
                            <input path="name" name="name" id="name" placeholder="Product name"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label path="activeIs">ActiveIs</label>
                        </td>
                        <td>
                            <input path="activeIs" name="activeIs" id="activeIs" placeholder="Activeis"/>
                        </td>
                    </tr>
	                <tr>
                        <td>
                            <label path="description">Description</label>
                        </td>
                        <td>
                            <input path="description" name="description" id="description" placeholder="Description"/>
                        </td>
                    </tr>
	                <tr>
                        <td>
                            <label path="supplier">Supplier</label>
                        </td>
                        <td>
                            <input path="supplier" name="supplier" id="supplier" placeholder="Supplier"/>
                        </td>
                    </tr>  
                    <tr>
                        <td>
                            <label path="image_url">Image_url</label>
                        </td>
                        <td>
                            <input path="image_url" name="image_url" id="image_url" placeholder="Image_url"/>
                        </td>
                    </tr>  
					  <tr>
                        <td>
                            <label path="quantity">Quantity</label>
                        </td>
                        <td>
                            <input path="quantity" name="quantity" id="quantity" placeholder="Quantity"/>
                        </td>
                    </tr>  
                    <tr>
                        <td>
                            <label path="price">Price</label>
                        </td>
                        <td>
                            <input path="price" name="price" id="price" placeholder="Price"/>
                        </td>
                    </tr>  
                    <tr>
                        <td></td>
                        <td>
                        <input type="submit" value="Add" name="action" class="btn btn-primary btn-sm"> 
                        <input type="submit" value="Update" name="action" class="btn btn-primary btn-sm"> 
                        <input type="submit" value="Delete" name="action" class="btn btn-primary btn-sm"> 
                                                   
                        </td>
                    </tr>
                    
				</table>
				
	</form:form>
			<table id="mytable" class="table table-bordered">
			<thead>
				<!-- 	<th>image name</th> -->
				<!-- 	<th>active</th> -->
				<th>Img_url</th>
				<th>Name</th>
				<th>Brand</th>
				<th>Description</th>
				<th>Supplier</th>
				<th>Price</th>
				<th>Quantity</th>
				<th></th>
				<th></th>
			</thead>
			<tfoot>
				<!-- 	<tr>image name</tr> -->
				<!-- 	<tr>active</tr> -->
				<th>Img_url</th>
				<th>Name</th>
				<th>Brand</th>
				<th>Description</th>
				<th>Supplier</th>
				<th>Price</th>
				<th>Quantity</th>
				<th></th>
				<th></th>
			</tfoot>
		</table>
		
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>