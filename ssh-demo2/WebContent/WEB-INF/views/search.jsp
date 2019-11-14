<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date,java.text.SimpleDateFormat" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查詢訂單</title>
</head>
<body>
	
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
	</table>
	<a href="<c:url value='/orders/orderlists' />">首頁</a>


	
</body>
</html>