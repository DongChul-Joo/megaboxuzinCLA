-<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style type="text/css">

#movieDetail{

	float: left;
	margin: 0px auto;
}

.type{
margin-top: 15px;
list-style: none;
}

.input {
    overflow: hidden;
    height: 86px;
    border: 1px solid #e1e1e1;
    float: left;
}


.writeReply{
    height: 84px;
    font-size: 14px;
    border: 1px solid #e1e1e1;
    background-color: #fff;
}

textarea{
	display: block;
    width: 100%;
    padding: 10px;
    border: 1px solid #d9d9d9;
    background-color: #f8f8f8;
    font-size: 12px;
    line-height: 21px;
    color: #333;
    overflow: auto;
    vertical-align: top;
}

.starwrap {
    cursor: pointer;
    text-align: center;
    padding-top: 15px;
    float: left;
    display: block;
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
	float: left;
}

.reply {
    clear: both;
    overflow: hidden;
    width: 100%;
    display: table;
    border : 1px solid #f0f0f0;
    margin-left: 25px;
    float: left;
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
    height: 200px;
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

.fullStar{
	float: right;
    position: relative;
    width: 119px;
    height: 20px;
    background: url(http://image2.megabox.co.kr/mop/home/bg_star.png) 0 0 no-repeat;
}

.fill{
	position: absolute;
    width: 119px;
    height: 20px;
    float: right;
    background: url(http://image2.megabox.co.kr/mop/home/bg_star.png) 0 -20px no-repeat;
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
	width: 100%;
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
	float: left;
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
 
 
.btn_modify{
	display: inline-block;
    width: 40px;
    height: 25px;
    border: none;
    vertical-align: middle;
    margin-top: -5px;
    float: right;
}


.btn_delete{
	display: inline-block;
  	width: 40px;
    height: 25px;
    border: none;
    vertical-align: middle;
    margin-top: -5px;
    float: right;
}

</style>

<script type="text/javascript">
function ajaxHTML(url, type, query, selector) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			$(selector).html(data);
		}
	});
}

function ajaxJSON(url, type, query, fn) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			fn(data);
		}
	    ,error:function(jqXHR) {
	    }
	});
}


function modalExit() {
	$("#showDetail").dialog("close");
}



function showMovieDetail(movieCode){
	var url ="<%=cp%>/movie/comingsoon/movieDetail";
	var query ="movieCode="+movieCode; 
	var selector = "#showDetail";
	var type="get";

	$("#showDetail").empty();
	ajaxHTML(url, type, query, selector);
	detailMovie(movieCode);
	
    			$("#showDetail").dialog({
					modal: true,
					height:2000,
					width:1000,
					title: "상세 정보", 
					open:function(){
			               $(this).parents(".ui-dialog:first").find(".ui-dialog-titlebar").remove();
		            },
					close: function(event, ui) {
						window.location.reload();
					}
	});
}

