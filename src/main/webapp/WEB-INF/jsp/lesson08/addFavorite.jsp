<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
	

</head>
<body>
	<div class="container">
		<form method="post">
			<h1>즐겨찾기 추가하기</h1>
			<span>이름</span>
			<input type="text" class="form-control" name="name"/>
			<span>주소</span>
			<input type="text" class="form-control" name="url"/>
			<button class="form-control bg-success" id="submitBtn">추가</button>
		</form>
	</div>
	
	<script>
	$(document).ready(function(){
		$('#submitBtn').on('click',function(){
			var name=$('input[name=name]').val().trim();
			var url=$('input[name=url]').val().trim();
			
			if(name==''){
				alert('이름을 입력하세요');
				return;
			}
			if(url==''){
				alert('url을 입력하세요');
				return;
			}
			
			if(url.indexOf('http') == 0 || url.indexOf('https') == 0){
				
				$.ajax({
					type:'POST'
					,url:'/lesson08/quiz01/add_favorite'
					,dataType:'JSON'
					,data:{"name":name,"url":url}
					,success:function(data){
						alert('추가 성공!');
					}
					,error: function(e){
						alert('실패!');
					}
				});
				
			}else{
				alert('프로토콜을 입력해 주세요');
				return;
			}
			
		});
	});
	</script>
	

</body>
</html>