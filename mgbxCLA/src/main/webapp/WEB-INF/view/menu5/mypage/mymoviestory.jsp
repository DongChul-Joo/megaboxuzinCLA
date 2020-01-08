<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style>

.nomemberR {
font-size: 30px;
text-align: left;
padding-top: 90px;
padding-bottom: 30px;

}
</style>

<div class="body-container">
	<div class="nomemberR">나의 무비 스토리</div>

	<div>
		<div>
				
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">		
				<c:forEach var="dto" items="${list}">
				<tr align="center" bgcolor="#ffffff" height="200" style="border-top: 1px solid #731070; border-bottom: 1px solid #731070;">
					<td width="30">
					<img src="${dto.thumbNail}" width="120px;">
					</td>
				      					
						<td width="250">
						<p style="font-size: 23px; color: #731070; font-weight: 600;" >${dto.movienm}</p>
						<p>${dto.showingdate}</p>
						<p>${dto.cmName}</p>
						<p>${dto.bookCount}</p>
					</td>
				</tr>	
				</c:forEach>	
  		  			
			</table>
			
			</div>
		</div>
			
	</div>