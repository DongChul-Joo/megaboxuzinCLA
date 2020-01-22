<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
.title{
font-size: 18px;
text-overflow: ellipsis;
overflow: hidden;
margin-left: 5px; 
font-weight: bold;
display: inline-block;
white-space: nowrap;
width: 200px;
height: 30px;
display: block;
margin-top: 10px;
}

.ll {
list-style:none;
font-family: center;
width:50%;
height:100%;
margin: 0px auto;
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
margin: 20px 0;
}


.* {
font-family: 'Sunflower', sans-serif;

}

.center {
text-align: center;
height :60px;
background-color: white; 
padding-top : 5px;
width:100%;
border-top : 1px;
border-bottom: 3px solid #503396;
background-color: #EAEAEA;
}
</style>

<script type="text/javascript">  
function article(ecode) {
	var url="${articleUrl}";  
	var query="ecode="+ecode+"&state=${state}";
	var type="get";
	var selector="#readEventForm";
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			$(selector).html(data);
			listPage(1);
		}
		
	    ,error:function(jqXHR) {
	    
	    }
	});
	
	$("#readEventForm").dialog({
		modal: true,
		height:'auto',
		width:850,
		title: "",
		position: { my:"center top+30", at:"center top+30", of: window },
		open:function(){
       	 //$(this).parents(".ui-dialog:first").find(".ui-dialog-titlebar").remove();
       	 $(this).parents(".ui-dialog:first").find(".ui-dialog-titlebar").css({"background":"none","border":"none","border-bottom":"1px solid #cccccc"});
        },
		close: function(event, ui) {
		}
	});
	
}


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
			console.log(data);
			$(selector).html(data);
		}
		
	    ,error:function(jqXHR) {
	    
	    }
	});
}


function listPage(page) {
	var url = "<%=cp%>/event/listReply";
	var ecode=$(".btnSendReply").attr("data-code");
	var query = "ecode="+ecode+"&pageNo="+page;
	var selector = "#listReply";
	
	ajaxHTML(url, "get", query, selector);
}

//리플 등록

	$(document).on("click",".btnSendReply",function(){
		var ecode=$(this).attr("data-code");
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


// 댓글 삭제
	$(document).on("click", ".deleteReply", function(){
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

//댓글별 답글 등록
	$(document).on("click", ".btnSendReplyAnswer", function(){
		var ecode=$(".btnSendReply").attr("data-code");
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

//답글 버튼(댓글별 답글 등록폼 및 답글리스트)
	$(document).on("click", ".btnReplyAnswerLayout", function(){
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
	$(document).on("click", ".deleteReplyAnswer", function(){
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

// 댓글 좋아요 / 싫어요
	// 댓글 좋아요 / 싫어요 등록
	$(document).on("click", ".btnSendReplyLike", function(){
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

// 댓글 신고
	$(document).on("click", ".btnSendReplyReport", function(){
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


// 이벤트 응모

	$(document).on("click", ".btnSendRequest", function(){
		var ecode=$(".btnSendReply").attr("data-code");
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

</script>

<div class="center">
    <ul class="ll" > 
        <li><a href="<%=cp%>/event/list?ecategoryCode=0">전체</a></li>
        <li><a href="<%=cp%>/event/list?ecategoryCode=1">메가박수진이벤트</a></li>
        <li><a href="<%=cp%>/event/list?ecategoryCode=2">영화 이벤트</a></li>   
        <li><a href="<%=cp%>/event/list?ecategoryCode=3">제휴 이벤트</a></li>
        <li><a href="<%=cp%>/event/list?ecategoryCode=4">영화관이벤트</a></li>
        <li><a href="<%=cp%>/roto/listDott">당첨자발표</a></li>
    </ul>
</div>


<div class="body-container" style="width: 1000px; margin: 50px auto 25px;">
<div style="width: 100%;">
	<ul class="lo">
		<li><a href="<%=cp%>/event/list?state=1&ecategoryCode=${ecategoryCode}">진행중 이벤트 | </a></li>
		<li><a href="<%=cp%>/event/list?state=0&ecategoryCode=${ecategoryCode}">&nbsp;종료된 이벤트</a></li>
	</ul>

</div>
<table style="width: 1000px; margin: 80px auto 5px; border-spacing: 0px;">
<c:forEach var="dto" items="${list}" varStatus="status">
	<c:if test="${dtatus.index==0}">
		<tr>
	</c:if>
	<c:if test="${status.index!=0 && status.index%4==0}">
    	<c:out value="</tr><tr>" escapeXml="false"/>
    </c:if>
	<td width="20px" align="center" style="padding-bottom: 30px">
		<div style="cursor: pointer;">
			<img src="/mgbxAD/uploads/event/${dto.imageName}"
			width="230" height="300" border="0" onclick="article('${dto.ecode}');">
		</div>
		
		<div style="height: 70px; width: 230px; border: 1px solid #BDBDBD; background-color: white;">
			<p class="title" onclick="javascript:article('${dto.ecode}');">
				${dto.subject}
				</p>
				<p>${dto.sdate} ~ ${dto.edate}</p>
		</div>
	</td>     
</c:forEach>
	<c:set var="n" value="${list.size()}"/>
	<c:if test="${n>0&&n%4!=0}">
		        <c:forEach var="i" begin="${n%4+1}" end="4" step="1">
			         <td width="210">
			             <div class="imgLayout">&nbsp;</div>
			         </td>
		        </c:forEach>
	</c:if>
	
	<c:if test="${n!=0}">
		       <c:out value="</tr>" escapeXml="false"/>
	</c:if>
		</table>           
		 
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
			    ${dataCount==0?"등록된 게시물이 없습니다.":paging}
			 </td>
		   </tr>
		</table>
</div>

<div id="readEventForm" style="display: none; overflow: none;"></div>
