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


</script>

<div>
	<div>
		<c:forEach var="vo" items="${areaList}" >
			<span><a href="javascript:listBranch('${vo.areaCode}')">${vo.areaName}</a></span>
		</c:forEach>
	</div>
	<div id="listBranchs">
		<c:forEach var="dto" items="${branchList}" >
			<span><a href="javascript:listBranch('${dto.branCode}')">${dto.branName}</a></span>
		</c:forEach>
	</div>
	<div id="articleBranch">
	</div>
</div>