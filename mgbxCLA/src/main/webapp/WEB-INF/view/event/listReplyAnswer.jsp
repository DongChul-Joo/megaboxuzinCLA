<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<c:forEach var="vo" items="${listReplyAnswer}">
    <div class='answer' style='padding: 0px 10px;'>
        <div style='clear:both; padding: 10px 0px;'>
            <div style='float: left; width: 5%;'>└</div>
            <div style='float: left; width:95%;'>
                <div style='float: left;'><b>${vo.userName}</b></div>
                <div style='float: right;'>
                    <span>${vo.created}</span> |
                    	<span class='deleteReplyAnswer' style='cursor: pointer;' data-rcode='${vo.rcode}'>수정</span> |
                    	<span class='deleteReplyAnswer' style='cursor: pointer;' data-rcode='${vo.rcode}' data-answer='${vo.answer}'>삭제</span>
                    	<button type='button' class='btnSendReplyReport' data-rcode='${vo.rcode}' title="신고">
	           			<img src="<%=cp%>/resource/images/siren.png" style="width: 15px; height: 15px;"> 신고하기 </button>
                </div>
            </div>
        </div>
        <div style='clear:both; padding: 5px 5px 5px 5%; border-bottom: 1px solid #ccc;'>
            ${vo.content}
        </div>
    </div>			            
</c:forEach>