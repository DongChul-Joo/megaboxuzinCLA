<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<style>
.ui-state-active {
	background: #731070;
	border: 1px solid #660058;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {
	$( "#accordion" ).accordion({
		collapsible: true,
		 heightStyle: "menual_contents"
	});
});
</script>
</head>
<body class="tabs">

<div class="body-container" style="margin-top: 50px; padding-left: 0;">
	<h4 class="header" style="border-top: 2px solid #731070; background-color: #f8f8f8; height: 42px;">
		<span class="hd1" style="display: inline-block;padding-left: 20px;padding-right: 13px;padding-top: 10px;">분류</span> | 
		<span class="hd2" style="width:;padding-left: 13px;padding-top: 0px;">질문</span>
	</h4>
	<div id="accordion">
	
	<div class="menual">
		<span class="hd1">멤버십</span> |
		<span class="hd2">포인트 적립을 못 받았어요. 어떻게 해야하나요?</span>
	</div>	
			<div id="menual_contents">
				<p>
				멤버십 포인트 적립은 상영시간 전까지만 가능하며,<br>
				상영시간이 지난 티켓에 대해서는 사후 적립이 불가합니다.
				</p>
			</div>
	<div class="menual">
		<span class="hd1">멤버십</span> |
		<span class="hd2">개명을 하였는데 어떻게 바꾸어야 하나요?</span>
	</div>	
			<div id="menual_contents">
				<p>
				문의 주신 개명의 경우<br>
				메가박수진 홈페이지를 통해 직접 가능하심을 안내드리오며,<br>
				<br>
				홈페이지 회원 로그인 > 나의 메가박스 > 개인정보 수정 > 이름변경<br>
				페이지를 통해<br>
				아이핀 또는 휴대폰 인증을 통해 본인 확인 절차 진행후<br>
				수정 가능함을 전해드립니다.<br>
				<br>
				추가 문의시,<br>
				대표번호 1544-0070 (운영시간 09:00-21:00)으로 연락 주시기 바랍니다.
				</p>
			</div>	
	<div class="menual">
		<span class="hd1">멤버십</span> |
		<span class="hd2">멤버십 카드를 분실했어요. 재발급은 어떻게 하나요?</span>
	</div>	
			<div id="menual_contents">
				<p>
				1. 일반 멤버십 카드 재발급<br>
				- 현장 매표소를 통해 등록되지 않은 공카드 수령 후 홈페이지 회원 로그인 후 직접 등록<br>
				<br>
				2. 멤버십 제휴 신용카드 또는 체크카드 재발급<br>
				- 카드를 발급 받으신 카드사 고객센터를 통해 카드분실신고 및 재발급 신청을 해주시길 바랍니다.<br>
				<br>
				※ 재발급 시 기존의 포인트는 데이터상으로 남아있어 사용이 가능하며,<br>
				현장에서 카드없이 적립 시에는 회원정보[생년월일+전화번호4자리] 또는 [휴대폰번호]로<br>
				적립이 가능합니다.
				</p>
			</div>
	<div class="menual">
		<span class="hd1">영화예매</span> |
		<span class="hd2">영화 관람권으로 예매하는 방법</span>
	</div>	
			<div id="menual_contents">
				<p>
				영화 관람권 이용 방법은 홈페이지, 어플, 웹 로그인 후 결제 마지막 단계에서<br>
				<br>
				[영화관람권/VIP쿠폰] - [쿠폰번호 및 인증번호 입력] - <br>
				[관람권 등록] - [사용] - <br>
				[적용] - [결제]<br>
				<br>
				차례로 선택하시면 예매가 완료되며, 예매 번호 확인이 가능합니다.<br>
				완료된 예매 내역은 [예매확인/취소]에서도 확인 가능합니다
				</p>
			</div>
	<div class="menual">
		<span class="hd1">영화예매</span> |
		<span class="hd2">ARS, 인터넷 예매 시 취소는 어떻게 하나요?</span>
	</div>	
			<div id="menual_contents">
				<p>
				1) ARS 예매 취소<br>
				- 상영시간 20분전까지 1544-0070 (운영시간 : 09:00~ 21:00)으로 연결 후 취소 진행 가능합니다.<br>
				<br>
				2)온라인 예매 취소<br>
				- 상영시간 20분 전까지 홈페이지, 어플, 웹을 통해 취소 가능합니다.<br>
  				  단, 상영시간 20분 미만으로 남았을 경우 현장 매표소를 통해 상영시간 전까지 취소 가능합니다.<br>
				<br>
				- 온라인 예매 후 현장에서 지류 티켓으로 출력을 선 진행한 경우에는 온라인 취소가 불가능하며,<br>
 				  현장 매표소를 통해 상영 시간 전까지 취소 가능합니다.<br>
 				  <br>
 				  ※ 현장이 혼잡할 수 있으니 20분전까지 방문하시어 환불 요청 부탁드립니다.
				</p>
			</div>
	<div class="menual">
		<span class="hd1">영화예매</span> |
		<span class="hd2">예매를 한 뒤, 시간대나 좌석변경이 가능한가요?</span>
	</div>	
			<div id="menual_contents">
				<p>
				예매내역 변경은 예매취소나 환불 후 재 결제하는 방식으로 가능합니다.<br>
				인터넷 상으로는 [예매확인 및 취소]에서 상영시간 20분전까 취소가 가능하며,<br>
				상영시작 20분 전까지 재 예매가 가능합니다.<br>
				현장에서는 영화의 상영시간 전까지 매표소에서 전체 환불 후 원하시는 시간이나 좌석으로<br>
				재 결제를 하셔야 합니다.<br>
 				<br>
				단,<br>
				메가박스 관람권 및 제휴 예매권을 이용하셨을 경우,<br>
				예매 환불 전 해당 관람권 및 예매권의 유효기간 확인 부탁드립니다.<br>
				</p>
			</div>
	<div class="menual">
		<span class="hd1">할인/신용카드</span> |
		<span class="hd2">통신사 할인과 문화상품권을 동시에 적용할 수 있나요?</span>
	</div>	
			<div id="menual_contents">
				<p>
				현장에서 티켓 구매시 지류 상품권에 한해 이용이 가능하며,<br>
				통신사 할인과 동시에 적용 가능합니다.<br>
				<br>
				단,<br>
				모바일 상품권 및 경품용 상품권은 이용이 불가하며,<br>
				이용하시는 지류 상품권 후면에 기재된 일정 %이상 이용시에만<br>
				잔액을 돌려받을 수 있습니다.
				</p>
			</div>
	<div class="menual">
		<span class="hd1">할인/신용카드</span> |
		<span class="hd2">본인 명의의 이동통신사 카드 중복 할인이 가능한가요?</span>
	</div>	
			<div id="menual_contents">
				<p>
				본인 명의의 이동통신사 카드를 복수로 소지하고 계실 경우라도( EX/ SKT, LGT)<br>
				티켓 1장 구매시에는 1개의 통신사 할인 적용만 가능합니다.<br>
				<br>
				즉, 티켓 1매를 구매하는데 있어, 2개 혹은 3개 이상의 통신사 멤버십 카드 할인은<br>
				중복적용이 되지 않습니다.<br>
				<br>
				단, 이동통신사 카드 할인/신용카드 할인/포인트 카드(GS칼텍스, OK캐쉬백)의<br>
				카드의 종류가 다를 경우에는 중복 할인이 가능합니다.<br>
				<br>
				※ SKT, 현대M포인트, 해피포인트의 경우 중복할인 불가 
				</p>
			</div>
	<div class="menual">
		<span class="hd1">할인/신용카드</span> |
		<span class="hd2">체크 카드로 예매 했는데 취소할 경우 환불은 언제쯤 되나요?</span>
	</div>	
			<div id="menual_contents">
				<p>
				온라인 결제건의 경우 즉시 취소 가능되며,  현장 결제건의 결제일에 따라 상영일 전 취소를 진행하였더라도,<br>
				결제일이 상이할 경우 상영일 이후 취소가 진행되어 약 4~7일 소요될 수 있습니다.<br>
				<br>
				EX) 현장에서 결제한 내역의 경우<br>
				12월 24일에 31일 영화예매 후에 28일에 취소하셨더라도<br>
				31일에 매입 후 취소 1월 1일에 취소가 정상적으로 들어가며 1월 1일 기준으로<br>
				신용카드/체크카드  4~7일소요됩니다.
				</p>
			</div>
	<div class="menual">
		<span class="hd1">할인/신용카드</span> |
		<span class="hd2">OK캐쉬백 적립 및 사용 방법에 대해 알고 싶어요.</span>
	</div>	
			<div id="menual_contents">
				<p>
				◎ 적립<br>
				결제액의 2%를 OK캐쉬백 포인트로 적립가능<br>
				 ※  메가박스 홈페이지, 어플, 웹 및 현장 매표소에서 구매한 내역에 한해 적립가능<br>
				     SKT 더블더블 할인/관람권/할인권/쿠폰사용 내역 적립 불가합니다.<br>
				<br>
				◎ 사용<br>
				1,000점 이상 보유시 500점(현장) 100점(온라인)단위로 사용가능하며,<br>
				결제 금액의 일부 또는 전체를 OK캐쉬백 포인트로 사용 가능합니다.<br>
				단, 해당 포인트가 차감됩니다.<br>
				<br>
				※ 사용 시 비밀번호는 상이합니다.<br>
				 (현장 숫자 4자리 / 온라인상 10자리~12자리)<br>
				 자세한 사항은 오케이 캐쉬백 홈페이지 참조 부탁드립니다.
				</p>
			</div>																
	</div>
</div>

</body>
</html>