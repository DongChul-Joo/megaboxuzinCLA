<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>

.body-top {
 height: 300px;
}


.cancle {
border: 1px solid #e4e4e4;
width: 830px;
height: 40px;
text-align: center;
}

</style>

<div class="body-content-container">
     <div class="body-title">
     		<h3>나의 예매내역</h3>
         	<h6>지난 1개월까지의 예매내역을 확인하실 수 있으며, 영수증은 신용카드 결제 내역만 출력 가능합니다.</h6>

     </div>
     
     <div class="body-top">   		
         	<h6>현장에서 발권하실 경우 꼭 예매번호를 확인하세요.
			티켓판매기에서 예매번호를 입력하면 티켓을 발급받을 수 있습니다.
			고객님의 최근 예매내역이 존재하지 않습니다.</h6>
     	
     	</div>
     
     <div class="body-title2">
     		<h3>My 취소내역</h3><h6>상영일 기준 지난 7일 동안의 취소내역입니다.</h6>

     </div>
     <div>
     		<table class="cancle">
				<tr>
					<td>관람영화</td>
					<td>관람 일시</td>
					<td>취소일</td>
					<td>결제 취소 금액</td>
				</tr>	
					
			</table>
	</div>
</div>
