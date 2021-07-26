<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core 라이브러리</title>
</head>
<body>


<h1>JSTL core 연산</h1>
<h2>두 변수 선언 후 사칙연산 결과 출력</h2>

<c:set var="number1" value="150"/>
<c:set var="number2" value="50"/>

<h3>number1: <c:out value="${number1}"/></h3>
<h3>number1: <c:out value="${number2}"/></h3>

<h3> number1 + number2 :<c:out value="${number1+number2}"/> </h3>
<h3> number1 - number2 :<c:out value="${number1-number2}"/> </h3>
<h3> number1 * number2 :<c:out value="${number1*number2}"/> </h3>
<h3> number1 / number2 :<c:out value="${number1/number2}"/> </h3>

<br>

<h2>core if</h2>
<h2>1번 믄제에서 사용한 두 변수의 평균이 10 이상이면 평균값을 h1태그 출력 미만이면 h3태그로 출력</h2>

<c:set var="avg" value="${(number1+number2)/2}"/>


<c:if test="${avg>=10}">
	<h1>average:${avg}</h1>
</c:if>

<c:if test="${avg<10}">
	<h3>average:${avg}</h3>
</c:if>


<h2>1번 믄제에서 사용한 두 변수의 곱의 결과가 100이 넘는다면 '너무 큰 수 입니다.' 를 core out 을 통해서 alert창으로 출력</h2>

<c:if test="${(number1*number2)>100}">
	<c:out value="<script>alert('너무 큰 수 입니다')</script>" escapeXml="false"/>
</c:if>


</body>
</html>