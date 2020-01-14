<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<div style="width: 100%;height: 100%">
	<div><p>예매 결제</p></div>
	<div>
		<div>
			<div>쿠폰</div><input name="coupon" readonly="readonly"><button>검색</button>
			<div>관람권/기프티콘</div><input name="disCount" readonly="readonly"><button>검색</button>
			<div>마일리지 및 기타 결제</div><input name="mailige">
		</div> 
		
		
		<div class="bookingMovieInfo" style="width: 100%;height: 50%;background-color: #404040">
			<div style="width: 100%;height: 70%;padding-top: 10px;padding-left: 20px;color: white;font-size: 15px;">
				<p style="margin-top: 10px;">▷연령 제한 : ${dto.audits}</p>
				<p style="margin-top: 10px;">▷제목 : ${dto.movieNm}</p>
				<p style="margin-top: 10px;">▷상영관 :<br>${dto.branName}<br>${dto.cmName}</p>
			</div>
			<div class="totMoney" style="width: 100%;height: 15%;font-weight: bold;font-size: 20px;color:white;text-align: right;padding-right: 10px;">0원</div>
				<button class="seatBtns" style="margin-left:40px;;background: purple;color: white;" type="button" onclick="buyTiket();">결제</button><button class="seatBtns" onclick="closedSeat();" style="margin-left:5px;background: white;" type="button">취소</button>
				<input name="scheduleCode" type="hidden" value="${dto.scheduleCode}">
		</div>
	</div>
	<div></div>
</div>