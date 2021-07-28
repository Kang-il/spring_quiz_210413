<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<%--weatherList : DB에서 받아온 날씨 리스트 넘어옴 --%>
<%--subject : 해당 뷰의 타이틀 --%>

<div class="d-block">
<h3 class="mb-3 mt-4 ml-3 font-weight-bold">${subject}</h3>
<table class="table text-center mx-3">
	<thead>
		<tr>
			<th>날짜</th>
			<th>날씨</th>
			<th>기온</th>
			<th>강수량</th>
			<th>미세먼지</th>
			<th>풍속</th>
		</tr>
	</thead>
	<tbody>
	
		<c:forEach var="weatherHistory" items="${weatherList}">
		
			<tr>
				<td>
					<c:set var="date" value="${fn:split(weatherHistory.date,'-')}"/>
					${date[0]}년${date[1]}월${date[2]}일
				</td>
				
				<td>
					<c:choose>
					<%--맑음 비 구름조금 흐림--%>
						<c:when test="${weatherHistory.weather eq '맑음'}">
							<img src="/images/lesson06/sunny.jpg" alt="맑음"/>
						</c:when>
						<c:when test="${weatherHistory.weather eq '비'}">
							<img src="/images/lesson06/rainy.jpg" alt="비"/>
						</c:when>
						<c:when test="${weatherHistory.weather eq '구름조금'}">
							<img src="/images/lesson06/partlyCloudy.jpg" alt="구름조금"/>
						</c:when>
						<c:when test="${weatherHistory.weather eq '흐림'}">
							<img src="/images/lesson06/cloudy.jpg" alt="흐림"/>
						</c:when>
					</c:choose>
				</td>
				
				<td>
					${weatherHistory.temperatures}°C
				</td>
				
				<td>
					${weatherHistory.precipitation}mm
				</td>
				<td>
					${weatherHistory.microDust}
				</td>
				<td>
					${weatherHistory.windSpeed}km/h
				</td>
			</tr>
		</c:forEach>
		
	</tbody>
</table>
</div>