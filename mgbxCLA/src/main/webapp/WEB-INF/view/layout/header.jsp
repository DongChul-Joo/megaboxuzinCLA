<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>


<style>

.btn {
	font-weight: 600;
    text-transform: uppercase;
    font-size: 13px;
    background-color: white;
	font-family: 'Sunflower', sans-serif;
	border:1px solid;
	font-size: 13px;
	/* margin-top: 13px; */

}

.btn:hover {
	color: white;
	background-color: black;

}

.btn-outline-primary {
    color: #1a1a1a;
    border-color: #1a1a1a;
    height: 52px;
    width: 90px;
}


.btn-outline-primary1 {
    color: #1a1a1a;
    border-color: #1a1a1a;
    height: 35px;
    width: 90px;
}

</style>


<div class="header-top">
    <div class="header-left">
        <p style="margin: 2px;">
            <a href="<%=cp%>/" style="text-decoration: none;">
                <span style="width: 200px; height: 70; position: relative; left: 0; top:20px; color: black; filter: mask(color=red) shadow(direction=135) chroma(color=red);font-style: italic; font-family: arial black; font-size: 30px; font-weight: bold;"></span>                
            </a>
            <a href="<%=cp%>"><img src="<%=cp%>/resource/images/logo2.jpg" style="float: left; height: 100%; width:180px; margin-right: 100px;"></a>
            
            
            <a class="btn btn-outline-primary" style="border: none; font-size: 18px; padding:3px; padding-top: 14px;" href="<%=cp%>/movie/newmovie">영화</a>
            <a class="btn btn-outline-primary" style="border: none; font-size: 18px; padding:3px; padding-top: 14px;"  href="<%=cp%>/branchCla/branchCla">영화관</a>
            <a class="btn btn-outline-primary" style="border: none; font-size: 18px; padding:3px; padding-top: 14px;" href="<%=cp%>/event/list">이벤트</a>
            <a class="btn btn-outline-primary" style="border: none; font-size: 18px; padding:3px; padding-top: 14px;" href="<%=cp%>/item/list">스토어</a>
            <c:if test="${not empty sessionScope.member}">
            <a class="btn btn-outline-primary" style="border: none; font-size: 18px; padding:3px; padding-top: 14px;" href="<%=cp%>/mypage/info">마이페이지</a>
        	</c:if>
            <a class="btn btn-outline-primary" style="border: none; font-size: 18px; padding:3px; padding-top: 14px;"  href="<%=cp%>/customer/main">고객센터</a>
            
        </p>
    </div>
    
    
    <div class="header-right">
        <div style="float: right; margin-top: 13px;">
            <c:if test="${empty sessionScope.member}">
            
  
                <a href="<%=cp%>/member/login" class="btn btn-outline-primary1">로그인</a>
                <a href="<%=cp%>/member/member" class="btn btn-outline-primary1">회원가입</a>
                
            </c:if>
            <c:if test="${not empty sessionScope.member}">
                <span style="color:blue; margin-top: 20px;">${sessionScope.member.userName}</span>님
                &nbsp;|&nbsp;
                <a href="<%=cp%>/member/logout" style="margin-top: 20px;">로그아웃</a>
                <c:if test="${sessionScope.member.userId=='admin'}">
                    &nbsp;|&nbsp;
                    <a href="<%=cp%>/admin">관리자</a>
                </c:if>
                
            </c:if>
        </div>
    </div>
</div>







