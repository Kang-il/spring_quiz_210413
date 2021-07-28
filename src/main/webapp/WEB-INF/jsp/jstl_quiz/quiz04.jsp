<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<div class="container">
		<h1>${subject}</h1>
		<table class="table text-center"> 
			<thead>
				<tr>
					<th>No</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>국적</th>
					<th>이메일</th>
					<th>자기소개</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="member" items="${members}" varStatus="status">
					<%-- 국적 : 삼국시대...  '시대'문자열을 기준으로 split 하여 배열에 담아주기 --%>
					<c:set var="nationality" value="${fn:split(member.nationality,'시대')}"/>
					<%-- 이메일 : @ 를 기준으로 split하여 배열에 담아주기 --%>
					<c:set var="email" value="${fn:split(member.email,'@')}"/>
					
					<tr>
						<td>${status.count}</td>
						
						<td>${member.name}</td>
						
						<%--010으로 시작하지 않으면 유효하지 않은 전화번호 출력 --%>
						
						<c:choose>
							
							<c:when test="${fn:startsWith(member.phoneNumber,'010')}">
								<td>${member.phoneNumber}</td>
							</c:when>
								
							<c:otherwise>
								<td>유효하지 않은 전화번호</td>
							</c:otherwise>
								
						</c:choose>
						
						<%-- 삼국시대 를 삼국 - 형태로 변경 --%>
						<td>${nationality[0]} - ${nationality[1]}</td>
						
						<%--이메일의 아이디 부분을 굵게 표시 --%>
						<td><b>${email[0]}</b>@${email[1]}</td>
						
						<%--15자가 넘어갈 경우 뒤에 '...'표시 --%>
						<td class="text-left">
							<c:choose>
								<c:when test="${fn:length(member.introduce) >= 16 }">
									${fn:substring(member.introduce,0,15)}...
								</c:when>
								<c:otherwise>
									${member.introduce}
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>