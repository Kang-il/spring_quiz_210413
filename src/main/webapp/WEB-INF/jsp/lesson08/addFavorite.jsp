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
		<div class="d-flex justify-content-between align-items-center mt-3">
		<h1>즐겨찾기 추가하기</h1>
		<button class="btn" onclick="location.href='/lesson08/quiz01/favorite_list_view'">목록보기</button>
		</div>
		<form method="post">
			<span>이름</span>
			<input type="text" class="form-control" name="name"/>
			<span>주소</span>
			<div class="form-inline">
				<input type="text" class="form-control col-10" name="url"/>
				<button type="button" id="checkBtn" class="btn btn-info col-1">중복확인</button>
			</div>
				<small id="isDuplicationText"class="text-danger mt-3 d-none">중복된 url 입니다.</small>
				<small id="doDuplication" class="text-danger mt-3 d-none">중복검사를 실시하세요.</small>
				<small id="availableUrlText" class="text-success mt-3 d-none">사용 가능한 url 입니다.</small>
				<small id="checkUrlForm" class="text-danger mt-3 d-none">잘못된 url형식입니다.</small>
				<small id="checkUrlBlank" class="text-danger mt-3 d-none">검사할 url을 입력해 주세요.</small>
			<button class="form-control bg-success mt-3 text-white" id="submitBtn" type="button">추가</button>
		</form>
	</div>
	
	<script>
	$(document).ready(function(e){
		
		$('#checkBtn').on('click',function(e){
			e.preventDefault();
			
			//초기화 
			$('#isDuplicationText').addClass('d-none');
			$('#availableUrlText').addClass('d-none');
			$('#checkUrlForm').addClass('d-none');
			$('#checkUrlBlank').addClass('d-none');
			$('#doDuplication').addClass('d-none');
			
			//url 값 받아오기
			let url = $('input[name=url]').val().trim();
			
			
			if(url==''){
				//1.빈칸유효성검사
				$('#checkUrlBlank').removeClass('d-none');
				return;
			}
			
			if(url.startsWith('http://')===false && url.startsWith('https://') ===false){
				//2.url 형식 검사
				$('#checkUrlForm').removeClass('d-none');
				return;
			}
				
				//3.중복검사
			$.ajax({
				type:'GET'
				,data:{'url':url}
				,url:'/lesson08/quiz01/is_duplication_favorite'
				,success:function(data){
					if(data.is_duplication===true){
						//중복시 
						$('#isDuplicationText').removeClass('d-none');
						$('#availableUrlText').addClass('d-none');
						return;
					}else if(data.is_duplication===false){//중복아님
						$('#isDuplicationText').addClass('d-none');
						$('#availableUrlText').removeClass('d-none');
					}
					
				}
				,error:function(e){
					alert(e);
				}
			});
			
		});
		
		//실시간으로 url 네임의 input value 변화 감지해서 값 변경시 유효성 검사를 처음부터 다시하도록 해줌
		//중복확인 유효성 통과 후 값을 중복되는 값으로 변경하여 저장할 수 있었던 문제를 막기 위해
		$('input[name="url"]').on('change keyup paste',function(){
			$('#checkUrlBlank').addClass('d-none');
			$('#checkUrlForm').addClass('d-none');
			$('#doDuplication').addClass('d-none');
			$('#isDuplicationText').addClass('d-none');
			$('#availableUrlText').addClass('d-none');
		});
		
		
		$('#submitBtn').on('click',function(){
			$('#checkUrlBlank').addClass('d-none');
			$('#checkUrlForm').addClass('d-none');
			$('#doDuplication').addClass('d-none');
			$('#isDuplicationText').addClass('d-none');
			
			let name=$('input[name=name]').val().trim();
			let url=$('input[name=url]').val().trim();
			
			
			if(name==''){
				alert('이름을 입력하세요');
				return;
			}
			
			if(url==''){//url 빈칸 채우라는 문구 띄워주기
				$('#checkUrlBlank').removeClass('d-none');
				return;
			}
			
			// availableUrlText 에 d-none클래스가 있다면 중복검사 조건이 충족되지 않은것으로 판단 
			if($('#availableUrlText').hasClass('d-none')){
				alert('중복검사조건을 충족 하세요.');
				
				//프로토콜 유효성 검사
				if(url.startsWith('http://')=== false && url.startsWith('https://') === false){
					$('#checkUrlForm').removeClass('d-none');
				}else{
					//프로토콜이 알맞게 들어가있으면서 중복성검사를 하지 않았으므로 중복성 검사를 하라는 문구를 띄워줌
					$('#doDuplication').removeClass('d-none');
				}
				
				//궁극적으로 중복검사조건을 충족하지 않아 들어온 조건문이므로 마지막에 return해주어 아래 코드가 실행되지 않게 해준다.
				return;
			}
			
			//프로토콜 형식을 만족하면서 availableUrlText만 d-none 클래스가 없으면 DB로 보낼 수준의 유효성 검사가 완료되었다고 판단.
			if((url.startsWith('http://')===true || url.startsWith('https://') === true)
					&& $('#isDuplicationText').hasClass('d-none') 
					&& $('#checkUrlForm').hasClass('d-none') 
					&& $('#checkUrlBlank').hasClass('d-none') 
					&& !$('#availableUrlText').hasClass('d-none')){
				
				$.ajax({
					type:'POST'
					,url:'/lesson08/quiz01/add_favorite'
					,data:{'name':name,'url':url}
					//dataType:'JSON' -- 결과 타입 Response /AJAX 통신 후 Response 로는 String 또는 JSON이 리턴되어야 한다.
					//브라우저 -> 서버 -> 결과 ->JSON {'name':'이름'}  alert(ata.name);--못 얻어냄 문자열로 받아내서 인식을 못함 일반 AJAX는
					//jQuery Ajax는 자동으로 JSON object로 만들어줌
					,dataType:'JSON'
					,success:function(data){
						//alert('추가 성공!'+ data);
						alert(data.result);
						location.href='/lesson08/quiz01/favorite_list_view';
					}
					,error: function(e){
						alert('추가 실패! :::: \n e.staus :' + e.status);
					}
				});
				
			}else{
				return;
			}
			
		});
		
		
		
	});
	</script>
	

</body>
</html>