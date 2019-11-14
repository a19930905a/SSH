<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date,java.text.SimpleDateFormat" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>新增訂單</title>
</head>
<body>
	<form:form action="save" method="post" modelAttribute="order">
		<table>
			<form:hidden path="id"/>
			<tr>
				<td>客戶ID:</td>
				<td>
					<form:select path="customer.id">
						<form:options items="${customer_list}" itemValue="id" itemLabel="id"/>
					</form:select>
				</td>
			</tr>
			
			<tr>
				<td>僱員ID:</td>
				<td>
					<form:select path="Employee.id">
						<form:options items="${employee_list}" itemValue="id" itemLabel="name"/>
					</form:select>
				</td>
			</tr>
			
			<tr>
				<td>收件者:</td>
				<td><form:input path="order_name"/></td>
			</tr>
			 
			<tr>
				<td>運貨商:</td>
				<td>
					<form:select path="shipping.id">			
						<form:options items="${shipping_list}" itemValue="id" itemLabel="name"/>
					</form:select>
				</td>
			</tr>
			
			<tr>
				<td>收件地址:</td>
				<td><form:input path="order_address"/></td>
			</tr>
			<%
				SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.s");
				String time=df.format(new Date());
				request.setAttribute("time", time);
			%>
			
			<tr>
				<td>訂購時間:</td>
				<td><form:input path="orderTime" value="${time}"/></td>
			</tr>
			<tr>
				<td><input type="submit" value="編輯"></td>
			</tr>
			
		</table>
	</form:form>
	
	
</body>
</html>