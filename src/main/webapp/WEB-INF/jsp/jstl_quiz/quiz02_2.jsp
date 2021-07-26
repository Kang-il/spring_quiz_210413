<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>

	<h1>${subject}</h1>
	<table class="table text-center">
		<thead>
			<tr>	
				<th>이름</th>
				<th>전화번호</th>
				<th>등급</th>
				<th>포인트</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="member" items="${membership}" varStatus="status">
				<tr>
					<td>${member.name}</td>
					<td>${member.phoneNumber}</td>
					<%--TODO::::: VIP면 빨강 GOLD인경우 노랑 --%>
					
					<c:set var="vip" value="VIP"/>
					<c:set var="gold" value="GOLD"/>
					
					<c:choose>
						<c:when test="${member.grade eq vip}">
							<td class="text-danger">${member.grade}</td>
						</c:when>
						<c:when test="${member.grade eq gold}">
							<td class="text-warning">${member.grade}</td>
						</c:when>
						<c:otherwise>
							<td>${member.grade}</td>
						</c:otherwise>
					</c:choose>
					
					<%-- TODO:::: 5000포인트 이상이면 파랑 --%>
					<c:choose>
						<c:when test="${member.point >= 5000}">
							<td class="text-primary">${member.point}</td>
						</c:when>
						<c:otherwise>
							<td>${member.point}P</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
</body>
</html>