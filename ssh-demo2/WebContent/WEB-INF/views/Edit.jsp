<%@page import="ssh.service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改訂單資料</title>
</head>
<body>
	<form action="Update" method="post">
		<table>
			<form:hidden path="order.id"/>
			<tr>
				<td>客戶ID:</td>
				<td>
					<form:select path="order.customer.id">
						<form:options items="${customer_list}" itemValue="id" itemLabel="id"/>
					</form:select>
				</td>
			</tr>
			
			<tr>
				<td>僱員ID:</td>
				<td>
					<form:select path="order.Employee.id">	
						<form:options items="${employee_list}" itemValue="id" itemLabel="name"/>
					</form:select>
				</td>
			</tr>
			
			<tr>
				<td>收件者:</td>
				<td><form:input path="order.order_name"/></td>
			</tr>
			 
			<tr>
				<td>運貨商:</td>
				<td>
					<form:select path="order.shipping.id">
						<form:options items="${shipping_list}" itemValue="id" itemLabel="name"/>
					</form:select>
				</td>
			</tr>
			
			<tr>
				<td>收件地址:</td>
				<td><form:input path="order.order_address"/></td>
			</tr>
			<tr>
				<td>訂購時間:</td>
				<td><form:input path="order.orderTime" /></td>
			</tr> 
			 
			
			<tr>
				<td><input type="submit" value="編輯"></td>
			</tr>
		</table>
	</form>
</body>
</html>