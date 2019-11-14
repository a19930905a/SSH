<%@page import="java.util.HashMap"%>
<%@page import="ssh.entity.Order"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date,java.text.SimpleDateFormat" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>報表</title>
</head>
<body>
<%
	HashMap<String , Integer> map = new HashMap();
	HashMap<String , Integer> map2 = new HashMap();
	request.setAttribute("map", map);
	request.setAttribute("map2", map2);
%>
	<c:forEach items="${order_list1}" var="order">	
		<c:forEach items="${order.detail}" var="detail">
			<c:if test="${!map.containsKey(detail.product.name)}">
				<c:set target="${map}" property="${detail.product.name}" 
				value="0"/>
			</c:if>
			
			<c:if test="${map.containsKey(detail.product.name)}">
				<c:set target="${map}" property="${detail.product.name}" 
				value="${map[detail.product.name] + (detail.price * detail.amount)}"/>
			</c:if>
		</c:forEach>
	</c:forEach>

	<c:forEach items="${order_list2}" var="order">	
		<c:forEach items="${order.detail}" var="detail">
			<c:if test="${!map2.containsKey(detail.product.name)}">
				<c:set target="${map2}" property="${detail.product.name}" 
				value="0"/>
			</c:if>
			
			<c:if test="${map2.containsKey(detail.product.name)}">
				<c:set target="${map2}" property="${detail.product.name}" 
				value="${map2[detail.product.name] + (detail.price * detail.amount)}"/>
			</c:if>
		</c:forEach>
	</c:forEach>
			
	<c:forEach items="${map}" var="totalMap">
		<c:set var="income" value="${totalMap.value + income}"></c:set>
	</c:forEach>
		
	<c:forEach items="${map2}" var="totalMap">
		<c:set var="income2" value="${totalMap.value + income2}"></c:set>
	</c:forEach>	
	
	<table id="first" border="1">
		<tr>		
			<th>月份</th>
			<th>總營業額</th>
			<th>成長</th>
		</tr>
		
		<tr>
			<td>${param.month1}</td>
			<td>${income}</td>
		</tr>
		<tr>
			<td>${param.month2}</td>
			<td>${income2}</td>
			<td>
				<fmt:formatNumber value="${(income2 - income) / income * 100}" maxFractionDigits="2"/>%
			</td>
		</tr>
	</table>

</body>
</html>