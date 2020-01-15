-<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
    
    
<div class="writewrap">
		<h3>한줄평(개수)</h3>
		
		
		<div style="height: 123px; width: 920px;">

			<div style="width: 56px; float: left; padding-top: 33px; margin-right: 24px;">
				<img src="http://image2.megabox.co.kr/mop/home/user/profile_m.png" width="56px;" height="56px;">
			</div>
			
			
			
			<div style="width: 820px; height: 90px; float: right; padding-top: 20px; margin-left: 10px;">
				<form name="movieCommentForm" style="box-sizing: border-box; float: left;" method="post" >
					<div class="input">
						<div class="rate">
							<span class="expect">
							기대평 
							</span>
						</div>
							
							<div style="width: 570px; min-height: 97px; float: left;">
									<textarea  class="writeReply" title="댓글쓰기" rows="10" cols="30" maxlength="100" ${not empty info.userId ? "placeholder='댓글을 남겨주세요'" : "readonly='readonly' placeholder='로그인 후 이용가능한 서비스입니다.'"}></textarea>
							</div>
							<div style="width: 84px; height: 100%; float: left;">
									<button type="button" onclick="btnSendReply('${dto.movieCode}')" style="height: 86px; width: 86px; float: right; border: 1px solid #e1e1e1;">등록</button>
							</div>
						
					</div>
				</form>
			</div>
		</div>
		
		
		<div style="box-sizing: border-box;">
			
			
			<div class="reply">
				<div class="row">
				<c:forEach var="vo" items="${list}">
					
					<div style="float: left;" class="cell">
						
						<div style="width: 60px; float: left;"><img src="http://image2.megabox.co.kr/mop/home/user/profile_m.png" width="60px;" height="60px;"></div>
						
						<div class="textarea"> 
							<div class="name"><strong class="getUserId">${vo.userId}</strong></div>
							<div class="text">
								<span style="float: left;">${vo.created}</span>
							</div>
							<div>
								<p class="p">
									<span class="comment">${vo.content}</span>
								</p>
							</div>
						</div>
						
						<div style="margin-left: 71px; margin-top: 138px;">
							
							<div class="recommend" onclick="commentLike(this)">
								<i class="i_recommend" aria-hidden="true"></i>추천
								<strong class="replyLikeCount">${vo.likeCount}</strong>
								<input type="hidden" class="rpUserId" value="${vo.userId}"/>
							</div>
							
							<div class="report" onclick="reportUser('${vo.userId}', ${vo.movieCode })">
								<i class="i_report" aria-hidden="true"></i>신고하기
							</div>
							
						</div>
						
							<c:if test="${sessionScope.member.userId==vo.userId}">
								<button type="button" class="btn_delete" onclick="replyRemove('${vo.movieCode}')">삭제</button>
								<button type="button" class="btn_modify" onclick="replyEdit(this)">수정</button>
							</c:if>
							
						</div>
						
					</c:forEach>
						
					</div>
				</div>
			</div>
			
			
			
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			   <tr height="50">
				<td align="center" style="margin-left: 450px;">
				    ${dataCount==0 ? "등록된 게시물이 없습니다.":paging}
				 </td>
			   </tr>
			</table>
			
		</div>
		
	</div>