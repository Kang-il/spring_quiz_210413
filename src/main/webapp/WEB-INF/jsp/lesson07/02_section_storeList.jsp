<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<div class="item-box">
	<h1 class="display-4 font-weight-light my-2">${subject}</h1>
	<c:forEach var="store" items="${storeList}">
		<div class="item py-2 mt-3" onclick="location.href='/lesson07/quiz02/select_store?id=${store.id}'">
				<h4 class="ml-3 mt-3 font-weight-bold">${store.store}</h4>
				<p class="mb-0 ml-3">전화번호:${store.phoneNumber}</p>
				<p class="ml-3">주소:${store.address}</p>
		</div>
	</c:forEach>
</div>