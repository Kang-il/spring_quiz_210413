<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<section class="section">
	<c:choose>
		<c:when test="${item eq null || item eq 'home' }">
			<jsp:include page="02_item01home.jsp"/>
		</c:when>
		
		<c:when test="${item eq 'reservation' }" >
			<jsp:include page="02_item02reservation.jsp"/>
		</c:when>
		
		<c:when test="${item eq 'reserveList'}" >
			<jsp:include page="02_item03reserveList.jsp"/>
		</c:when>
	
	</c:choose>



</section>