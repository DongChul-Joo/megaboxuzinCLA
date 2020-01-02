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
	<div class="nomemberR">예매 확인/취소</div>
	
	

	<div>
		<div>
				
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">		
				<tr align="center" bgcolor="#f8f8f8" height="50" style="border-top: 2px solid #731070; border-bottom: 1px solid #cccccc;">
					<td width="35">번호</td>
					<td width="70">영화제목</td>
					<td width="70">영화일자</td>
					<td width="70">영화상영관</td>
				</tr>		
				
				
				
				<c:forEach var="dto" items="">
				  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
				      <td></td>
				      <td></td>
				      <td></td>
				      <td></td>
				  </tr>
		  		</c:forEach>
		  		  			
			</table>
			
			</div>
		</div>
			
	</div>