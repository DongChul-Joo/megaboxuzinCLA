-<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


<style type="text/css">

.movieCommentForm{
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

.input {
    overflow: hidden;
    height: 86px;
    border: 1px solid #e1e1e1;
}


.comment{
    height: 84px;
    width: 570px;
    font-size: 16px;
    border: none;
    border-left: 1px solid #e1e1e1;
    border-right: 1px solid #e1e1e1;
    background-color: #fff;
}

.starwrap {
    cursor: pointer;
    width: 145px;
    text-align: center;
    padding-top: 15px;
}

.btn movie{
    width: 100%;
    height: 100%;
    vertical-align: middle;
    background-position: -600px -100px;
}


.writewrap{
    overflow: hidden;
    margin-bottom: 30px;
    width: 930px;
}

.rate{
	width :158px;
}

.reply {
    clear: both;
    overflow: hidden;
    width: 100%;
    display: table;
    border : 1px solid #f0f0f0;
    margin-left: 25px;
}

.row{
	display: table-row;
    height: 100%;
    margin-left: 0px;
}

.cell{
	display: table-cell;
    vertical-align: top;
    width: 450px;
    height: 100%;
    border-bottom: 1px solid #f0f0f0;
    overflow: hidden;
    padding: 20px 20px;
    position: relative;
    float: left;
    margin: 0px auto;
    border-right: 2px solid #f0f0f0;
}

.small_star{
	display: block;
    position: relative;
    width: 73px;
    height: 12px;
    background: url(http://image2.megabox.co.kr/mop/home/star_s.png) 0 -12px no-repeat;
    margin-top: 2px;
}

.small_fill{
	position: absolute;
    width: 73px;
    height: 12px;
    background: url(http://image2.megabox.co.kr/mop/home/star_s.png) 0 0 no-repeat;
}

.blind{
	font-size: 12px;
    color: #666;
    display: inline-block;
    margin-right: 6px;
    float: left;
}

.p{
	color: #333;
    font-size: 14px;
    line-height: 20px;
    margin: 4px 0 35px;

}

.text{
	width: 78%;
    position: relative;
    float: left;
}

.name{
	font-size: 18px;
    line-height: 18px;
    color: #503396;
    display: inline-block;
	font-weight: 700;
	font-family: '나눔고딕';
}

.recommend{
	float: left;
    cursor: pointer;
    font-size: 12px;
    margin-right: 15px;
}

.i_recommend{
	background-image: url(http://image2.megabox.co.kr/mop/home/moviePost/moviePost_icon.png) !important;
    background-position: -242px -50px;
    background-repeat: no-repeat;
    overflow: hidden;
    display: inline-block;
    width: 16px;
    height: 15px;
    vertical-align: middle;
    margin: -1px 4px 0 0;
}

.report{
	float: left;
    font-size: 12px;
    color: #999;
    cursor: pointer;
}

.i_report{
	background-image: url(http://image2.megabox.co.kr/mop/home/moviePost/moviePost_icon.png) !important;
    background-position: -210px -50px;
    background-repeat: no-repeat;
    overflow: hidden;
    display: inline-block;
    width: 15px;
    height: 15px;
    vertical-align: middle;
    margin: -1px 5px 0 8px;
}


</style>    
    
    
    
    
<div class="writewrap">
		<h3>한줄평(개수)</h3>
		
		
		<div style="height: 123px; width: 920px;">

			<div style="width: 56px; float: left; padding-top: 33px; margin-right: 24px;">
				<img src="http://image2.megabox.co.kr/mop/home/user/profile_m.png" width="56px;" height="56px;">
			</div>
			
			
			
			<div style="width: 820px; height: 90px; float: right; padding-top: 20px; margin-left: 10px;">
				<form class="movieCommentForm" action="">
					<div class="input">
						<div class="rate">
							<div class="starwrap">
								<input type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점1 괜히봤어요" title="별점1 괜히봤어요">
								<input type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점2 기대하진 말아요" title="별점2 기대하진 말아요">
								<input type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점3 무난했어요" title="별점3 무난했어요">
								<input type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점4 기대해도 좋아요!" title="별점4 기대해도 좋아요!">
								<input type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점5 너무 멋진 영화였어요!" title="별점5 너무 멋진 영화였어요!">
								<input type="hidden" name="starScore">
							</div>
							
							<p class="text-center" style="font-size: 13px; margin-top:46px; color: #666; text-align: center;">평점을 입력해주세요</p>
						</div>
							<div style="width: 570px;">
								<textarea class="comment" rows="10" cols="30" maxlength="100" readonly onkeyup="로그인 후 댓글 작성 가능합니다."></textarea>
							</div>
							<div>
								<button type="submit" style="height: 86px; width: 86px;"   class="btn movie" onclick="return false;">등록</button>
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
						<div style="width: 56px;"><img src="http://image2.megabox.co.kr/mop/home/user/profile_m.png" width="56px;" height="56px;"></div>
						
						<div style="margin-bottom: 1px; overflow: hidden; margin-top: 7px; width: 300px; margin-left: 10px"> 
							<div class="name"><strong>${vo.userId}</strong></div>
							<div class="text">
								<span style="margin-left: 15px;">${vo.created}</span>
								<div>
									<span style="margin-left: 15px;" class="small_star">
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