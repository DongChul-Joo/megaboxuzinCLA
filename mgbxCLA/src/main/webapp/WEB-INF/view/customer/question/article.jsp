<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
  .questionQ{
    display: inline-block;
    padding:7px 10px;
	font-weight: bold;
	color: #ffffff;
	background: #731070;
	text-align: center;
  }
  .questionSubject{
    display: inline-block;
    position:absolute;
    width:1093px;
    overflow:hidden;
    text-overflow:ellipsis;
    word-spacing:nowrap;
    box-sizing:border-box;
    padding:7px 3px;
    margin-left:1px;
	font-weight: bold;
	color: #ffffff;
	background: #731070;
  }
  .answerA{
    display: inline-block;
    padding:7px 10px;
	font-weight: bold;
	color: #ffffff;
	background: #442e58;
	text-align: center;
  }
  .answerSubject{
    display: inline-block;
    position:absolute;
     width:1093px;
    overflow:hidden;
    text-overflow:ellipsis;
    word-spacing:nowrap;
    box-sizing:border-box;
    padding:7px 3px;
    margin-left:1px;
	font-weight: bold;
	color: #ffffff;
	background: #442e58;
  }
</style>



<table style="width: 100%; margin: 50px auto 0px; border-spacing: 0px; border-collapse: collapse;">


	<tr height="35">
	    <td colspan="2">
	        <span class="questionQ">Q</span><span class="questionSubject">[${dto.cateName}] ${dto.subject}</span>
	    </td>
	</tr>
	
	<tr height="35" style="border-bottom: 1px solid #cccccc;">
	    <td width="50%" align="left" style="padding-left: 5px;">
	         작성자 : ${dto.userName}
	     <c:if test="${sessionScope.member.userId=='admin'}">(${dto.userId})</c:if>
	    </td>
	    <td width="50%" align="left" style="padding-right: 5px;">
	        문의일자 : ${dto.created}
	    </td>
	</tr>
	

	<tr>
	  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="90">
	      ${dto.content}
	   </td>
	</tr>


<c:if test="${dto.type==1}">
	<tr height="35">
	    <td colspan="2">
	       <span class="answerA">A</span><span class="answerSubject">[RE] ${dto.subject}</span>
	    </td>
	</tr>
	<tr height="35" style="border-bottom: 1px solid #cccccc;">
	    <td width="50%" align="left" style="padding-left: 5px;">
	         담당자 : ${adto.userId}
	    </td>
	    <td width="50%" align="left" style="padding-right: 5px;">
	        답변일자 : ${adto.created}
	    </td>
	</tr>
	
	<tr style="border-bottom: 1px solid #cccccc;">
	  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="90">
	      <div style="min-height: 75px; ">${adto.content}</div>
	      <c:if test="${sessionScope.member.userId=='admin'}">
	         <div style="margin-top: 5px; margin-bottom: 5px; text-align: right;">
                  <a href="javascript:deleteBoard('${dto.code}', '${pageNo}')">답변삭제</a>
	         </div>
	      </c:if>
	   </td>
	</tr>
</c:if>

<tr height="45" style="border-top: 1px solid #cccccc;">
    <td align="left">
       
	</td>
	<td align="right">
	   <button type="button" class="btn" onclick="listPage('${pageNo}')">리스트</button>
	</td>
</tr>
</table>

<c:if test="${sessionScope.member.userId=='admin'}">
<form name="boardForm" method="post" enctype="multipart/form-data">
<table style='width: 100%; margin: 15px auto 0px; border-spacing: 0px;'>
    <tr height='30'> 
        <td align='left'>
            <span style='font-weight: bold;' >답변 달기 - </span><span> 문의에 대한 답변을 입력 하세요</span>
        </td>
    </tr>
    <tr>
        <td style='padding:5px 5px 0px;'>
            <textarea name='content' class='boxTA' style='width:99%; height: 70px;'></textarea>
        </td>
    </tr>
    <tr>
        <td align='right'>
            <button type='button' class='btn' style='padding:10px 20px;' onclick="sendOk('reply', '${pageNo}');">답변 등록</button>
        </td>
    </tr>
</table>
    <input type="hidden" name="subject" value="${dto.subject}">
    <input type="hidden" name="cateName" value="${dto.cateName}">
    <input type="hidden" name="parent" value="${dto.code}">
</form>
</c:if>