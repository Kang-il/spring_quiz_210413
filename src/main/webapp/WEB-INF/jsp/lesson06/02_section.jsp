<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="section-item01 m-3">

	<%-- 절차 : View[navbar(item)파라미터 값] -> Controller[model.addAttribute()] -> View --%>
	<c:choose>
		<%--과거날씨를(초기화면) 보여주는 view를 include 한다. --%>
		<c:when test="${sectionItem eq 'weatherHistory'}">
			<jsp:include page="02_weatherHistoryList.jsp"></jsp:include>
		</c:when>
		<%--날씨를 입력하는 view페이지를 include 한다. --%>
		<c:when test="${sectionItem eq 'insertWeatherHistory'}">
			<jsp:include page="02_insertWeatherHistoryList.jsp"/>
		</c:when>
		<c:otherwise>
			<jsp:include page="02_weatherHistoryList.jsp"/>
		</c:otherwise>
	</c:choose>

</section>