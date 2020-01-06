<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
div{
float: left;
margin: 0px auto;
}

.type{
margin-top: 15px;
}

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
    width: 519px;
    font-size: 14px;
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
}

.rate{
	width :158px;
}

.reply {
    clear: both;
    overflow: hidden;
    width: 100%;
    display: table;
    border-top: 1px solid #f0f0f0;
    border-bottom: 1px solid #f0f0f0;
}

.row{
	display: table-row;
    height: 100%;
    margin-right: -15px;
    margin-left: -15px;
}

.cell{
	display: table-cell;
    vertical-align: top;
    width: 45%;
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
</style>


<script>
var movieNm ="${movie.movieNm}"+' 예고편';

$(document).ready(function () {
	showTrailer();
});

function showTrailer(){
	
	$.ajax({
		  dataType: "json",
		  url: 
		    'https://www.googleapis.com/youtube/v3/search'+
		    '?part=snippet'+
		    '&maxResults=1'+
		    '&order=relevance'+
		    '&q='+encodeURI(movieNm)+
		    '&type=video'+
		    '&videoDefinition=high'+
		    '&key=AIzaSyChPQ7wyJdU2QcGXf3DJqeqAy4uHhdRdLA'
		    
		}).done(function(data){
		    /* Initial */
		    var tag = document.createElement('script');
		    tag.src = "https://www.youtube.com/iframe_api";
		    var firstScriptTag = document.getElementsByTagName('script')[0];
		    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
	
		    onYouTubeIframeAPIReady = function(event){
		        player = new YT.Player('youtube-player', {
		            videoId: data.items[0].id.videoId
		        });
		    }
		});
}

</script>


<div style="width: 950px; min-height: 2000px; margin: 0px auto;">
	
	
	
	<div style="width: 890px; height: 380px; margin: 0px auto; margin-top: 40px; float: left;">
		
			<div style="width:240px; height: 350px; margin-left: 10px; float: left;">
				<img src="${movie.thumbNail}" style="width: 230px; height: 336px;">
			</div>
		
		
		<div style="width: 630px; height: 330px; margin-left: 10px;">

			<div style="width:100%; height: 60px; border-bottom: 2px; border-bottom-style: dotted;">
				<h2 style="height: 100%; margin: 0px auto;">
					<c:choose>
					      <c:when test="${movie.audits == '전체'}">
					      		<p style="margin-left: 5px; margin-right: 10px; font-size: 12pt; color: white; height:32px; width: 33px; float: left;
					      						 border-style: solid; border-width: 3px; border-color: green; border-radius: 5px; background: green; ">${movie.audits}</p>
					      </c:when>
					      <c:when test="${movie.audits == '12'}">
					      	<p style="margin-left: 5px; margin-right: 10px; font-size: 12pt; color: white; height:32px; width: 33px; float: left;
					      						 border-style: solid; border-width: 3px; border-color: #3DB7CC; border-radius: 5px; background-color: #3DB7CC; ">${movie.audits}</p>
					      </c:when>
					      <c:when test="${movie.audits == '15'}">
					      		<p  style="margin-left: 5px; margin-right: 10px; font-size: 12pt; color: white; height:32px; width: 33px; float: left;
					      						 border-style: solid; border-width: 3px; border-color: orange; border-radius: 5px; background: orange;">${movie.audits}</p>
					      </c:when>
					      <c:otherwise>
					      	<p style="margin-left: 5px; margin-right: 10px; font-size: 12pt; color: white; height:32px; width: 33px; float: left;
					      						 border-style: solid; border-width: 3px; border-color: red; border-radius: 5px; background: red; ">${movie.audits}</p>
					      </c:otherwise>
				     </c:choose>
					<span style="font-weight: bold;">${movie.movieNm}</span>
				</h2>
			</div>
		
		
		
		
			<div style="width: 623px; height: 206px;">
				
				<div style="width:100%; height: 45px;">
					<span style="height: 15px; width: 90px; display: block;">별 몇개</span>
					<p style="height: 42px; float: left;">
						<span style="float: left; width: 80px; height: 42px; margin-top: 15px;">3353명 참여</span>
						<strong style="float:left; font-weight: 700; font-family: '나눔고딕'; font-size: 30px; margin-left: 35px;">7.1점</strong>
						<span style="width: 1px; height: 80%; background-color: #e1e1e1; float: left; margin-left: 10px;"></span>
					</p>
					
					<p style="margin-left: 25px;width: 181px; height: 42px; float: left; font-size: 18px;">
						예매율 
						<strong style="font-size: 30px;">1위</strong>
						<span>19.6%</span> 
					</p>
					<button class="btn" style="margin-top: 5px; margin-right: 10px; float:right;">예매하기</button>
				</div>
				
				<ul style="margin-top: 70px; ">
					<li class="type">
						<strong>
						타입 : <span class="showing"></span>
						</strong>
					</li>
					
					<li class="type">
						<strong>
						개봉일 : <span>${movie.startDate}</span>
						</strong>
					</li>
					
					<li class="type">
						<strong>
						감독 : <span class="moviedirector"></span>
						</strong>
					</li>
					
					<li class="type">
						<strong>
						출연진 : <span class="actor"></span>
						</strong>
					</li>
					
					<li class="type">
						<strong>
						장르 : <span class="genre"></span>/ <span class="mtime"></span>
						</strong>
					</li>
					
					<li class="type">
						<strong>
							누적관객 : <span class="audience" style="width: 300px; margin-right: 10px;"></span>| <strong>전일관객 : <span class="dailyAudience" style="width: 300px; margin-left: 10px;"></span></strong>
						</strong>
					</li>
				</ul>
			</div>
			
		</div>


	</div>


	<div style="width: 888px; min-height: 270px;">
		<h3>줄거리</h3>
		<div class="movieStory" style="width:700px; font-size: 20px;">${movie.movieStory}</div>
	</div>

	
	<div class="youtube" style="width: 888px; height: 625px;">
		<h3>예고편</h3>
	  	<div class="youtube-selected">
	   		<div id="youtube-player" style="width:888px; height: 500px;"></div>
	  	</div>
	</div>


	<div class="writewrap" style="width: 888px; height: 1070px;">
		<h3>한줄평(개수)</h3>
		


		<div style="height: 123px;">

			<div style="width: 56px; float: left; padding-top: 33px; margin-right: 24px;">
				<img src="http://image2.megabox.co.kr/mop/home/user/profile_m.png" width="56px;" height="56px;">
			</div>
			
			
			<div style="width: 780px; height: 90px; float: right; padding-top: 20px; margin-left: 10px;">
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
							<div style="width: 520px;">
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
			<div class="reply">
				<div class="row">
					
					<div style="float: left;" class="cell">
						<div style="width: 80px;"><img src="http://image2.megabox.co.kr/mop/home/user/profile_m.png" width="56px;" height="56px;"></div>
						
						<div style="margin-bottom: 1px; overflow: hidden; margin-top: 13px;"> 
							<div class="name"><strong>아이디</strong></div>
							<div class="text">
								<span style="margin-left: 15px;">20.01.06</span>
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
									<span class="comment">너무 노잼이에요 ㅎ;</span>
								</p>
							</div>
						</div>
						
						<div class="btn_wrap">
							
							<div class="recommend" onclick="MovieComment.like('7D2A4834-8C26-4965-8348-E48BE5137F07', 'N')">
								<i class="i_recommend" aria-hidden="true"></i>추천<strong>1</strong>
							</div>
							
							<div class="report" onclick="MovieComment.showReportSpoiler(this);">
								<i class="i_report" aria-hidden="true"></i>신고하기
							</div>
							
							<div class="btn_edit_wrap" style="display: none;">
								<ul>
									<!-- //TODO 코멘트ID? -->
									<li><a href="javascript:void(0);" onclick="MovieComment.checkReportSpoiler(this, '10', '016599', '7D2A4834-8C26-4965-8348-E48BE5137F07');" title="스포일러 신고">스포일러 신고</a></li>
									<li><a href="javascript:void(0);" onclick="MovieComment.checkReportSpoiler(this, '20', '016599', '7D2A4834-8C26-4965-8348-E48BE5137F07');" title="욕설/비방/광고 신고">욕설/비방/광고 신고</a></li>
								</ul>
							</div>
							
						</div>
						
					</div>
					
					
					<div class="cell">
						<div style="width: 80px;"><img src="http://image2.megabox.co.kr/mop/home/user/profile_m.png" width="56px;" height="56px;"></div>
						
						<div style="margin-bottom: 1px; overflow: hidden; margin-top: 13px;"> 
							<div class="name"><strong>아이디</strong></div>
							<div class="text">
								<span style="margin-left: 15px;">20.01.06</span>
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
									<span class="comment">너무 노잼이에요 ㅎ;</span>
								</p>
							</div>
						</div>
						
						<div class="btn_wrap">
							
							<div class="recommend" onclick="MovieComment.like('7D2A4834-8C26-4965-8348-E48BE5137F07', 'N')">
								<i class="i_recommend" aria-hidden="true"></i>추천<strong>1</strong>
							</div>
							
							<div class="report" onclick="MovieComment.showReportSpoiler(this);">
								<i class="i_report" aria-hidden="true"></i>신고하기
							</div>
							
							<div class="btn_edit_wrap" style="display: none;">
								<ul>
									<!-- //TODO 코멘트ID? -->
									<li><a href="javascript:void(0);" onclick="MovieComment.checkReportSpoiler(this, '10', '016599', '7D2A4834-8C26-4965-8348-E48BE5137F07');" title="스포일러 신고">스포일러 신고</a></li>
									<li><a href="javascript:void(0);" onclick="MovieComment.checkReportSpoiler(this, '20', '016599', '7D2A4834-8C26-4965-8348-E48BE5137F07');" title="욕설/비방/광고 신고">욕설/비방/광고 신고</a></li>
								</ul>
							</div>
							
						</div>
						
					</div>
					
					
					
					
					
					
					
				
				</div>
				
				
				<div class="row"></div>
				<div class="row"></div>
				<div class="row"></div>
				<div class="row"></div>
			</div>
			
			<ul>
				<li style="list-style: none;">page</li>
			</ul>
		</div>
		
	</div>
	
				
				
				<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     	<tr height="45"> 
			      		<td align="center" >
			        		<button type="button" onclick="submitMovie();">${mode=='update'?'수정완료':'등록하기'}</button>
			        		<button type="reset" name="resetMovie">다시입력</button>
				 		</td>
			    	</tr>
			  </table>
	
</div>

	