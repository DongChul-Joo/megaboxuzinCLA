<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style>


.title{
font-size: X-large;
}

.ll {
list-style:none;
font-family: center;
}


.ll li{
display:block; width:140px; height:40px; color:#fff; border:1px black; font-size:12px; font-family:"돋움";
 text-align:center; padding-top:10px; text-decoration:none; float:left; list-style:none; margin: 1; font-size: large;
 }
 
.lo {
list-style:none;
float: left; 
}

.lo li{
list-style:none;
float: left;
}


.*{
font-family: 'Sunflower', sans-serif;

}

.center {
text-align: center;
height :100px;
 background-color: white; 
 width:100%;
 border-top: 3px solid #503396 ;
}

.a1{

}

</style>

<script type="text/javascript">

function eventRequest(){
	var q = "ecode=${dto.ecode}&page=${page}";
	var url = "<%=cp%>/event/rquest?" +q;
	
	if(confirm("이벤트를 응모 하시겠습니까?"))
		location.href=url;
 }

function login() {
	location.href="<%=cp%>/member/login";
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
		,beforeSend:function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==403) {
	    		login();
	    		return false;
	    	}
	    	console.log(jqXHR.responseText);
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
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==403) {
	    		login();
	    		return false;
	    	}
	    	console.log(jqXHR.responseText);
	    }
	});
}

//페이징 처리
$(function(){
	listPage(1);
});

function listPage(page) {
	var url = "<%=cp%>/event/listReply";
	var query = "ecode=${dto.ecode}&pageNo="+page;
	var selector = "#listReply";
	
	ajaxHTML(url, "get", query, selector);
}

