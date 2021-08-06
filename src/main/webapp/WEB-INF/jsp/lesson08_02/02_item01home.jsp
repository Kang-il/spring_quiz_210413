<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <div>
    	<div class="d-flex">
    		<img class="banner-img" src="/images/lesson08_02/banner1.jpg" alt="배너이미지" width="100%"/>
    	</div>
    	<div class="d-flex home-items-box bg-danger">
    	
    		<div class="home-item1 d-flex justify-content-center align-items-center">
    			실시간<br>예약하기
    		</div>
    		
    		<div class="home-item2">
    			<h3 class="text-white ml-4 my-3">예약확인</h3>
    			<div class="mr-5">
	    			<div class="d-flex align-items-center justify-content-end mb-3">
		    			<span class="text-white mr-3">이름 : </span> 
		    			<input type="text" class="form-control col-8" name="name" placeholder="이름을 입력해 주세요">
	    			</div>
	    			<div class="d-flex align-items-center justify-content-end mb-3">
		    			<span class="text-white mr-3">전화번호 : </span> 
		    			<input type="text" class="form-control col-8" name="phoneNumber" placeholder="010-0000-0000">
	    			</div>
	    			<div class="d-flex justify-content-end">
	    				<button class="btn btn-success" id="checkReservation">조회하기</button>
	    			</div>
    			</div>
    		</div>
    		
    		<div class="home-item3 d-flex justify-content-center align-items-center">
    			예약문의:<br>
    			010-<br>
    			0000-1111
    		</div>
    		
    	</div>
    </div>