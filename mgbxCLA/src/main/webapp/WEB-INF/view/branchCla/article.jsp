<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
	<div>
	<div>
		<p>${dto.branName}</p>
	</div>
	<div>
		<p>우편번호 : ${dto.branZip}</p>
		<p>주소 : ${dto.branAddr1+' '+dto.branAddr2}</p>
	</div>
	
	</div>