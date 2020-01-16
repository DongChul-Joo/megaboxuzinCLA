<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
$(function(){
	$("#readEventForm").parents(".ui-dialog:first").find(".ui-dialog-title").html("<p style='font-size: 15px; font-weight: bold;'>${dto.subject}</p>");
});
</script>


<div class="body-container" style="width: 800px;">
    <div>
    	<table style="width: 800px;">
    		<tr style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
        		<td width="40%" align="left" style="padding-right: 10px; border-spacing: 0px; border-collapse: collapse;">
			    	 이벤트 기간 : ${dto.sdate} ~ ${dto.edate}
				</td>
				<td width="40%" align="right" style="padding-right: 10px; border-spacing: 0px; border-collapse: collapse;">
				<c:if test="${event.lott != 0}">
			    	당첨자 발표 : ${dto.lottDate}
				</c:if>
				</td>
				
			</tr>
    	</table>
    	
    </div>
    <div style="width: 80%; margin: 10px auto 0px; text-align: center; margin-bottom: 50px">
    	<a href="${dto.elink}">
    		<img src="https://localhost:9090/mgbxAD/uploads/event/${dto.imageFilename}" width="100%" style="margin: 0px 10px;">
    	</a>
    	<c:if test="${dto.lott==1 && state==1}">
	    	<div>
	    		<button type="button" class="btn btnSendRequest" style="width : 80px; height :30px; font-size: 15px; margin-top: 100px; padding: 3px 6px 3px 6px;">응모하기</button>
	    	</div>
    	</c:if>
    </div>
	</div>

	<table style='width: 800px; margin: 15px auto 0px; border-spacing: 0px;'>
		<tr height='30'> 
			 <td align='left' >
				<span style='font-weight: bold;'>댓글쓰기</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
			 </td>
		</tr>
		<tr>
			<td style='padding:5px 5px 0px;'>
				<textarea class='boxTA' style='width:101%; height: 70px;'></textarea>
		    </td>
		</tr>
		<tr>
			<td align='right'>
				<button data-code="${dto.ecode}" type='button' class='btn btnSendReply' style='padding:10px 20px;'>댓글 등록</button>
			</td>
		</tr>
	</table>


	<div id="listReply"></div>