function detailMovie(movieCd){
	var url="<%=cp%>/movie/comingsoon/showDetail";
	var query="movieCode="+movieCd;
	
	      jQuery.ajax({
	         type:"get"
	         ,url:url
	         ,data:query
	         ,dataType:"json"
	         ,success:function(data){
	            
	        	 console.log(data);
	        	
	        	var director="";
	        	if(data.movieInfoResult.movieInfo.directors.length > 0){
		        	for(var i=0; i<data.movieInfoResult.movieInfo.directors.length; i++){
		            	director +=data.movieInfoResult.movieInfo.directors[i].peopleNm+"&nbsp&nbsp&nbsp";
		        	}
		            	
		        	jQuery("span[class=moviedirector]").html(director);
	        	} else {
	        		jQuery("span[class=moviedirector]").html("");
	        	}
	        	
	        	var showType="";
	        	if(data.movieInfoResult.movieInfo.showTypes.length> 0){
		            for(var i=0; i<data.movieInfoResult.movieInfo.showTypes.length; i++){
		            	showType += data.movieInfoResult.movieInfo.showTypes[i].showTypeGroupNm+"("
		        	  		+data.movieInfoResult.movieInfo.showTypes[i].showTypeNm+")&nbsp&nbsp&nbsp";
		            }
		           		 jQuery("span[class=showing]").html(showType);
		            
	        	} else {
	        		jQuery("span[class=showing]").html("");
	        	}
	        	
	            var actors="";
	            if(data.movieInfoResult.movieInfo.actors.length >0){
		        	for(var i=0; i<6; i++){
		        	  	actors += data.movieInfoResult.movieInfo.actors[i].peopleNm+"&nbsp&nbsp&nbsp";
		            }
		        	jQuery("span[class=actor]").html(actors);
	            } else {
	            	jQuery("span[class=actor]").html("");
	            }
	            
	            var genre="";
	            if(data.movieInfoResult.movieInfo.genres.length > 0){
		            for(var i=0; i<data.movieInfoResult.movieInfo.genres.length; i++){
		            	genre +=data.movieInfoResult.movieInfo.genres[i].genreNm+"&nbsp&nbsp&nbsp" ;
		            }
		            jQuery("span[class=genre]").html(genre);
	            } else {
	            	jQuery("span[class=genre]").html("");
	            }
	            
	            showTime="";
	            if(data.movieInfoResult.movieInfo.showTm > 0){
		            showTime= data.movieInfoResult.movieInfo.showTm+"분";
	            	
		            jQuery("span[class=mtime]").html(showTime);
	            } else {
	            	jQuery("span[class=mtime]").html("");
	            }
	          
	            
	         }
	         ,error:function(e){
	            console.log(e.responseText);
	        
	         }
	   });
}

