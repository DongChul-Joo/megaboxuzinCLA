<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
display:block; width:14%; height:40px; color:#fff; border:1px black; font-size:12px; font-family:"돋움";
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

.sub{
color: black;
text-align: center;
background: #eeeeee;
}
</style>

<div class="center">
	<div style="width: 55%; margin: 10px auto;">
    <ul class="ll" > 
        <li><a href="<%=cp%>/event/list?ecategoryCode=0">전체</a></li>
        <li><a href="<%=cp%>/event/list?ecategoryCode=1">메가박수진이벤트</a></li>
        <li><a href="<%=cp%>/event/list?ecategoryCode=2">영화 이벤트</a></li>   
        <li><a href="<%=cp%>/event/list?ecategoryCode=3">제휴 이벤트</a></li>
        <li><a href="<%=cp%>/event/list?ecategoryCode=4">영화관이벤트</a></li>
        <li><a href="<%=cp%>/roto/listDott">당첨자발표</a></li>
    </ul>
    </div>
</div>

<div class="body-container" style="width: 700px;">
    <div class="body-title">
        <h3><i class="far fa-image"></i> ${dto.subject} </h3>
    </div>
    
    <div>
    	<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
    	
    		<tr height="30">
        		<td align="left" style="padding-left: 10px;">
			    	 ${dto.pubDate}
				</td>
				
			</tr>
    		<tr height="50">
        		<td align="left" style="padding-right: 10px; border-spacing: 0px; border-collapse: collapse;">
			    	 ${dto.content}
				</td>
				
			</tr>
    	</table>
    	
    </div>
    
    <div style="width: 100%; margin: 10px auto 0px; text-align: center;">
        <div style="border-bottom: 2px solid #503396;">

        </div>
        
        <c:if test="${listPic.size()!=0}">
        <div>
    	<table style="width: 100%; margin: 10px auto 0px; border-spacing: 0px; border-collapse: collapse;">
    		<caption style="height:35px;"><span style="font-weight: 700; font-size: 16px; text-align: center;">이벤트 당첨자 명단</span></caption>
			<tr height="35" style="border-top: 1px solid #cccccc;border-bottom: 1px solid #cccccc; text-align: center" background="">
			    <th class="sub">아이디</th>
			    <th class="sub">이름</th>
			    <th class="sub">전화번호</th>
			    <th class="sub">이메일</th>
			</tr>
			
			<c:forEach var="vo" items="${listPic}">
				<tr height="35" align="center" style="border-bottom: 1px solid #cccccc;">
				    
				    <td> <c:set var="id" value="${vo.userId}" />
						 <c:set var="totalLength" value="${fn:length(id)}"/>
				 		 <c:set var="first" value="${fn:substring(id, 0, 2)}"/>
				 		 <c:set var="last" value="${fn:substring(id, 4, totalLength)}"/>
				    		<c:out value="${first}**${last}">${vo.userId}</c:out></td>
				    		
					<td> <c:set var="name" value="${vo.userName}" />
						 <c:set var="totalLength" value="${fn:length(name)}"/>
				 		 <c:set var="first" value="${fn:substring(name, 0, 1)}"/>
				 		 <c:set var="last" value="${fn:substring(name, 2, totalLength)}"/>
				    		<c:out value="${first}*${last}">${vo.userName}</c:out></td>
				    		
				    <td> <c:set var="tel" value="${vo.tel}" />
						 <c:set var="totalLength" value="${fn:length(tel)}"/>
				 		 <c:set var="first" value="${fn:substring(tel, 0, 5)}"/>
				 		 <c:set var="last" value="${fn:substring(tel, 8, totalLength)}"/>
				    		<c:out value="${first}***${last}">${vo.tel}</c:out></td>
				    		
				    <td> <c:set var="email" value="${vo.email}" />
						 <c:set var="totalLength" value="${fn:length(email)}"/>
				 		 <c:set var="first" value="${fn:substring(email, 0, 3)}"/>
				 		 <c:set var="last" value="${fn:substring(email, 6, totalLength)}"/>
				   			<c:out value="${first}***${last}">${vo.email}</c:out></td>
				</tr>
			</c:forEach>
		</table>
        </div>
        </c:if>
    </div>
	</div>
