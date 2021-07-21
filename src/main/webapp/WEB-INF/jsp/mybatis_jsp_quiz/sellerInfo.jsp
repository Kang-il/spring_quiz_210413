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
	<div class="container">
		<h2 class="font-weight-bold">${subject}</h2>
		
		<c:choose>
		<%-- 이미지 URL이 없다면 img태그에 기본 이미지 URL을 담아준다 --%>
			<c:when test="${result.profileImageUrl==null }">
				<img src="https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg" width="180px" alt="판매자 이미지"/>
			</c:when>
			
		<%-- 이미지 URL이 있다면 img태그에 해당 이미지 URL을 담아준다 --%>
			<c:when test="${result.profileImageUrl!=null }">
				<img src="${result.profileImageUrl}" alt="판매자 이미지"/>
			</c:when>
		</c:choose>
		
		<h1 class="font-weight-light mx-0">${result.nickname}</h1>
		<h3 class="text-warning">${result.temperature}</h3>
	</div>
</body>
</html>