function showTrailer(movieNm){
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

var movieCode="0";
function listPage(page) {
	var url = "<%=cp%>/movie/comingsoon/listReply";

	var query = "movieCode="+movieCode+"&pageNo="+page;
	var selector = "#listReply";
	
	ajaxHTML(url, "get", query, selector);
}
	
function btnSendReply(movieCode){ 
		var userId= $("strong[class=getUserId]").val();
		var content=$("textarea[class=writeReply]").val();
		
		console.log(content);
		if(! content) {
			content.focus();
			return false;
		}
		
		content = encodeURIComponent(content);
		var url="<%=cp%>/movie/comingsoon/insertReply";
		var query="movieCode="+movieCode+"&content="+content;
		
		var fn = function(data){
			$("textarea[class=writeReply]").empty();
			$("input[class=getStar]").empty();
			var state=data.state;
			if(state=="true"){
				listPage(1);
			} else if(state=="false") {
				alert("댓글은 하나만 ^_^");
			}
		};
		
		ajaxJSON(url, "post", query, fn);
	
};


function replyRemove(movieCode){
	if(! confirm("게시물을 삭제하시겠습니까?")) {
		return false;
	}
	
	var page=$("span[class=curBox]").val();
	
	var url="<%=cp%>/movie/comingsoon/deleteReply";
	var query="movieCode="+movieCode;
	
	var fn = function(data){
		location
		listPage(page);
	};
	
	ajaxJSON(url, "post", query, fn);	

}

function replyEdit(obj){
	var movieCode = $("#movieCode").val();
	var content=$(obj).parent().children('div.textarea').find('span.comment');
	
	content.html("<textarea id='commentContent' style='height:54px;' rows='10' cols='30' maxlength='100'></textarea>");
	$("button[class=btn_delete]").remove();
	
	var button = $("button[class=btn_modify]");
	button.empty().html("<button type='button' class='btn_modify' style='width: 70px; height: 30px;' onclick='replyEditDone(\""+movieCode+"\")'>수정완료</button>");	
	
}

function replyEditDone(movieCode){
	var content=$("#commentContent").val();
	content = encodeURIComponent(content);
	
	var url="<%=cp%>/movie/comingsoon/updateDone";
	var query="movieCode="+movieCode+"&content="+content;
	
	var fn= function(data){
		listPage(1);
	}
	ajaxJSON(url, "post", query, fn);
};

//댓글 좋아요
function commentLike(obj){
		var moviecode=$("#movieCode").val();
		var userId = $(obj).find(".rpUserId").val();
		console.log(userId);
		
		var url="<%=cp%>/movie/comingsoon/replyLike";
		var query="movieCode="+movieCode+"&userId="+userId;
		
		var fn = function(data){
			var state=data.state;
			var html = $(obj).find('strong.replyLikeCount');
			
			var count=0;
			if(data.loginState=="false"){
				alert("로그인이 필요합니다.");
				return;
			}
			
			if(state=="true"){
				count = data.count;
				alert("좋아요를 누르셨습니다.");
				
			} else if(state=="false") {
				count = data.count;
				alert("좋아요가 취소 되었습니다.");
			}
			console.log(count);
			jQuery(html).html(count);
		}
		ajaxJSON(url, "post", query, fn);
	};

	
function reportUser(userId, movieCode){
	var url = "<%=cp%>/movie/comingsoon/reportUserId";
	var query = "movieCode="+movieCode+"&userId="+userId;
	
	var fn = function(data){
		console.log(data);
		var state = data.state;
		
		if(state =="true"){
			alert("신고를 완료 하셨습니다. 3번이상 신고당하면 댓글이 자동 삭제 됩니다.");
		} else if(state =="false"){
			alert("신고는 한 번만 가능합니다.");
		}
		
		listPage(1);
	}
	ajaxJSON(url, "post", query, fn);
}
</script>


<style>
	*{margin:0;padding:0;}
	
	
	.moviemenu{
	margin-left: 100px;
	float: left;
	}
	
	.sub_navi{
	background-color : #f2f2f2;
	border-top: 1px solid #e1e1e1;
	border-bottom: 3px solid #503396;
	height: 60px;
	width: 100%
	
	}
	.sub_navi_wrap{
	width: 60%;
	padding-top: 15px;
	margin: auto;
	height: 55px;
	
	}

  
    .bbb {
    border: none;
    height: 40px;
    width: 90px;
    }

	
	.ccc{
	
	text-align: center;
	margin-top: 10px;
	
	
	}
	
	.ddd {
		margin-top: 15px;
		margin-bottom: 10px;
	}
	
	.a1 {
		display: inline-block;
	}
.sub_navi li{
	list-style: none;
}

#newMovie li{
	list-style: none;
}

.textarea {
	margin-bottom: 1px;
    overflow: hidden;
    margin-top: 7px;
    width: 300px;
    margin-left: 10px;
    float: left;
}

