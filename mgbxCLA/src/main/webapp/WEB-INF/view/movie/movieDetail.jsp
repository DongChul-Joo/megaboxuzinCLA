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

function ajaxHTML(url, type, query, selector) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			$(selector).html(data);
		} 
		,beforeSend:function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	
	
	});
}

$(function(){
	listPage(1);
});

function listPage(page) {
	var url = "<%=cp%>/movie/listReply";
	var query = "moviecode=${movie.movieCode}&pageNo="+page;
	var selector = "#listReply";
	
	console.log("${movie.movieCode}");
	console.log(page);
	
	ajaxHTML(url, "get", query, selector);
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

	
	<div class="youtube" style="width: 930px; height: 625px;">
		<h3>예고편</h3>
	  	<div class="youtube-selected">
	   		<div id="youtube-player" style="width:920px; height: 500px;"></div>
	  	</div>
	</div>

	
	<div id="listReply"></div>
				
	
</div>

	