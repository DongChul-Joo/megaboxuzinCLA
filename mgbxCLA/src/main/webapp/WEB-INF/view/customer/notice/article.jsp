<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

    <div>
			<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="center">
				   ${dto.subject}
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td width="50%" align="left" style="padding-left: 5px;">
			       아이디 : ${dto.userId}
			    </td>
			    <td width="50%" align="right" style="padding-right: 5px;">
			        ${dto.created}
			    </td>
			</tr>
			
			<tr style="border-bottom: 1px solid #cccccc;">
			  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
			      ${dto.content}
			   </td>
			</tr>
			
			<c:forEach var="vo" items="${listFile}">
				<tr height="35" style="border-bottom: 1px solid #cccccc;">
				    <td colspan="2" align="left" style="padding-left: 5px;">
				      <a href="<%=cp%>/customer/notice/download?fileNum=${vo.fileNum}">${vo.originalFilename}</a>
			          <%-- (<fmt:formatNumber value="${vo.fileSize/1024}" pattern="0.00"/> KByte) --%>
				    </td>
				</tr>
			</c:forEach>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       이전글 :
			         <c:if test="${not empty preReadDto}">
			              <a href="javascript:articleBoard('${preReadDto.code}', '${pageNo}');">${preReadDto.subject}</a>
			        </c:if>
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       다음글 :
			         <c:if test="${not empty nextReadDto}">
			              <a href="javascript:articleBoard('${nextReadDto.code}', '${pageNo}');">${nextReadDto.subject}</a>
			        </c:if>
			    </td>
			</tr>
			</table>
			
			<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
			    <td width="300" align="left">
			     
		          <button type="button" class="btn" onclick="updateForm('${dto.code}', '${pageNo}');">수정</button>
		          
		          <button type="button" class="btn" onclick="deleteBoard('${dto.code}', '${pageNo}');">삭제</button>
			    </td>
			
			    <td align="right">
			    	<button type="button" class="btn" onclick="listPage('${pageNo}')">리스트</button>
			    </td>
			</tr>
			</table>
    </div>
