<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>


<style>

.nomemberR {
font-size: 30px;
text-align: left;
padding-top: 90px;

}

.ro1 {
margin: 30px 30px auto;
list-style: none;
font-size: 20px;
}

.row1 {
padding-right: 200px;
}


.row2 {
padding-right: 165px;
}


.row3 {
padding-right: 206px;
}



</style>

<div class="body-container" style="min-height: 220px;">
	<div class="nomemberR">멤버십정보</div>

			<div>
			<h3 style="float: right;">${dto1.userName}님은 ${dto1.membershipName}회원입니다.</h3>
			</div>
		
		<div>
			
				<div style="margin-top: 56px; width: 100%; border-top: 2px solid #731070;">				
					
					
					<div style="width: 40%; background-color: #f7f4f4; height: 400px; float: left;">
					
						<h2 style="margin: 75px 30px auto;">포인트 현황</h2>
						<ul style="padding-top: 20px;">
							<li class="ro1">
							<strong class="row1">현재 보유 포인트</strong>
							<strong>${dto.mileage}P</strong>
							</li>
							<li class="ro1">
							<strong class="row2">티켓구매 누적 포인트</strong>
							<strong>0P</strong>
							</li>
							<li class="ro1">
							<strong class="row3">소멸예정 포인트</strong>
							<strong>0P</strong>
							</li>						
						</ul>						
					</div>	
					
					
					
					<div style="width: 60%; height: 400px; float: left;">
						<h2 style="margin: 50px 30px auto; margin-bottom: 10px;">포인트 내역 조회</h2>		
	<div>
		<div>
			<table style="width: 95%; margin: 10px auto; border-spacing: 0px; border-collapse: collapse;">	
				
				<tr align="center" bgcolor="#f8f8f8" height="40" style="border-top: 2px solid #731070; border-bottom: 1px solid #cccccc;">
					<td width="35">일자</td>
					<td width="70">적립포인트</td>
					<td width="70">사용포인트</td>
				</tr>		
				
				
				
				<c:forEach var="dto" items="${list}">
				  <tr align="center" bgcolor="#ffffff" height="50" style="border-bottom: 1px solid #cccccc;"> 
				      <td>${dto.msaveDate}</td>
				      <td>${dto.mileage}</td>
				      <td></td>
				  </tr>
		  		</c:forEach>
		  		  			
			</table>
			
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="80">
			<td align="center">
			       ${dataCount==0?"적립 포인트가 없습니다.":paging}
			 </td>
		   </tr>
		</table>
			
			</div>
		</div>		
		
		
					</div>		
					
					
				</div>
				
				
	

		</div>
		
	</div>
	
			
			
			

