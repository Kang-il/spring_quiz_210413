<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    	<h2 class="text-center font-weight-bold mt-4">예약하기</h2>
    <div class="d-flex justify-content-center">
    	<div class="form-section">
	    	<div>
	    		<p class="my-2 font-weight-bold">이름</p>
	    		<input type="text" class="form-control" name="regisName"/>
	    	</div>
	    	<div>
	    		<p class="my-2 font-weight-bold">예약날짜</p>
	    		<input type="text" class="form-control" name="regisDate" id="datepickerOption"/>
	    	</div>
	    	<div>
	    		<p class="my-2 font-weight-bold">숙박일수</p>
	    		<input type="text" class="form-control" name="regisDay"/>
	    	</div>
	    	<div>
	    		<p class="my-2 font-weight-bold">숙박인원</p>
	    		<input type="text" class="form-control" name="regisHeadcount"/>
	    	</div>
	    	<div>
	    		<p class="my-2 font-weight-bold">전화번호</p>
	    		<input type="text" class="form-control" name="regisPhoneNumber"/>
	    	</div>
	    	<div>
	    		<button type="button" class="btn btn-warning col-12 my-3" id="reserveBtn">예약하기</button>
	    	</div>
    	</div>
    </div>
    
