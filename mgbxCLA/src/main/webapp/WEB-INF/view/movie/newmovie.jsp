-<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

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
	    	console.log(jqXHR);
	    	
	    }
	});
}

function getAudience(movieCode){
	var url ="<%=cp%>/movie/getAudience";
	
	jQuery.ajax({
        type:"get"
        ,url:url
        ,data:""
        ,dataType:"json"
        ,success:function(data){
        	
        	var item = data.boxOfficeResult.dailyBoxOfficeList;
        	if(item.length > 0){
        		for(i=0; i<item.length; i++){
	        		var code = item[i].movieCd;
	        		
	        		if(movieCode == code){
	        			var dailyAudi = item[i].audiCnt;
	        			var audience = item[i].audiAcc;
	        		}
        		}
        	}
        	
       	
       		if(dailyAudi > 0){
       			jQuery("span[class=dailyAudience]").html(dailyAudi+"명");
            }

       		if(audience > 0){
       			jQuery("span[class=audience]").html(audience+"명");
            }
            
        }
		,error:function(e){
            console.log(e.responseText);
	        
        }
	});
}

function modalExit() {
	$("#showDetail").dialog("close");
}



function showMovieDetail(movieCode){
	var url ="<%=cp%>/movie/movieDetail";
	var query ="movieCode="+movieCode; 
	var selector = "#showDetail";
	var type="get";

	$("#showDetail").empty();
	ajaxHTML(url, type, query, selector);
	detailMovie(movieCode);
	getAudience(movieCode);
	
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
	var url="<%=cp%>/movie/showDetail";
	var query="movieCode="+movieCd;
	
	      jQuery.ajax({
	         type:"get"
	         ,url:url
	         ,data:query
	         ,dataType:"json"
	         ,success:function(data){
	            
	        	
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
	var url = "<%=cp%>/movie/listReply";
	
	var query = "movieCode="+movieCode+"&pageNo="+page;
	var selector = "#listReply";
	
	ajaxHTML(url, "get", query, selector);
}


var locked=0;
function show(star){
	
	if(locked) return;
	
	var i;
	var image;
	var el;
	var e= document.getElementById('startext');
	var stateMsg;
	
	for(i=1; i <= star; i++){
		image = 'image' + i;
		el = document.getElementById(image);
		el.src = "http://image2.megabox.co.kr/mop/home/star_mid_on.png";
	}
	
	switch(star){
	case 1:
		stateMsg = "괜히 봤어요";
		break;
	case 2:
		stateMsg = "기대하진 말아요"
		break;
	case 3:
		stateMsg = "무난했어요";
		break;
	case 4:
		stateMsg = "기대해도 좋아요!";
		break;
	case 5:
		stateMsg = "너무 멋진 영화였어요!";
		break;
	default:
		stateMsg="평점을 입력해주세요";
	}
	e.innerHTML = stateMsg;
}

function noshow(star){
	if(locked) return;
	
	var i;
	var image;
	var el;
	
	for(i=1; i<= star; i++){
		image = "image" + i;
		el = document.getElementById(image);
		el.src = "http://image2.megabox.co.kr/mop/home/star_mid_off.png";
	}
}

function lock(star){
	show(star);
	locked =1;
}

function mark(star){
	locked=0;
	for(var v=0;v<=5;v++){
		if(v>star){
			noshow(v);		
		}
	}
	show(star);
	lock(star);
	
	document.movieCommentForm.star.value=star;
}


	
function btnSendReply(movieCode){ 
		var userId= $("strong[class=getUserId]").val();
		var star= $("input[class=getStar]").val();
		
		if(! star){
			alert("별점을 입력 해주세요!")
			return false;
		}
		
		var content=$("textarea[class=writeReply]").val();
		
		if(! content) {
			content.focus();
			return false;
		}
		
		content = encodeURIComponent(content);
		var url="<%=cp%>/movie/insertReply";
		var query="movieCode="+movieCode+"&content="+content+"&movieScores="+star;
		
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
	
	var url="<%=cp%>/movie/deleteReply";
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
	
	var url="<%=cp%>/movie/updateDone";
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
		
		var url="<%=cp%>/movie/replyLike";
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
			jQuery(html).html(count);
		}
		ajaxJSON(url, "post", query, fn);
	};

	
function reportUser(userId, movieCode){
	var url = "<%=cp%>/movie/reportUserId";
	var query = "movieCode="+movieCode+"&userId="+userId;
	
	var fn = function(data){
		
		var state = data.state;
		
		if(state =="true"){
			alert("신고를 완료 하셨습니다. 3번이상 신고당하면 댓글이 가려집니다.");
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
				 </ul>
			 </div>
		</div>	

	
	<div id="newMovie" style="width: 79%;margin: 0 auto; min-height: 1800px;">
		
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
					   	 <span style="float:left; font-size: 15pt;">평점 : ${vo.movieScores}</span> 
					   	 <span class="fullStar">
					   	 	<span class="fill" style="width: ${vo.totalScores}%;"></span>
					   	 </span>
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
				      			<button type="button" class="btn btn-outline-primary1" onclick="bookingForm();">예매하기</button>
				      		</div>
				      </div>
			      </div>
			    </c:forEach>
			    
			</li>
		</ul>
		
	</div>	

	<div id="showDetail" style="display: none;width: 1000px;">
	</div>
	
	