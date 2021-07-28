<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="section">
	<%--section Controller에서 넘어오는 item값이 null 이면 띄워주는 section --%>
	<c:choose>
		<c:when test="${item eq null}">
			<jsp:include page="02_section_storeList.jsp"/>
		</c:when>
		
	<%--section Controller에서 넘어오는 item값이 reviewList면 띄워주는 section --%>
		<c:when test="${item eq 'reviewList'}">
			<jsp:include page="02_section_review_list.jsp"/>
		</c:when>
	</c:choose>
	
</section>