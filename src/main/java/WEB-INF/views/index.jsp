
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<jsp:include page="common-css.jsp"></jsp:include>


</head>
<body>
	<div
		class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">

		<%-- <!-- -------------------------------------------header start----------------------------------------------->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- -------------------------------------------header end------------------------------------------------->
 --%>

		<!-- -------------------------------------------dashboard start-------------------------------------------->
		<jsp:include page="dashboard.jsp"></jsp:include>
		<!-- -------------------------------------------dashboard end---------------------------------------------->
	</div>
</body>

</html>

