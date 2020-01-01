<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">

$(function(){
	var type="get";
	var query="branCode=${branchList[0].branCode}";
	var url="<%=cp%>/branchCla/article";
	var selector="#articleBranch";
	
	ajaxHTML(url, type, query, selector);
});

function ajaxJSON(url, type, query, fn) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			fn(data);
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
		
	});
}



function listArea(parent){
	var type="get";
	var query="parent="+parent;
	var url="<%=cp%>/branchCla/list";
	var fn=function (data){
		$("#listBranchs").empty();
		 
		if(data.length>0){
			for(var i=0;i<data.length;i++){
		  		var lb="<span><a href='javascript:readBranch(\""+data[i].branCode+"\")'>"+data[i].branName+"</a></span>";
		  		$("#listBranchs").append(lb);
			}
		}else{
			var lb="<span>해당 지역에는 지점이 존재하지 않습니다.</span>";
	  		$("#listBranchs").append(lb);
		}
		
	};
	
	ajaxJSON(url, type, query, fn);
	
}

function readBranch(branCode){
	var type="get";
	var query="branCode="+branCode;
	var url="<%=cp%>/branchCla/article";
	var selector="#articleBranch";
	
	$("#articleBranch").empty();
	
	ajaxHTML(url, type, query, selector);
	
}
</script>

<div>
	<div id="listAreas">
		<c:forEach var="vo" items="${areaList}" >
			<span><a href="javascript:listArea('${vo.parent}')">${vo.areaName}</a></span>
		</c:forEach>
	</div>
	<div id="listBranchs">
		<c:forEach var="dto" items="${branchList}" >
			<span><a href="javascript:readBranch('${dto.branCode}')">${dto.branName}</a></span>
		</c:forEach>
	</div>
	<div id="articleBranch">
	</div>
</div>