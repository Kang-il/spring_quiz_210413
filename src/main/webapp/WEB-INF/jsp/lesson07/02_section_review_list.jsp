<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<div class="item-box">
	<h1 class="display-4 font-weight-light my-2">${store}-리뷰</h1>
	<c:choose>
		<%-- listSize 가 0이 아니면 출력 --%>
		<c:when test="${listSize ne 0}">
			<c:forEach var="review" items="${reviewList}">
				<div class="d-flex align-items-center">
					<div class="item py-2 mt-3">
						<h5 class="ml-3 mt-1 mb-2 font-weight-bold">${review.userName}</h5>
						<p class="mb-3 ml-3 text-secondary font-weight-normal"><fmt:formatDate value="${review.updatedAt}" pattern="yyyy년 MM월 dd일"/> </p>		
						<p class="mb-2 ml-3">${review.review}</p>
						<span class="ml-3 my-3 px-1 menu-name-tag ">${review.menu}</span>
					</div>
				</div>
			</c:forEach>
		</c:when>
		
		<%-- listSize 가 0이면 출력 --%>
		<c:when test="${listSize eq 0}">
			<h2 class="font-weight-bold ml-5 my-5">${reviewList}</h2>
		</c:when>
	</c:choose>
	
</div>