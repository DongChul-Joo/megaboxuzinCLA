<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
	<div style="float: left;width: 80%;height: 100%">
		<div style="width: 100%; height: 75%; background-color: white;">		
			<div style="margin: 0 auto; width: 92%;">
				<div style="color: #503396; font-weight: 800; font-size: 30px;">
				<p style="width: 50%;">예매결제 </p>
				</div>
				
				
				<div id="accordion">
						<div class="menuals" >step1
							<div style="width: 50px;">쿠폰 (0)</div>
						</div>
				
						<div id="menu_payment" style="width: 96%">
						<input name="coupon" readonly="readonly"><button>쿠폰 등록</button>
								<p>
								멤버십 포인트 적립은 상영시간 전까지만 가능하며,<br>
								상영시간이 지난 티켓에 대해서는 사후 적립이 불가합니다.
								</p>
						</div>
				
						<div class="menuals"  >step2
							<div>관람권/기프티콘 (0)</div>
	
						</div>
				
						<div id="menu_payment" style="width: 96%">
						<input name="disCount" readonly="readonly"><button>등록</button>
							<p>
							멤버십 포인트 적립은 상영시간 전까지만 가능하며,<br>
							상영시간이 지난 티켓에 대해서는 사후 적립이 불가합니다.
							</p>
						</div>
				
						<div class="menuals" >step3
							<div>마일리지/멤버십</div>
						</div>
						
						<div id="menu_payment" style="width: 96%">
						<span>사용가능 포인트:2600p</span><span>멤버십 할인:0원</span>
						<p>
							멤버십 포인트 적립은 상영시간 전까지만 가능하며,<br>
							상영시간이 지난 티켓에 대해서는 사후 적립이 불가합니다.
						</p>
							
						</div>
						
					
				</div>	
				
						
				

				
				
				
			</div>

 			<div class="membershipData" style="font-size: 20px; text-align: center;padding-top: 50px;font-weight: bold;"></div>
			</div>
		
		
		
		<div style="width: 100%; height: 25%; background-color: white ;">
				<div class="paymentAmount" id="bookingTotPrice">
					<p>총 결제금액</p>
					<div style="width: 85%; padding-top: 10px;" >
					<input type="text" readonly="readonly" class="paymentA" value="" name="totPrice" style="border:none;width: 80%; float: left; text-align: right;"></input>원
					</div>
				</div>
				<div class="paymentAmount" >
					<p>쿠폰/관람권</p>
					<div style="width: 85%; padding-top: 10px;" >
					<div class="paymentA" style="width: 20%; float: left; text-align:right;">-</div>
					<input type="text" readonly="readonly" class="paymentA" value="0" name="discountPrice" style="border:none;width: 60%; float: left;"></input>원
					</div>
		
				</div>
				<div class="paymentAmount" >
					<p>멤버십할인</p>
					<div style="width: 85%; padding-top: 10px;" >
					<div class="paymentA" style="width: 20%; float: left; text-align:right;">-</div>
					<input type="text" readonly="readonly" class="paymentA" value="0" name="discountPrice" style="border:none;width: 60%; float: left;"></input>원
					</div>
		
				</div>
				<div class="paymentAmount" >
					<p>마일리지</p>
				    <div style="width: 85%; padding-top: 10px;" >
				    <div class="paymentA" style="width: 20%; float: left; text-align:right;">-</div>
					<input type="text" readonly="readonly" class="paymentA" value="0" name="delMileage" style="border:none;width: 60%; float: left; text-align: right;"></input>원			
					</div>
				</div>
				
		</div>
	</div>
		
		<div class="bookingMovieInfo" style="width: 20%; height: 100%; background-color: #404040; float: left;display: inline-block;">
			<div style="width: 100%;height: 100%; color: white;font-size: 15px;">
				
				<div style="width: 100%; height: 50%; background-image: url('${dto.thumbNail}');background-size:cover">
					 <c:if test="${dto.thumbNail=='No images'}">
					${dto.thumbNail}
					</c:if>
				</div>
				
				<div class="tiketInfo" style="padding-left: 20px;margin: 0 auto; width: 100%; height:30%; padding-top: 5px;display: inline-block;">
					<p style="margin-top: 10px;">▷연령 제한 : ${dto.audits}</p>
					<p style="margin-top: 10px;">▷제목 : ${dto.movieNm}</p>
					<p style="margin-top: 10px;">▷상영관 :<br>${dto.branName}<br>${dto.cmName}</p>
					<span style="margin-top: 10px;">▷선택좌석 :</span>
					<div id="seatSelectJone" style="width: 100%;height: 25%;display: inline-block;"></div>
				</div>
				
				<div class="realMoney" style="width: 90%;height: 6%;font-weight: bold;font-size: 20px;color:white;text-align: right;">
				</div>
				
				<div style="margin-left: auto; margin-right:auto;height: 8%; display: table;">
					<button class="seatBtns" style="background: purple;color: white; width: 80px; height: 35px; " type="button" onclick="payTiket();">결제</button>
					<button class="seatBtns" onclick="closedPay();" style="color:black;margin-left:5px;background: white;  width: 80px; height: 35px;" type="button">취소</button>
					
				</div>
				
			</div>
		<form name="bookingSubmitForm" method="post">
			<input name="scheduleCode" type="hidden" value="${dto.scheduleCode}">
		</form>
		</div>
		
			
		