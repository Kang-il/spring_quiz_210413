<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	    				<td class="align-middle">${booking.date}</td>
	    				<td class="align-middle">${booking.day}</td>
	    				<td class="align-middle">${booking.headcount}</td>
	    				<td class="align-middle">${booking.phoneNumber}</td>
	    				<c:if test="${booking.state eq '확정'}">
	    					<td class="align-middle text-success">${booking.state}</td>
	    				</c:if>
	    				<c:if test="${booking.state eq '대기중'}">
	    					<td class="align-middle text-info">${booking.state}</td>
	    				</c:if>
	    				<td><button type="button" class="delete-button btn btn-danger" data-booking-id="${booking.id}">삭제</button></td>
	    			</tr>
    			</c:forEach>
    		</tbody>
    	</table>
    </div>
    
    
    
    <script>
    	$(document).ready(function(){
    		$('.delete-button').on('click',function(){
    			let bookingId=$(this).data('booking-id');
    			
    			$.ajax({
    				type:'post'
    				,data:{'booking-id':bookingId}
    				,url:'/lesson08/quiz02/del_booking'
    				,success:function(data){
    					if(data.result===true){
    						alert('성공');
    					}else{
    						alert('실패');
    					}
    					location.href='/lesson08/quiz02/booking?item=reserveList';
    				}
    				,error:function(e){
    					alert('실패!'+e);
    				}
    			});
    			
    		});
    	});
    
    </script>