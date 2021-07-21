<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<form method="post" action="/lesson04/quiz01/add_seller">
			<h1>판매자 추가</h1>
			<label for="nickname">닉네임</label><br>
			<input type="text" class="form-control col-4" id="nickname" name="nickname"/>
			
			<label for="profileImageUrl">프로필사진 URL</label><br>
			<input type="text" class="form-control col-8" id="profileImageUrl" name="profileImageUrl" />
			
			<label for="temperature">온도</label><br>
			<input type="text" class="form-control col-4" id="temperature" name="temperature" />
			
			<input type="submit" class="btn btn-primary text-white mt-2" value="추가"/>
		</form>
	</div>

</body>
</html>