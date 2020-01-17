<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style type="text/css">
.imgLayout{
	width: 190px;
	height: 190px;
	margin-bottom: 80px;
	cursor: pointer;
}
.itemName {
     width:180px;
     height:70px;
     line-height:25px;
     margin:5px auto;
     border: 1px solid #DAD9FF;
     cursor: pointer;
}

</style>

<script type="text/javascript">
function searchList() {
	var f=document.searchForm;
	f.submit();
}

function article(itemCode) {
	var url="${articleUrl}&itemCode="+itemCode;
	location.href=url;
}

</script>
<body>
	<div class="barContent">
		<img style="width: 100%" height="272px;" src='<%=cp%>/resource/images/capture.png'>
	</div>
<div class="body-container" style="width: 840px; height: 2100px;">
	
	<div> <h4>
		<a href="javascript:window.scrollTo(0,420);">영화티켓</a> | 
		<a href="javascript:window.scrollTo(0,1060);">특별할인</a> |
		<a href="javascript:window.scrollTo(0,1700);">먹거리</a> </h4>
	
	</div>
	
	<div>
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
			<c:set var="cnt" value="0"/>
			<c:set var="itemPart" value=""/>
			
			<c:forEach var="dto" items="${list}" varStatus="status">
				<c:if test="${cnt!=0 && cnt%4==0}">
				    <c:set var="cnt" value="0"/>
					<c:out value="</tr><tr>" escapeXml="false"/>
				</c:if>
				
				<c:if test="${cnt!=0 && itemPart != dto.itemPart}">
					<c:forEach var="i" begin="${cnt%4+1}" end="4" step="1">
					   <td width="210">
						   <div class="imgLayout">&nbsp;</div>
					   </td>
				    </c:forEach>
				    <c:out value="</tr>" escapeXml="false"/>
				</c:if>

				<c:if test="${status.index==0 || itemPart != dto.itemPart}">
					<c:set var="cnt" value="0"/>
					<c:set var="itemPart" value="${dto.itemPart}"/>
					
					
					<tr height="35">
					  <td colspan="4" align="left" style="padding: 30px 10px 10px 10px;"><h3 style="margin-top: 30px;">${dto.itemPart}</h3></td>
					</tr>
					<tr>
				</c:if>
				
				<c:set var="cnt" value="${cnt+1}"/>
				<td width="210" height="210" align="center">
					<div class="imgLayout">
						<img src="/mgbxAD/uploads/item/${dto.itemImg}" width="180" 
							height="180" border="0" onclick="javascript:article('${dto.itemCode}');">
						<div class="itemName" onclick="javascript:article('${dto.itemCode}')">	
							<div style="display:block; width: 150px; height: 20px; word-wrap:break-word;">${dto.itemName}</div>
							<div style="text-align: right; margin-right: 5px;padding-top: 25px;">${dto.itemPrice}원</div>
						</div>
					</div>
				</td>	
			</c:forEach>
			
			<c:if test="${cnt!=0}">
			    <c:forEach var="i" begin="${cnt%4+1}" end="4" step="1">
			       <td width="210">
					  <div class="imgLayout">&nbsp;</div>
					</td>
				</c:forEach>
				<c:out value="</tr>" escapeXml="false"/>
			</c:if>	
		</table>
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			<tr height="30">
				<td align="center">
					${dataCount==0?"등록된 게시물이 없습니다.":""}
				</td>
			</tr>		
		</table>
	
	</div>
	

</div>
</body>