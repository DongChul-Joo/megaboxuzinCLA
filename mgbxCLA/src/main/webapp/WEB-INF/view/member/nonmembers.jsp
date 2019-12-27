<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
function nonmemberOk() {
	var f = document.nonmamberForm;
	var str;
	
	str = f.userName.value;
	str = str.trim();
	if(!str) {
		alert("이름을 입력하세요.");
		f.userName.focus();
		return;
	}
	f.userName.value = str;
	
	f.action = "<%=cp%>/member/nonmembers";
	f.submit();
	
}
</script>

<style>
.nomemberR {
font-size: 30px;
text-align: left;
width: 420px;
padding-top: 90px;
padding-bottom: 70px;

}

.easy-nonmember {
list-style: none;
width: 420px;

}

.notice{
list-style: none;

}

.reservation{
display: flex;
}

.reservationput{
padding-right: 50px;
width: 150px;
font-size: 16px;
margin-top: 5px;
}

.reservationput1{
width: 200px;
height: 28px;

}

.btn btn-outline-primary1{
padding-top: 20px;

}

.btn_wrap{
margin-top: 29px;
margin-bottom: 34px;
text-align: right;
}


</style>

<div class="body-container">
	<div class="nomemberR">비회원 예매확인/취소</div>
	
	
	<form name="nonmamberForm" method="post">
	<div style="border-top: 1px solid #e8e7e7; border-bottom: 1px solid #e8e7e7;">
	<div style="width: 420px; margin: 0 auto; padding-top: 40px; padding-bottom: 40px;">
	
		<ul class="easy-nonmember">
			<li class="reservation">
				<label class="reservationput">이름</label>
				<div>
					<input class="reservationput1" type="text" name="userName" id="userName">
				</div>
			</li>
		</ul>
		
		<ul class="easy-nonmember">
			<li class="reservation">
				<label class="reservationput">생년월일</label>
				<div>
					<input class="reservationput1" type="text" name="birth" id="birth">
				</div>
			</li>
		</ul>
		
		<ul class="easy-nonmember">
			<li class="reservation">
				<label class="reservationput">휴대폰번호</label>
				<div>
					<input class="reservationput1" type="text" name="tel" id="tel">					
				</div>
			</li>
		</ul>
		
		<ul class="easy-nonmember">
			<li class="reservation">
				<label class="reservationput">이메일</label>
				<div>
					<input class="reservationput1" type="text" name="email" id="email">
				</div>
			</li>
		</ul>
		
		</div>

	</div>
	
	<div class="btn_wrap">
		<button class="btn btn-outline-primary1" type="reset">취소</button>
		<button class="btn btn-outline-primary1" type="button" onclick="nonmemberOk();">확인</button>
	</div>
	
	</form>
	
	<ul class="notice">
		<li> > 비회원 예매 확인/취소 서비스는 비회원 예매 시 입력하셨던 개인정보를 동일하게 입력하셔야 이용 가능합니다.
		</li>
		<li> > 비회원 로그인 시 비회원 예매 확인/취소 메뉴만 이용 가능합니다.</li>
		<li> > 이외의 서비스는 회원 가입 후 이용 가능합니다.</li>
	</ul>
	
	
</div>
