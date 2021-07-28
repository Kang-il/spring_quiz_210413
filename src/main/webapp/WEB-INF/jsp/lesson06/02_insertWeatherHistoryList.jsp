<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <h3 class="mb-3 mt-5 ml-3 font-weight-bold">${subject}</h3>
    	
    <form method="post" action="/lesson06/quiz/add_weather_history" class="mt-5 ml-3">
    	<div class="large-box">
	    	<div class="d-flex align-items-center justify-content-between">
	    		
	    		<%--date--%>
		    	<div class="insert-item d-flex align-items-center input-group">
			    	<label for="datepickerOption" class="font-weight-bold mx-2 mt-1">날짜</label>
			    	<input type="text" name="date" id="datepickerOption" class="form-control col-7 m-0">
		    	</div>
		    	
		    	<%--weather--%>
		    	<div class="insert-item d-flex align-items-center">
			    	<label for="weather" class="font-weight-bold ml-5 mr-2 mt-1">날씨</label>
			    	<select id="weather" name="weather" class="form-control col-4 text-center">
			    		<option value="맑음">맑음</option>
			    		<option value="비">비</option>
			    		<option value="구름조금">구름조금</option>
			    		<option value="흐림">흐림</option>
			    	</select>
		    	</div>
		    	
		    	<%--microDust--%>
		    	<div class="insert-item d-flex align-items-center">
			    	<label for="microDust" class="font-weight-bold ml-5 mr-2 mt-1">미세먼지</label>
			    	<select id="microDust" name="microDust" class="form-control col-5 text-center">
			    		<option value="좋음">좋음</option>
			    		<option value="나쁨">나쁨</option>
			    		<option value="보통">보통</option>
			    		<option value="최악">최악</option>
			    	</select>
		    	</div>
		    	
		    </div>
		    
		    
		    <div class="d-flex align-items-center justify-content-between mt-5">
		    
		    	<%--temperatures--%>
		    	<div class="input-group insert-item d-flex align-items-center">
		    		<label for="temperatures" class="mx-2 font-weight-bold">온도</label>
			    	<input type="text" name="temperatures" id="temperatures" class="form-control col-7" />
			    	<div class="input-group-append">
			    		<span class="input-group-text">°C</span>
			    	</div>
		    	</div>
		    	
		    	<%--precipitation--%>
		    	<div class="input-group insert-item d-flex align-items-center">
		    		<label for="precipitation" class="mr-2 font-weight-bold">강수량</label>
			    	<input type="text" name="precipitation" id="precipitation" class="form-control col-7" />
			    	<div class="input-group-append">
			    		<span class="input-group-text">mm</span>
			    	</div>
		    	</div>
		    	
		    	<%--windSpeed--%>
		    	<div class="input-group insert-item d-flex align-items-center">
		    		<label for="windSpeed" class="mr-2 font-weight-bold">풍속</label>
			    	<input type="text" name="windSpeed" id="windSpeed" class="form-control col-7" />
			    	<div class="input-group-append">
			    		<span class="input-group-text">km/h</span>
			    	</div>
		    	</div>
		    	
		    </div>
		    
		    <div class="d-flex justify-content-end mt-3 mb-5">
		    
		    	<%--submit 클릭시 weatherHistory.js 에 있는 스크립트 실행(유효성 검사) --%>
		    	<input type="submit" class="btn btn-success text-white font-weight-bold" id="submit" value="저장"/>
		    </div>
	   </div>
    </form>