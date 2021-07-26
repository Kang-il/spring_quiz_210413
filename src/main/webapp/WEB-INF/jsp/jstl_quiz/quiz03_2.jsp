<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카드 명세서</title>
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
					<th>사용처</th>
					<th>가격</th>
					<th>사용 날짜</th>
					<th>할부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cardBill" items="${cardBills}">
				
					<%-- String 타입으로 저장되어있는 날짜를 Date타입으로 형변환 해주기 --%>
					<fmt:parseDate value="${cardBill.date}" var="tempCastDateType" pattern="yyyy-MM-dd"/>
					
					<tr>
						<td>${cardBill.store}</td>
						
						<%-- 숫자타입을 통화 format으로 가공하여 출력 --%>
						<td>
							<fmt:formatNumber value="${cardBill.pay}" type="currency"/>
						</td>
						
						<%-- 형변환 되어있는 Date 타입 객체(castDateType)를 알맞은 format으로 가공하여 출력 --%>
						<td>
							<fmt:formatDate value="${tempCastDateType}" pattern="yyyy년 MM월 dd일"/>
						</td>
						
						<td>${cardBill.installment}</td>
					</tr>
					
				</c:forEach>
			</tbody>
		</table>
	</div>
	
</body>
</html>