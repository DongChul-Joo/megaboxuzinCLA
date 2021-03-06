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


<script type="text/javascript">
function reservationCancel(bookCode) {
	
	if(confirm("예매를 취소 하시겠습니까?")==true){
		if(confirm("정말로 예매를 취소 하시겠습니까?")==true){
			var query="bookCode="+bookCode;
			$.ajax({
			      type:"get"
			      ,url:"<%=cp%>/mypage/bookingCancel"
			      ,data:query
			      ,dataType:"json"
			      ,success:function(data) {
			         console.log(data);
			      }
			   });
		}
	}
	
}

</script>

<div class="body-container">
	<div class="nomemberR">예매 확인/취소</div>
	
	

	<div>
		<div>
				
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">		
				<tr align="center" bgcolor="#f8f8f8" height="50" style="border-top: 2px solid #731070; border-bottom: 1px solid #cccccc;">
					<td width="35">NO</td>
					<td width="70">예매번호</td>
					<td width="70">영화명</td>
					<td width="70">영화관</td>
					<td width="70">상영일시</td>
					<td width="70">상영시간</td>
					<td width="70">예매일</td>
					<td width="70">좌석번호</td>
					<td width="70">취소</td>
				</tr>		
				
				
				<c:forEach var="dto" items="${list}">
				  <tr align="center" bgcolor="#ffffff" height="50" style="border-bottom: 1px solid #cccccc;"> 
				      <td>${dto.listNum}</td>
				      <td>${dto.bookCode}</td>
				      <td>${dto.movienm}</td>
				      <td>${dto.cmName}</td>
				      <td>${dto.showingdate}</td>
				      <td>${dto.startTime}</td>
				      <td>${dto.bookdate}</td>
				      <td>${dto.seatNumber}</td>
				      <td>${dto.cancelInfo==2?"취소불가":(dto.cancelInfo==1?"취소완료":"")}
				     <c:if test="${dto.cancelInfo==0}">
				      <button type="button" class="btn" onclick="reservationCancel('${dto.bookCode}');">취소</button>
				     </c:if>
				      </td>
				  </tr>
		  		</c:forEach>		  		  			
			</table>
			
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="80">
			<td align="center">
			       ${dataCount==0?"예매를 해주세요.":paging}
			 </td>
		   </tr>
		</table>
			
			</div>
		</div>
			
	</div>