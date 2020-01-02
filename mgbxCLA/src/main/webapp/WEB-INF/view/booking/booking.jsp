<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
div{
border: 1px solid black;
}
</style>
<div style="width: 800px; height: 500px;">
	<div style="width: 45%; height: 100%;float: left;">
		<div style="width: 100%; height: 20%;">날짜</div>
		<div style="width: 100%; height: 35%;">극장
			<button type="button" onclick="">+</button><button type="button" onclick="">+</button><button type="button" onclick="">+</button><button type="button" onclick="">+</button>
		</div>
		<div style="width: 100%; height: 45%;">영화</div>
	</div>
	<div style="width: 55%;height: 100%;float: left">
		<div style="width: 100%; height: 20%;">시간</div>
		<div style="width: 100%; height: 80%;">상영목록</div>
	</div>
	
</div>