<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
$(document).ready(function () {
	var seatList="${bookingSeatList}";
	var seat1=seatList.replace("[","");
	var seat2=seat1.replace("]","");
	if(seat2!=""){
		var seatIds=seat2.split(",");
		for(var i=0;i<seatIds.length;i++){
			$("button[id="+seatIds[i]+"]").css("background","#cccccc").attr("disabled",true);
		}
	}
	
});

</script>
<div class="SeatSelectForm" style="width: 100%;height: 100%;border-bottom: 1px solid #cccccc">
		<div class="ssTitleBar" style="padding-top:13px;;border-bottom:1px solid #cccccc;width: 100%;height:10%;background: #00000008;font-size: 25px;font-weight:1000;color: purple;padding-left: 15px;">인원/좌석선택</div>
		<div class="ssBodyBar" style="width: 100%;height: 90%">
			<div class="ssBodyLeft" style="width: 80%;height: 100%;float: left">
				<div class="peopleJone" style="width: 100%;height: 6%;border-bottom:1px solid #cccccc">
					<div class="peopleSelectjone" style="float:left;width: 60%;height: 100% ;padding-top: 5px;padding-left: 10px;">
					<strong>성인</strong><select data-rainge="성인" data-price="12000">
										<c:forEach var='people' begin="0" end="8">
											<option value="${people}">${people}</option>
										</c:forEach>
									</select>
					<strong>청소년</strong><select data-rainge="청소년" data-price="10000">
										<c:forEach var='people' begin="0" end="8">
											<option value="${people}">${people}</option>
										</c:forEach>
									 </select>
					<strong>우대</strong><select data-rainge="우대" data-price="6000">
										<c:forEach var='people' begin="0" end="8">
											<option value="${people}">${people}</option>
										</c:forEach>
									</select>
					</div>
					<div class="peopleInfoJone" style="float:left;width: 40%;height: 100%;text-align: right;padding-right: 15px;padding-top: 5px;"><p style="margin-top: 2px">인원 선택은 최대 8명까지 가능합니다.</p></div>
				</div>
				<div class="seatMapBody" style="width: 100%;height: 87%;border-bottom:1px solid #cccccc;overflow: scroll;overflow-x:hidden;">
					<div class="seatMapBodyLeft" style="float: left;width: 82%;height: 100%">
						<div class="screenBar" style="width: 100%;height:10%;">
							<p style="width: 80%;height:85%;font-size:27px;margin: 0px auto;margin-top: 10px;background: #cccccc;text-align: center;font-weight: bold;padding-top: 3px;">SCREEN<p>
						</div>
						<div class="seatTableMap" style="width: 100%;height: 90%">
							${dto.cmSeatMap}
						</div>
					</div>
					<div class="seatMapBodyRigthInfo" style="float:left;width: 18%;height: 100%">
						<div style="height: 80%;width: 90%;margin: 0px auto;border: 1px solid #cccccc;margin-top: 30px">
							<div class="infoSeatDiv"><strong style="margin-top:5px; ">좌석 안내</strong></div>
							<div class="infoSeatDiv"><div class="infoSeat" style="background: purple"></div><span>선택좌석</span></div>
							<div class="infoSeatDiv"><div class="infoSeat" style="background:#cccccc"></div><span>예매완료</span></div>
							<div class="infoSeatDiv"><div class="infoSeat" style="background: black"></div><span>선택불가</span></div>
							<div class="infoSeatDiv"><div class="infoSeat" style="background: white"></div><span>일반석</span></div>
						</div>
					</div>
				</div>
				<div class="bodyLeftBottom" style="width: 100%;height: 7%">
					<div style="width: 120px;float: right;margin-right: 100px;height: 100%"><div class="returnImage"></div><div style="font-weight:bold;font-size:20px;margin-top: 7px;"><strong>다시입력</strong></div></div>
				</div>
			</div>
			<div class="ssBodyRigth" style="width: 20%;height: 100%;float: left;border-left: 1px solid #c5c5c5;">
				<div class="bookingMovieThum" style="width: 100%;height: 50%;background-size: cover;background-image: url('${dto.thumbNail}')">
					<c:if test="${dto.thumbNail=='No images'}">
					${dto.thumbNail}
					</c:if>
				</div>
				<div class="bookingMovieInfo" style="width: 100%;height: 50%;background-color: #404040">
					<div style="width: 100%;height: 70%;padding-top: 10px;padding-left: 20px;color: white;font-size: 15px;">
						<p style="margin-top: 10px;">▷연령 제한 : ${dto.audits}</p>
						<p style="margin-top: 10px;">▷제목 : ${dto.movieNm}</p>
						<p style="margin-top: 10px;">▷상영관 :<br>${dto.branName}<br>${dto.cmName}</p>
					</div>
					<div class="totMoney" style="width: 100%;height: 15%;font-weight: bold;font-size: 20px;color:white;text-align: right;padding-right: 10px;">0원</div>
					<button class="seatBtns" style="margin-left:40px;;background: purple;color: white;" type="button" onclick="buyTiket();">예매</button><button class="seatBtns" onclick="closedSeat();" style="margin-left:5px;background: white;" type="button">취소</button>
					<input name="scheduleCode" type="hidden" value="${dto.scheduleCode}">
				</div>
			</div>
		</div>
	</div>
	<div id="bookingLoginForm" style="width:300px;height:200px;display: none;overflow: hidden;">
	</div>
	<div id="bookingTiketingForm" style="display: none;overflow:none;">
		
	</div>