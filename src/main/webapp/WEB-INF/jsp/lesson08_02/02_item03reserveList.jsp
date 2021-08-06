<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

    <div>
    	<h1 class="text-center my-3">${subject}</h1>
    	<table class="table text-center booking-table">
    		<thead>
    			<tr>
    				<th>이름</th>
    				<th>예약날짜</th>
    				<th>숙박일수</th>
    				<th>숙박인원</th>
    				<th>전화번호</th>
    				<th>예약상태</th>
    				<th></th>
    			</tr>
    		</thead>
    		<tbody >
    			<c:forEach var="booking" items="${bookingList}" >
	    			<tr>
	    				<td class="align-middle">${booking.name}</td>
	    				
	    				<td class="align-middle">
	    					<fmt:formatDate value="${booking.date}" pattern="yyyy년 M월 dd일"/>
	    				</td>
	    				
	    				<td class="align-middle">${booking.day}</td>
	    				
	    				<td class="align-middle">${booking.headcount}</td>
	    				
	    				<td class="align-middle">${booking.phoneNumber}</td>
	    				<c:choose>
		    				<c:when test="${booking.state eq '확정'}">
		    					<td class="align-middle text-success">${booking.state}</td>
		    				</c:when>
		    				
		    				<c:when test="${booking.state eq '대기중'}">
		    					<td class="align-middle text-info">${booking.state}</td>
		    				</c:when>
		    				
		    				<c:when test="${booking.state eq '취소'}">
		    					<td class="align-middle text-danger">${booking.state}</td>
		    				</c:when>
	    				</c:choose>
	    				<td>
	    					<button type="button" class="delete-button btn btn-danger" data-booking-id="${booking.id}">삭제</button>
	    				</td>
	    			</tr>
    			</c:forEach>
    		</tbody>
    	</table>
    </div>
    
    
    
    <script>
    	
    
    </script>