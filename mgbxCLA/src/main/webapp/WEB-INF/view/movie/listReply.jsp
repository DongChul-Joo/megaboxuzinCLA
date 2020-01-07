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
				<form name="movieCommentForm" style="box-sizing: border-box; float: left;" action="">
					<div class="input">
						<div class="rate">
							<span class="starwrap">
								<img id=image1 onmouseover="show(1)" onclick="mark(1)" onmouseout="noshow(1)" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점1 괜히봤어요" title="별점1 괜히봤어요"> 
								<img id=image2 onmouseover="show(2)" onclick="mark(2)" onmouseout="noshow(2)" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점2 기대하진 말아요" title="별점2 기대하진 말아요">
								<img id=image3 onmouseover="show(3)" onclick="mark(3)" onmouseout="noshow(3)" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점3 무난했어요" title="별점3 무난했어요">
								<img id=image4 onmouseover="show(4)" onclick="mark(4)" onmouseout="noshow(4)" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점4 기대해도 좋아요!" title="별점4 기대해도 좋아요!">
								<img id=image5 onmouseover="show(5)" onclick="mark(5)" onmouseout="noshow(5)" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점5 너무 멋진 영화였어요!" title="별점5 너무 멋진 영화였어요!">
							</span>
							<br/><span id="startext" style="font-size: 14px; margin-top:46px; color: #666; text-align: center; margin-left: 23px;">평점을 입력해주세요</span>
						</div>
							<input type="hidden" name="star">
							
							<div style="width: 570px; min-height: 97px; float: left;">
								 
									<textarea class="writeReply" title="댓글쓰기" rows="10" cols="30" maxlength="100" 
									${not empty movie.userId ? "placeholder='댓글을 남겨이씨'" : "readonly='readonly' placeholder='로그인 후 이용가능한 서비스입니다.'"}
									></textarea>
								
							</div>
							<div style="width: 84px; height: 100%; float: left;">
								<button type="button" style="height: 86px; width: 86px; float: right; border: 1px solid #e1e1e1;"   class="btn movie" onclick="return false;">등록</button>
							</div>
						
					</div>
				</form>
			</div>
		</div>
		
		
		<div style="box-sizing: border-box;">
			
			<c:forEach var="vo" items="${list}">
			<div class="reply">
				<div class="row">
					
					<div style="float: left;" class="cell">
						<div style="width: 60px; float: left;"><img src="http://image2.megabox.co.kr/mop/home/user/profile_m.png" width="60px;" height="60px;"></div>
						
						<div class="textarea"> 
							<div class="name"><strong>${vo.userId}</strong></div>
							<div class="text">
								<span style="float: left;">${vo.created}</span>
								<div>
									<span style="margin-left: 15px; float: left;"  class="small_star">
										<span class="small_fill">
											<span class="blind"></span>
										</span>
									</span>
								</div>
							</div>
							<div>
								<p class="p">
									<span class="comment">${vo.content}</span>
								</p>
							</div>
						</div>
						
						<div style="margin-left: 71px;">
							
							<div class="recommend" onclick="MovieComment.like()">
								<i class="i_recommend" aria-hidden="true"></i>추천<strong>1</strong>
							</div>
							
							<div class="report" onclick="MovieComment.showReportSpoiler(this);">
								<i class="i_report" aria-hidden="true"></i>신고하기
							</div>
							
							<div style="width:315px; height:17px; margin-left: 85px;  display: none;">
								<ul>
									<!-- //TODO 코멘트ID? -->
									<li><a href="javascript:void(0);" onclick="MovieComment.checkReportSpoiler(this, '10', '016599', '7D2A4834-8C26-4965-8348-E48BE5137F07');" title="스포일러 신고">스포일러 신고</a></li>
									<li><a href="javascript:void(0);" onclick="MovieComment.checkReportSpoiler(this, '20', '016599', '7D2A4834-8C26-4965-8348-E48BE5137F07');" title="욕설/비방/광고 신고">욕설/비방/광고 신고</a></li>
								</ul>
							</div>
							
						</div>
						
					</div>
					
				
				</div>
			</div>
			</c:forEach>
			
			
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			   <tr height="50">
				<td align="center" style="margin-left: 450px;">
				    ${dataCount==0 ? "등록된 게시물이 없습니다.":paging}
				 </td>
			   </tr>
			</table>
			
		</div>
		
	</div>