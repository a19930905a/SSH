<%@page import="java.util.HashMap"%>
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
	HashMap<String,Integer> map = new HashMap();
	HashMap<String,Integer> totalMap = new HashMap();
	request.setAttribute("map", map);
	request.setAttribute("totalMap", totalMap);
%>

<font size="25">${param.month}月份報表</font>
	<%/*
		走訪特定月份的訂單
	*/ %>
	<c:forEach items="${order_list}" var="order">
		
		<c:forEach items="${order.detail}" var="detail">
	
		<%/*
			map Key = 產品名稱 , value = 對應物品售出數量的加總
		*/ %>
			<c:if test="${!map.containsKey(detail.product.name)}">
				<c:set target="${map}" property="${detail.product.name}"
				value="0"/>
			</c:if>	
			<c:if test="${map.containsKey(detail.product.name)}">
				<c:set target="${map}" property="${detail.product.name}"
				value="${detail.amount + map[detail.product.name]}"/>
			</c:if>	
		<%/*
			totalMap Key = 產品名稱 , value = 對應物品售出的總金額
		*/ %>
			<c:if test="${!totalMap.containsKey(detail.product.name)}">
				<c:set target="${totalMap}" property="${detail.product.name}" 
				value="0"/>
			</c:if>	
			<c:if test="${totalMap.containsKey(detail.product.name)}">
				<c:set target="${totalMap}" property="${detail.product.name}" 
				value="${totalMap[detail.product.name] + (detail.amount * detail.price)}"/>
			</c:if>	
			
		</c:forEach>
	</c:forEach>
 	<%/*
		income = 本月總營額
	*/ %>
 	<c:forEach items="${totalMap}" var="totalMap">
		<c:set var="income" value="${totalMap.value + income}"/>
	</c:forEach>

	<table  border="1">
		<tr>
			<th>產品ID</th>
			<th>產品名稱</th>
			<th>售出數量</th>
			<th>總售出金額</th>
			<th>總營收佔比</th>
		</tr>
		<%/*
			走訪 product_list
		*/ %>
		<c:forEach items="${product_list}" var="product">
			<tr>
				<td>${product.id}</td>
				<td>${product.name}</td>
				<td>
				<%/*
					當目標產品有售出紀錄時,
					列出該售出的數量,否則為0
				*/ %>
				<c:choose>
					<c:when test="${map.containsKey(product.name)}">
						${map[product.name]}
					</c:when>
					<c:otherwise>
						0
					</c:otherwise>
				</c:choose>
				</td>
				<%/*
					當該商品有出售紀錄時
					列出售出總金額,否則為0
				*/ %>
				<td>
				<c:choose>
					<c:when test="${totalMap.containsKey(product.name)}">
						${totalMap[product.name]}
					</c:when>
					<c:otherwise>
						0
					</c:otherwise>
				</c:choose>
				</td>
				<%/*
					當該商品有出售紀錄時
					列出占總營收的百分比
				*/ %>
				<td>
					<c:choose>
					<c:when test="${totalMap.containsKey(product.name)}">
						<fmt:formatNumber value="${totalMap[product.name] / income * 100}" maxFractionDigits="2"/>%
					</c:when>
					<c:otherwise>
						0
					</c:otherwise>
				</c:choose>		
				</td>
			</tr>
		</c:forEach>
	</table>
<font size="6">${param.month}月總營收:${income}</font>
<br>
<a href="<c:url value='/orders/monthDetail?month=${param.month}' />">
<font size="6">查看明細</font>
</a>
</body>
</html>