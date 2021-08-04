<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<div class="d-flex justify-content-between align-items-center mt-3">
		<h1>${subject}</h1>
		<button class="btn" onclick="location.href='/lesson08/quiz01/add_favorite_view'">추가하기</button>
		</div>
		<table class="table text-center">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="favorite" items="${favoriteList}" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${favorite.name}</td>
						<td><a href="${favorite.url}" target="_blank">${favorite.url}</a></td>
						<td><button type="button" name="delBtn" class=" btn btn-danger text-white" value="${favorite.id}">삭제</button>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script>
		$(document).ready(function(){
			//1.jQuery Dynamic Event binding
			//on('행위','지정자','이벤트') -- 동적으로 이벤트를 모두 할당하는 방법
			$('td').on('click','button[name=delBtn]',function(e){
				e.preventDefault();
				let delId=$(this).attr('value');
				
				$.ajax({
					type:'GET'
					,data:{'id':delId}
					,url:'/lesson08/quiz01/del_favorite'
					,success:function(data){
								if(data.result===true){
									alert('삭제 완료');
									location.href='/lesson08/quiz01/favorite_list_view';
								}
							 }
					,error:function(e){
						alert('삭제 실패'+e);
					}
				});
				
			});
			
		});
	</script>
</body>
</html>