<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<table style='width: 800px; margin: 10px auto 30px; border-spacing: 0px;'>
	<thead id='listReplyHeader'>
		<tr height='35'>
		    <td colspan='2'>
		       <div style='clear: both;'>
		           <div style='float: left;'><span>댓글${replyCount}개</span> <span>[댓글 목록, ${pageNo}/${total_page} 페이지]</span></div>
		           <div style='float: right; text-align: right;'></div>
		       </div>
		    </td>
		</tr>
	</thead>
	
	<tbody id='listReplyBody'>
	<c:forEach var="vo" items="${listReply}">
	    <tr height='35' style="margin-top: 20px;">
	       <td width='50%' style='padding: 10px 5px; padding-top: 35px;  border-right:none; '>
	           <span style="font-size: large; color: #9B7CC9;"><b>${vo.userName}</b></span>
	        </td>
	       <td width='50%' style='padding: 10px 5px; padding-top: 35px; border-left:none;' align='right'>
	           <span>${vo.created}</span> |
	           		<span class="deleteReply" style="cursor: pointer;" data-rcode='${vo.rcode}' data-pageNo='${pageNo}'>수정</span> |
	                <span class="deleteReply" style="cursor: pointer;" data-rcode='${vo.rcode}' data-pageNo='${pageNo}'>삭제</span>
	           		<button type='button' class='btnSendReplyReport' data-rcode='${vo.rcode}' title="신고">
	           			<img src="<%=cp%>/resource/images/siren.png" style="width: 15px; height: 15px;"> 신고하기 </button>
	        </td>
	    </tr>
	    <tr>
	        <td colspan='2' valign='top' style='padding:5px 5px;'>
	              ${vo.content}
	        </td>
	    </tr>
	   
	   <tr>
	        <td style="padding:7px 5px; width: 10px; height: 10px; font-size: lagie; border-bottom:1px solid #cccccc;">
	            <button type='button' class='btn btnReplyAnswerLayout' data-rcode='${vo.rcode}' style="width: 50px; height: 25px; font-size: 10px; padding: 3px 6px 3px 6px;">
	            	답글 <span id="answerCount${vo.rcode}">${vo.answerCount}</span></button>
	        </td>
	        <td style="padding:7px 5px; border-bottom:1px solid #cccccc;"  align='right'>
                <button type='button' class='btn btnSendReplyLike' data-rcode='${vo.rcode}' data-like_Hate='1'  title="좋아요" style="width: 70px; height: 25px; font-size: 10px; padding: 3px 6px 3px 6px;">
                	<img src="<%=cp%>/resource/images/good.png" style="width: 10px; height: 10px;"> 좋아요 <span>${vo.likeCount}</span></button>
                <button type='button' class='btn btnSendReplyLike' data-rcode='${vo.rcode}' data-like_Hate='0' title="싫어요" style="width: 70px; height: 25px; font-size: 10px; padding: 3px 6px 3px 6px;">
                	<img src="<%=cp%>/resource/images/bad.png" style="width: 10px; height: 10px;"> 싫어요 <span>${vo.disLikeCount}</span></button>	        
	        </td>
	    </tr>
	    
	    <tr class='replyAnswer' style='display: none;'>
	        <td colspan='2'>
	            <div id='listReplyAnswer${vo.rcode}' class='answerList'></div>
	            <div style='clear: both; padding: 10px 10px;'>
	                <div style='float: left; width: 5%;'>└</div>
	                <div style='float: left; width:95%'>
	                    <textarea cols='72' rows='12' class='boxTA' style='width:98%; height: 70px;'></textarea>
	                 </div>
	            </div>
	             <div style='padding: 0px 13px 10px 10px; text-align: right; '>
	                <button type='button' class='btn btnSendReplyAnswer' data-rcode='${vo.rcode}'>답글 등록</button>
	            </div>
	        </td>
	    </tr>
	</c:forEach>
	</tbody>

	
	<tfoot id='listReplyFooter'>
		<tr height='40' align="center">
            <td colspan='2' >
              ${paging}
            </td>
           </tr>
	</tfoot>
</table>
