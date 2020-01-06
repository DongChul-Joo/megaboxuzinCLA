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

ul li {
float: left;
}

</style>



<div class="body-container">
	<div class="nomemberR">${dto.userName}예매내역</div>
	
	<div>
		<div>
				
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">		
				<tr align="center" bgcolor="#f8f8f8" height="50" style="border-top: 2px solid #731070; border-bottom: 1px solid #cccccc;">
					<td width="35">NO</td>
					<td width="70">예매번호</td>
					<td width="70">영화명</td>
					<td width="70">영화관</td>
					<td width="70">상영일시</td>
					<td width="70">예매일</td>
				</tr>		
				
				
				
				<c:forEach var="dto" items="${list}">
				  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
				      <td></td>
				      <td>${dto.bookCode}</td>
				      <td>${dto.movienm}</td>				      
				      <td>${dto.cmName}</td>
				      <td>${dto.showingdate}</td>
				      <td>${dto.bookdate}</td>			     
				  </tr>
		  		</c:forEach>
		  		  			
			</table>
			
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			   <tr height="35">
				<td align="center">
				     
				 </td>
			   </tr>
			</table>
			
			
			<div class="container">
	           <ul class="nav nav-tabs" role="tablist" style="list-style: none; padding-top: 300px;">
			       <li class="active">
			       <a class="nav-link active" data-toggle="tab" href="#home">예매 및 결제</a></li>
			       <li class="nav-item">
			       <a class="nav-link" data-toggle="tab" href="#menu1">티켓 교환방법</a></li>
			       <li class="nav-item">
			       <a class="nav-link" data-toggle="tab" href="#menu2">취소 및 환불규정</a></li>
			   </ul>
			   
			   <div class="tab-content">
			   	<div id="home" class="container tab-pane active">
			   		<h5>>관람 등급을 반드시 확인해주시기 바랍니다.</h5>
			   		<h5>>만 4세(48개월) 이상부터는 영화티켓을 반드시 구매하셔야 입장 가능합니다.</h5>
			   		<h5>>만 4세(48개월) 이상부터는 영화티켓을 반드시 구매하셔야 입장 가능합니다.</h5>
			   		<h5>>홈페이지 예매 현황이 매진인 경우에도 영화관 현장에 잔여석이 남아있는 경우, 현장에서 구매 가능합니다.</h5>
			   		<h5>>할인 카드로 결제 시, 할인 내역은 청구서에서 확인 가능합니다.</h5>
			   		<h5>>예매 변경은 불가능하며, 취소 후 재 예매를 하셔야만 합니다.</h5>
			   		<h5>>영수증은 상영일 기준 약 3개월까지 '나의 메가박스'에서 출력하실 수 있습니다. 단, 신용카드로 예매하신 경우만 한합니다.</h5>
			   		<h5>>상영시간 이후 관람하신 영화의 영수증 출력을 원하실 경우, 관람하신 영화관에서 출력 가능합니다.</h5>
					<h5>>취소하신 내역이 나타나지 않거나 궁금하신 사항이 있으시면, 고객센터 > 1:1문의 또는 ARS(1544-0000 09:00~21:00)로 문의해 주시기 바랍니다.</h5>

			   	
			   	</div>
			   	
			   	<div id="menu1" class="container tab-pane">
			   	<h5>>무인 발매기(키오스크)에서 발권하실 경우 예매번호를 입력하시면 티켓을 편하게 발권하실 수 있습니다.</h5>
			   	<h5>>매표소에서 발권하실 경우 티켓교환권을 출력하여 매표소에 방문하시면 티켓으로 교환하실 수 있습니다.</h5>
			   	<h5>(티켓교환권 출력이 어려운 경우, 예매번호와 신분증을 지참하시면 매표소에서 티켓을 수령하실 수 있습니다.)</h5>
			   		
				</div>
			   	
			   	<div id="menu2" class="container tab-pane">
			   	<h5>>현장 취소를 하는 경우 상영시간 이전까지만 가능하며, 상영시간 이후 취소나 환불은 되지 않습니다.</h5>
			   	<h5>>홈페이지 또는 모바일에서 예매한 내역을 취소 할 경우 부분 취소는 불가능합니다.</h5>
			   	<h5>>온라인(홈페이지/모바일) 예매 취소는 상영시간 20분전까지 입니다.</h5>
				<h5>>위탁 예매 사이트 이용 시 취소 및 환불 규정은 해당 사이트 규정을 따릅니다.</h5>
				<h5>>LIVE 공연 콘텐트는 취소 기준은 아래와 같습니다.</h5>
				<p>
				- 관람 4일전 : 취소 가능
				- 관람 3일 ~ 1일전 : 취소 수수료 부담 후 취소 가능
				- 관람 당일 : 취소 및 환불 불가</p>
				<h5>>공연 관람시 시작 시간 이후에는 입장이 제한 됩니다.</h5>
				<h5>>발권된 티켓은 상영시간 전까지 현장 방문 시에만 취소가 가능합니다.</h5>
		   	
			   	</div>
			   
			   </div>
			   
		   </div>
			
		</div>
	</div>
</div>