//리플 등록
$(function(){
	$(".btnSendReply").click(function(){
		var ecode="${dto.ecode}";
		var $tb = $(this).closest("table");
		var content=$tb.find("textarea").val().trim();
		if(! content) {
			$tb.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		var url="<%=cp%>/event/insertReply";
		var query="ecode="+ecode+"&content="+content+"&answer=0";
		
		var fn = function(data){
			$tb.find("textarea").val("");
			
			var state=data.state;
			if(state=="true") {
				listPage(1);
			} else if(state=="false") {
				alert("댓글을 추가 하지 못했습니다.");
			}
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});

// 댓글 삭제
$(function(){
	$("body").on("click", ".deleteReply", function(){
		if(! confirm("게시물을 삭제하시겠습니까?")) {
			return false;
		}
		
		var rcode=$(this).attr("data-rcode");
		var page=$(this).attr("data-pageNo");
		
		var url="<%=cp%>/event/deleteReply";
		var query="rcode="+rcode+"&mode=reply";
		
		var fn = function(data){
			listPage(page);
		};
		ajaxJSON(url, "post", query, fn);	
	});
});

//댓글별 답글 등록
$(function(){
	$("body").on("click", ".btnSendReplyAnswer", function(){
		var ecode="${dto.ecode}";
		var rcode = $(this).attr("data-rcode");
		var $td = $(this).closest("td");
		var content=$td.find("textarea").val().trim();
		if(! content) {
			$td.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		var url="<%=cp%>/event/insertReply";
		var query="ecode="+ecode+"&content="+content+"&answer="+rcode;
		
		var fn = function(data){
			$td.find("textarea").val("");
			
			var state=data.state;
			if(state=="true") {
				listReplyAnswer(rcode);
				countReplyAnswer(rcode);
			}
		};
		
		ajaxJSON(url, "post", query, fn);
		
	});
});

//답글 버튼(댓글별 답글 등록폼 및 답글리스트)
$(function(){
	$("body").on("click", ".btnReplyAnswerLayout", function(){
		var $trReplyAnswer = $(this).closest("tr").next();
		
		var isVisible = $trReplyAnswer.is(':visible');
		var rcode = $(this).attr("data-rcode");
			
		if(isVisible) {
			$trReplyAnswer.hide();
		} else {
			$trReplyAnswer.show();
            
			// 답글 리스트
			listReplyAnswer(rcode);
			// 답글 개수
			countReplyAnswer(rcode);

		}
	});
});

//댓글별 답글 개수
function countReplyAnswer(answer) {
	var url = "<%=cp%>/event/countReplyAnswer";
	var query = {answer:answer};

	var fn = function(data){
		var count=data.count;
		var vid="#answerCount"+answer;
		$(vid).html(count);
	};
	
	ajaxJSON(url, "post", query, fn);
}

//댓글별 답글 리스트
function listReplyAnswer(answer) {
	var url="<%=cp%>/event/listReplyAnswer";
	var query = {answer:answer};
	var selector = "#listReplyAnswer"+answer;

	ajaxHTML(url, "get", query, selector);
}

//댓글별 답글 삭제
$(function(){
	$("body").on("click", ".deleteReplyAnswer", function(){
		if(! confirm("게시물을 삭제하시겠습니까 ? "))
		    return;
		
		var rcode=$(this).attr("data-rcode");
		var answer=$(this).attr("data-answer");
		
		var url="<%=cp%>/event/deleteReply";
		var query="rcode="+rcode+"&mode=answer";
		
		var fn = function(data){
			listReplyAnswer(answer);
			countReplyAnswer(answer);
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});

// 댓글 좋아요 / 싫어요
$(function(){
	// 댓글 좋아요 / 싫어요 등록
	$("body").on("click", ".btnSendReplyLike", function(){
		var rcode=$(this).attr("data-rcode");
		var like_Hate=$(this).attr("data-like_Hate");
		var $btn = $(this);
		var msg="댓글이 마음에 들지 않으십니까?";
		if(like_Hate==1)
			msg="댓글이 마음에 드십니까?";
		if(! confirm(msg)) {
			return false;
		}
		
		var url="<%=cp%>/event/insertReplyLike";
		var query="rcode="+rcode+"&like_Hate="+like_Hate;
		
		var fn = function(data){
			var state=data.state;
			if(state=="true") {
				var likeCount=data.likeCount;
				var disLikeCount=data.disLikeCount;
				
				$btn.parent("td").children().eq(0).find("span").html(likeCount);
				$btn.parent("td").children().eq(1).find("span").html(disLikeCount);
			} else if(state=="false") {
				alert("댓글 좋아요와 싫어요는 한번만 가능합니다 ~ !!!");
			}
		};
		ajaxJSON(url, "post", query, fn);
	});
});

// 댓글 신고
$(function(){
	$("body").on("click", ".btnSendReplyReport", function(){
		var rcode=$(this).attr("data-rcode");
		var $btn = $(this);
		
		var msg="게시물을 신고하시겠습니까?";
		if(! confirm(msg)) {
			return false;
		}
		
		var url="<%=cp%>/event/insertReplyReport";
		var query="rcode="+rcode;
		
		var fn = function(data){
			var state=data.state;
			if(state=="true") {
				alert("게시물 신고를 완료했습니다.");
			} else if(state=="false") {
				alert("게시물 신고는 한번만 가능합니다.");
			}
		};
		ajaxJSON(url, "post", query, fn);
	});
});

// 이벤트 응모
$(function(){
	$("body").on("click", ".btnSendRequest", function(){
		var ecode="${dto.ecode}";
		var $btn = $(this);
		
		var msg="이벤트 응모하시겠습니까?";
		if(! confirm(msg)) {
			return false;
		}
		
		var url="<%=cp%>/event/eventRequest";
		var query="ecode="+ecode;
		
		var fn = function(data){
			var state=data.state;
			if(state=="true") {
				alert("감사합니다 응모되셨습니다.");
			} else if(state=="false") {
				alert("이벤트는 한번만 응모 가능합니다.");
			}
		};
		ajaxJSON(url, "post", query, fn);
	});
});


</script>

<div class="center">
	<div style="width: 60%;margin: 10px auto;">
    <ul class="ll" > 
        <li><a href="<%=cp%>/event/list?ecategoryCode=0">전체</a></li>
        <li><a href="<%=cp%>/event/list?ecategoryCode=1">메가박수진이벤트</a></li>
        <li><a href="<%=cp%>/event/list?ecategoryCode=2">영화 이벤트</a></li>   
        <li><a href="<%=cp%>/event/list?ecategoryCode=3">제휴 이벤트</a></li>
        <li><a href="<%=cp%>/event/list?ecategoryCode=4">영화관이벤트</a></li>
        <li><a href="<%=cp%>/event/listDott">당첨자발표</a></li>
        <li><a href="<%=cp%>">현황 통계</a></li>
    </ul>
    </div>
</div>
 
 <div class="body-container" style="width: 1000px;">

<div class="body-container" style="width: 800px;">
    <div class="body-title">
        <h3><i class="far fa-image"></i> ${dto.subject} </h3>
    </div>
    
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
    <div style="width: 80%; margin: 10px auto 0px; text-align: center;">
    	<a href="${dto.elink}">
    		<img src="http://localhost:9090/mgbxAD/uploads/event/${dto.imageFilename}" width="70%" style="margin: 0px 10px;">
    	</a>
    	<c:if test="${dto.lott==1}">
	    	<div>
	    		<button type="button" class="btn btnSendRequest" style="margin-top: 150px;">응모하기!</button>
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
				<textarea class='boxTA' style='width:99%; height: 70px;'></textarea>
		    </td>
		</tr>
		<tr>
			<td align='right'>
				<button type='button' class='btn btnSendReply' style='padding:10px 20px;'>댓글 등록</button>
			</td>
		</tr>
	</table>


	<div id="listReply"></div>
</div>