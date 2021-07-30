<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--nav--%>
<nav class="navbar d-block">

	<%--logo부분 ::: 클릭 시 처음 페이지로 이동--%>
	<div class="d-flex align-items-center justify-content-center">
		<a href="/lesson06/quiz/weather_history" class="logo ml-0 mt-3">
			<img src="/images/lesson06/logo.png" width="50px" alt="로고이미지"/>
			<span class="h5 text-white font-weight-bold text-decoration-none mr-3">기상청</span>
		</a>
	</div>
	
	<%-- nav bar get 방식으로 item 파라미터를 넘겨줌 --%>
	<div class="d-flex justify-content-start align-items-start ml-2"> 
		<ul class="nav flex-column mt-4 pb-5">
			<li class="nav-item mt-3"><a href="/lesson06/quiz/weather_history?sectionItem=weatherHistory" class="nav-item text-white h6">날씨</a></li>
			<li class="nav-item mt-3"><a href="/lesson06/quiz/weather_history?sectionItem=insertWeatherHistory" class="nav-item text-white h6">날짜입력</a></li>
			<li class="nav-item mt-3"><a href="#" class="nav-item text-white h6">테마날씨</a></li>
			<li class="nav-item mt-3"><a href="#" class="nav-item text-white h6">관측기후</a></li>
		</ul>
	</div>
	
</nav>