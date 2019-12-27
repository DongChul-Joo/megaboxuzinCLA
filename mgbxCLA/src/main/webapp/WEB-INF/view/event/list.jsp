<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
.ll {
list-style:none;
margin:0px auto; width: 1000px;
}

.title{
font-size: X-large;
}

.ll li{
display:block; width:140px; height:40px; background:#D5D5D5; color:#fff; border:1px black; font-size:12px; font-family:"돋움";
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
}

.a1{

}

</style>

<script type="text/javascript">  
function article(ecode) {
	var url="${articleUrl}&ecode="+ecode;  
	location.href=url;
}
</script>

<div class="body-container" style="width: 1000px;">

<div style="width: 1000px; height:100px; background-color: white; ">
    <ul class="ll" > 
        <li><a href="<%=cp%>/event/list?ecategoryCode=0">전체</a></li>
        <li><a href="<%=cp%>/event/list?ecategoryCode=1">메가박수진이벤트</a></li>
        <li><a href="<%=cp%>/event/list?ecategoryCode=2">영화 이벤트</a></li>   
        <li><a href="<%=cp%>/event/list?ecategoryCode=3">제휴 이벤트</a></li>
        <li><a href="<%=cp%>/event/list?ecategoryCode=4">영화관이벤트</a></li>
        <li><a href="<%=cp%>">당첨자발표</a></li>
        <li><a href="<%=cp%>">현황 통계</a></li>
    </ul>
</div>

<div style="width: 100%; height: 5%;">
	<ul class="lo">
		<li><a href="<%=cp%>/event/list?state=1&ecategoryCode=${ecategoryCode}">진행중 이벤트 | </a></li>
		<li><a href="<%=cp%>/event/list?state=0&ecategoryCode=${ecategoryCode}">종료된 이벤트</a></li>
	</ul>

</div>
<table style="width: 1000px; margin: 80px auto; border-spacing: 0px;">
<c:forEach var="dto" items="${list}" varStatus="status">
	<c:if test="${dtatus.index==0}">
		<tr>
	</c:if>
	<c:if test="${status.index!=0 && status.index%4==0}">
    	<c:out value="</tr><tr>" escapeXml="false"/>
    </c:if>
	<td width="20px" align="center" style="padding-bottom: 30px">
		<div>
			<img src="<%=cp%>/uploads/event/${dto.imageFilename}" width="200"
				height="180" border="0" onclick="article('${dto.ecode}');">
		</div>
		
		<div style="height: 70px; width: 200px; border: 1px solid #BDBDBD; background-color: white;">
			<span class="title" onclick="javascript:article('${dto.ecode}');" >
				${dto.subject}<br>
				</span>
				<span>${dto.sdate} ~ ${dto.edate}</span>
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
