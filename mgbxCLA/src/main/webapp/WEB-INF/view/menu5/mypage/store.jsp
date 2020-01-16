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
	<div class="nomemberR">스토어 구매내역</div>

	<div>
		<div>
				
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">		
				<tr align="center" bgcolor="#f8f8f8" height="50" style="border-top: 2px solid #731070; border-bottom: 1px solid #cccccc;">
					<td width="35">구분</td>
					<td width="70">구매일</td>
					<td width="70">상품명</td>
					<td width="70">구매수량</td>
					<td width="70">결제내역</td>
				</tr>		
				
				
				
				<c:forEach var="dto" items="${list}">
				  <tr align="center" bgcolor="#ffffff" height="50" style="border-bottom: 1px solid #cccccc;"> 
				      <td>${dto.itemPart}</td>
				      <td>${dto.buyDate}</td>
				      <td>${dto.itemName} , <img src="${dto.itemImg}" width="120px;"></td>
				      <td>${dto.buyAmount}</td>
				      <td>${dto.pdSudan}</td>
				  </tr>
		  		</c:forEach>
		  		  			
			</table>
			
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="80">
			<td align="center">
			       ${dataCount==0?"등록된 게시물이 없습니다.":paging}
			 </td>
		   </tr>
		</table>
			
			</div>
		</div>
			
	</div>