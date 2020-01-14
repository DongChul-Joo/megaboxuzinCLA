<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div style="width: 100%;height: 90%;padding-top: 40px;">
		<div class="bmemberLogin">회원 로그인</div>
		<div class="bnmemberLogin">비회원 로그인</div>
</div>
<p class="onOff"><button style="border-radius:5px;float: right;width: 40px;height: 25px;background: white;border: 1px solid black;" type="button" onclick="blfClose();" >취소</button></p>