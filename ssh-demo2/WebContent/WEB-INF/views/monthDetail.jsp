<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date,java.text.SimpleDateFormat" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>明細</title>
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
		<th>產品</th>
		<th>數量</th>
		<th>總金額</th>
	
	</tr>
	<c:forEach items="${order_list}" var="order">
		
			<tr>	
				<td>${order.id}</td>
				<td>${order.customer.id}</td>
				<td>${order.employee.name}</td>
				<td>${order.orderTime}</td>
				<td>${order.shipping.name}</td>
				<td>${order.order_name}</td>
				<td>${order.order_address}</td>
				<td>
				<%/*
					客戶訂購的所有產品名稱
				*/ %>
				<c:forEach items="${order.detail}" var="detail">
					${detail.product.name}
					<br>
				</c:forEach>
				</td>
				<td>
				<%/*
					客戶訂購的產品對應數量
				*/ %>
				<c:forEach items="${order.detail}" var="detail">
					${detail.amount}
					<br>
				</c:forEach>
				</td>
				<%/*
					客戶訂購的總金額
				*/ %>
				<td>
				<c:set var = "total" value = "0"/>
				<c:forEach items="${order.detail}" var="detail">
					<c:set var = "total" value="${total + (detail.price * detail.amount)}"/>
				</c:forEach>
				${total}
				</td>
			</tr>
		</c:forEach>
	</table>
	<a href="<c:url value='/orders/orderlists' />">首頁</a>
	
	
</body>
</html>