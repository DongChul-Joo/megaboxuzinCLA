<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style>
.list-group-item {
 height: 50px;
 text-align: center;
 padding-top: 14px;
 font-size: 17px;
 
}

.list-group-item lefthead {
	height: 30px;
}

</style>

<script type="text/javascript">
$(function(){
	var idx="${subMenu}";
	if(! idx) idx=1;
	var subMenu=$(".list-group-item")[idx];
	$(subMenu).addClass("active");
});
</script>

<div class="list-group">
       <div class="list-group-item lefthead" style="height: 50px; padding-top: 15px;"><i></i> MYPAGE</div>
       <a href="<%=cp%>/mypage/info" class="list-group-item">멤버십정보</a>
       <a href="<%=cp%>/mypage/membership" class="list-group-item">스토어 구매내역</a>
       <a href="#" class="list-group-item">나의무비스토리</a>
       <a href="<%=cp%>/member/pwd" class="list-group-item">정보수정</a>
    <c:if test="${sessionScope.member.userId!='admin' }">
	    <a href="<%=cp%>/member/pwd?dropout" class="list-group-item">회원탈퇴</a>
	</c:if>        
</div>