.expect{
    text-align: center;
    display: block;
    width: 53px;
    height: 53px;
    background: url(http://image2.megabox.co.kr/mop/home/btns/btn_movie.png) -618px -311px;
    background-repeat: no-repeat;
    font-size: 0;
    letter-spacing: -999px;
    color: transparent;
    margin: 16px auto;
} 

.dday{
	float: right;
    width: 87px;
    height: 30px;
    text-align: center;
    font-size: 18px;
    background: url(http://image2.megabox.co.kr/mop/home/movie/d_day.png);
    color: #fff;
    margin-top: 10px;
}
</style>

	<div class="sub_navi">
			<div class="sub_navi_wrap">
			 	<ul style="margin: 0px auto;">
				 	<li class="moviemenu">
				 		<a style="border: none; font-size: 18px; float: left;" href="<%=cp%>/movie/newmovie">최신 개봉작</a>
				 	 </li>
					 <li class="moviemenu">
				 		<a style="border: none; font-size: 18px; float: left;" href="<%=cp%>/movie/comingsoon/newmovie">상영 예정작</a>
				 	 </li>
				 	<li class="moviemenu">
				 		<a  style="border: none; font-size: 18px; float: left;">영화제</a>
				 	 </li>
				 	<li class="moviemenu">
				 		<a style="border: none; font-size: 18px; float: left;" href="<%=cp%>/movie/newmovie">예매</a>
				 	 </li>
				 </ul>
			 </div>
		</div>	

	
	<div id="newMovie" style="width: 100%;margin: 0 auto; min-height: 1800px;">
		
		<ul>
			<li style="margin-left: 50px;">
			
			    <c:forEach var="vo" items="${list}">
			      <div class="a1" style="height: 420px; width: 230px; float: left; margin-top: 100px; padding-right: 245px">
				      <div style="height: 336px; border: none; width: 230px;">
				      	<c:choose>
					      	<c:when test="${vo.thumbNail != 'No images'}">
					      		<img src="${vo.thumbNail}" width="230px;" height="336px;">
					      	</c:when>
				      		<c:otherwise>
				      			<div style="width: 230px; height: 336px; text-align: center;">
				      				<p style="height: 150px; font-size: 30px; padding-top: 130px;">이미지가 없습니다.</p>
				      			</div>
				      		</c:otherwise>
				      	</c:choose>
				   	  </div>
				   	 
				   	 <div style="height: 51px; width: 230px; border: 1px solid #e4e4e4; background-color: white; ">
						  <span style="float:left; font-size: 15pt; margin-top: 10px;">${vo.startDate}</span> 
						   	 
						  <span class="dday">D-${vo.dday}</span>
				   	  </div>
				   	 
				   	  
				      	<div style=" height: 110px; border: 1px solid #e4e4e4; width: 230px; background-color: white;">
				      		<div class="ccc">
				      			<c:choose>
				      				<c:when test="${vo.audits == '전체'}">
				      					<p class="ddd" style="margin-left: 5px; margin-right: 5px; font-size: 10pt; color: white; height:25px; width: 14%; float: left;
				      						 border-style: solid; border-width: 1px; border-color: green; border-radius: 5px; background: green; ">${vo.audits}</p>
				      				</c:when>
				      				<c:when test="${vo.audits == '12'}">
				      					<p class="ddd" style="margin-left: 5px; margin-right: 5px; font-size: 10pt; color: white; height:25px; width: 14%; float: left;
				      						 border-style: solid; border-width: 1px; border-color: green; border-radius: 5px; background-color: #3DB7CC; ">${vo.audits}</p>
				      				</c:when>
				      				<c:when test="${vo.audits == '15'}">
				      					<p class="ddd" style="margin-left: 5px; margin-right: 5px; font-size: 10pt; color: white; height:25px; width: 14%; float: left;
				      						 border-style: solid; border-width: 1px; border-color: green; border-radius: 5px; background: orange;">${vo.audits}</p>
				      				</c:when>
				      				<c:otherwise>
				      					<p class="ddd" style="margin-left: 5px; margin-right: 5px; font-size: 10pt; color: white; height:25px; width: 14%; float: left; border-style: solid; border-width: 1px; border-color: green; border-radius: 5px; background: red; ">${vo.audits}</p>
				      				</c:otherwise>
				      			</c:choose>
				      			<p class="ddd" style="margin-left: 5px; font-weight: bold; font-size: 15pt; width: 70%; float: left; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; display: inline-block;">${vo.movieNm}</p>
				      			<button type="button" name ="movieDetail" class="btn btn-outline-primary1" onclick="showMovieDetail('${vo.movieCode}')">상세정보</button>
				      			<button type="button" class="btn btn-outline-primary1">예매하기</button>
				      		</div>
				      </div>
			      </div>
			    </c:forEach>
			    
			</li>
		</ul>
		
	</div>	

	<div id="showDetail" style="display: none;width: 1000px;">
	</div>
	
	