<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<div style="border: 1px solid black;width: 1000px;height: 500px; border-collapse: collapse; border-spacing: 0;"> 
		<div style="width: 50%; height: 100%; background-color: white;  float: left;">		
			<div style="margin: 0 auto; width: 92%;">
				<div style="color: #503396; font-weight: 800; font-size: 30px;">
				<p style="width: 50%;">예매결제 </p>
				</div>
				
				
				<div id="accordion">
						<div class="menual">step1
							<div style="width: 50px;">쿠폰</div>
							<input name="coupon" readonly="readonly"><button>등록</button>
						</div>
				
						<div id="menu_payment">
								<p>
								멤버십 포인트 적립은 상영시간 전까지만 가능하며,<br>
								상영시간이 지난 티켓에 대해서는 사후 적립이 불가합니다.
								</p>
						</div>
				
						<div class="menual">step2
							<div>관람권/기프티콘</div>
							<input name="disCount" readonly="readonly"><button>등록</button>
						</div>
				
						<div id="menu_payment">
							<p>
							멤버십 포인트 적립은 상영시간 전까지만 가능하며,<br>
							상영시간이 지난 티켓에 대해서는 사후 적립이 불가합니다.
							</p>
						</div>
				
						<div class="menual">step3
							<div>마일리지 및 기타 결제</div>
							<input name="mailige" readonly="readonly"><button>등록</button>
						</div>
						
						<div id="menu_payment">
							<p>
							멤버십 포인트 적립은 상영시간 전까지만 가능하며,<br>
							상영시간이 지난 티켓에 대해서는 사후 적립이 불가합니다.
							</p>
						</div>
						
					
				</div>	
				
						
				

				
				
				
			</div>

 
			</div>
		
		
		<div style="width: 20%; height: 100%; background-color: white ; float: left;">
				<div class="paymentAmount">총 결제금액
					<div style="width: 85%; padding-top: 10px;" >
					<div class="paymentA" style="width: 100%; float: left; text-align: right;">원</div>
					</div>
				</div>
				<div class="paymentAmount">할인수단/관람권
					<div style="width: 85%; padding-top: 10px;" >
					<div class="paymentA" style="width: 20%; float: left; text-align:right;">-</div>
					<div class="paymentA" style="width: 80%; float: left;">원</div>
					</div>
				</div>
				<div class="paymentAmount">일반결제
				    <div style="width: 85%; padding-top: 10px;" >
					<div class="paymentA" style="width: 20%; float: left;text-align:right;">-</div>
					<div class="paymentA" style="width: 80%; float: left;">원</div>
					</div>
				</div>
				<div class="paymentAmount">남은 결제금액
				    <div style="width: 85%; padding-top: 10px;" >
					<div class="paymentA" style="width: 100%; float: left; text-align: right;">원</div>			
					</div>
				</div>
				
				<div class="paymentAmount">
				<p>예매정보 추가발송</p>
				    <div style="width: 95%;" >
				    	<input style="width: 27%; border: 1px solid black; height: 20px;">-
				    	<input style="width: 27%; border: 1px solid black; height: 20px;">-
				    	<input style="width: 27%; border: 1px solid black; height: 20px;">
					</div>
				</div>
		</div>
	
		
		<div class="bookingMovieInfo" style="width: 30%; height: 100%; background-color: #404040; float: left;">
			<div style="width: 100%;height: 70%; color: white;font-size: 15px;">
				
				<div style="width: 100%; height: 70%; background-color: #e4e4e4;">
					 
				</div>
				
				<div style="margin: 0 auto; width: 90%; padding-top: 5px;">
					<p style="margin-top: 10px;">▷연령 제한 : ${dto.audits}</p>
					<p style="margin-top: 10px;">▷제목 : ${dto.movieNm}</p>
					<p style="margin-top: 10px;">▷상영관 :<br>${dto.branName}<br>${dto.cmName}</p>
				</div>
				
				<div class="totMoney" style="width: 90%;height: 13%;font-weight: bold;font-size: 20px;color:white;text-align: right;">0원
				</div>
				
				<div style="margin-left: auto; margin-right:auto; display: table;">
					<button class="seatBtns" style="background: purple;color: white; width: 100px; height: 52px; border: purple;" type="button" onclick="buyTiket();">결제</button>
					<button class="seatBtns" onclick="closedSeat();" style="margin-left:5px;background: white; border: white; width: 100px; height: 50px;" type="button">취소</button>
					<input name="scheduleCode" type="hidden" value="${dto.scheduleCode}">
				</div>
				
			</div>
		</div>	
		
</div>