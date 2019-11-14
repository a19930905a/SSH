<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date,java.text.SimpleDateFormat" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>訂單總表</title>
</head>
<body>
	<%/**
	<form action="product">
		<table>
			<tr>
				<td>請輸入月份:</td>
				<td><input name="month" /><td>
				<td><input type="submit" value="查詢報表"><td>
			<tr>
		</table>
	</form>
	*/ %>
	<form action="product2">
		<table>
			<tr>
				<td>請輸入月份:</td>
				<td><input name="month" /><td>
				<td><input type="submit" value="查詢報表"><td>
			<tr>
		</table>
	</form>



	<form action="search" method="get" >
		<table>
			<tr>
				<td><form:input path="order.id"/><td>
				<td><input type="submit" value="查詢訂單"><td>
			<tr>
		</table>
	</form>

	<table border="1">
		<tr>
			
			<th>訂單ID</th>
			<th>客戶ID</th>
			<th>處理僱員</th>
			<th>訂購日期</th>
			<th>運貨公司</th>
			<th>收件者</th>
			<th>收件地址</th>
			<th>操作</th>
		</tr>
		<%
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		String time=df.format(new Date());
		request.setAttribute("time", time);
		%>
		<c:forEach items="${orderlist}" var="order">
			<tr>
				
				<td>${order.id}</td>
				<td>${order.customer.id}</td>
				<td>${order.employee.name}</td>
				<td>${order.orderTime}</td>
				<td>${order.shipping.name}</td>
				<td>${order.order_name}</td>
				<td>${order.order_address}</td>
				<td><a href="<c:url value='/orders/modifyOrder?id=${order.id}' />">編輯</a>
					<a href="<c:url value='/orders/deleteOrder?id=${order.id}' />">刪除</a>
				</td>
			</tr>
		</c:forEach>
		<td colspan="9" align="center">共 ${page.totalRecord} 條紀錄  共 ${page.totalPage}頁  當前 ${page.pageNo} 頁<br>
		<a href="<c:url value='/orders/orderlists?pageNo=${page.topPageNo}' />">
			<input type="button" name="fristPage" value="首頁"/>
		</a>
		
		<c:choose>
			<c:when test="${page.pageNo != 1}">
				<a href="<c:url value='/orders/orderlists?pageNo=${page.previousPageNo}' />">
					<input type="button" name="previousPage" value="上一頁"/>
				</a>
			</c:when>
			<c:otherwise>
				<input type="button" disabled="disabled"name="previousPage" value="上一頁"/>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${page.pageNo != page.totalPage}">
				<a href="<c:url value='/orders/orderlists?pageNo=${page.nextPageNo}' />">
					<input type="button" name="nextPage" value="下一頁"/>
				</a>
			</c:when>
			<c:otherwise>
				<input type="button" disabled="disabled"name="nextPage" value="下一頁"/>
			</c:otherwise>
		</c:choose>
		
		<a href="<c:url value='/orders/orderlists?pageNo=${page.lastPageNo}' />">
			<input type="button" name="lastPage" value="末頁"/>
		</a>
	</table>
	<br>
	<br>
	<a href="newOrder">新增訂單</a>
	
${testList}
	
</body>
</html>