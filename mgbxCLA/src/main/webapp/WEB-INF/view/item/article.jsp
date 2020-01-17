<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style>
.box1 {
	float:left; width:500px; height:100px;
	}
.box2 {
  float:left;  width:400px; height:100px;
}
.count {
	width: 30px; height: 25px;
}
.btn_sub {
	width: 26px; height: 25px;
}
.btn_plus {
	width: 26px; height: 25px;
}
#modal {
  display:none;
  position:relative;
  width:100%;
  height:100%;
  z-index:1;
}

</style>

<script type="text/javascript">
$(function(){
	$(".btn_plus").click(function(){
		var price = $(this).attr("data-price");
		
		var su = $("#itemCount").val();
		if(su=="") {
			su = 1;
		} else {
			su = parseInt(su);
		}
		if(su>=10) {
			alert("계산 범위를 벗어났습니다.");
			return false;
		}		
		su++;
	
		$("#itemCount").val(su);			
		var amt = price * su;	
		$("#payAmt").html(amt);
		
	});
});

$(function(){
	$(".btn_sub").click(function(){
		var price = $(this).attr("data-price");
		
		var su = $("#itemCount").val();
		if(su=="") {
			su = 1;
		} else {
			su = parseInt(su);
		}
		if(su<=1) {
			alert("계산 범위를 벗어났습니다.");
			return false;
		}
		su--;
		
		$("#itemCount").val(su);		
		var amt = price * su;	
		$("#payAmt").html(amt);
	});	
});
</script>
<div class="barContent">
		<img style="width: 100%" height="272px;" src='<%=cp%>/resource/images/capture.png'>
</div>

<div class="body-container" style="min-height: 700px;margin-bottom: 20px;">
	<div class="body-title">
		<h3 style="padding-top: 20px;"> 상품정보 </h3>
	</div>

  <div style="clear: both;">
	<div class="box1">
		<h4 style="margin:border-bottom-width: 10px;margin-bottom: 10px;">판매기간 : 2020-01-09~</h4>
			
		 <p>
			<img id="itemImg" src="/mgbxAD/uploads/item/${dto.itemImg}" width="380">
		 </p>	
		 <div>
		 	<span>${dto.itemOrigin}</span>
		 </div>
	</div>
	
	<div class="box2">
		<div style="margin-bottom: 20px;padding-bottom: 10px; border-bottom: 2px #878787;">
			<h4 style="margin-bottom: 10px;">${dto.itemName}</h4>
			<h5 style="text-align: right; margin-right: 10px;">${dto.itemPart}</h5>
		</div>
		<div class="itemDetail">
			<ul class="detail">
				<li class="detail">
					<p style="margin-bottom: 20px;">
						${dto.itemDetail}
					</p>
				</li>
				<li class="itemDetail2">
					<p style="margin-bottom: 20px;">
						<strong>
							스토어 판매가
						</strong>
						<span>
							${dto.itemPrice}
						</span>원
					</p>
				</li>
				<li>	
					<div>
						<p class="itemAmount" style="margin-bottom: 20px;">
							<strong> 수량 : </strong>
							<button type="button" class="btn_sub" title="수량 1 감소" data-price="${dto.itemPrice}">-</button>
							<input type="text" class="count"  id="itemCount" title="티켓 수량 입력" value="1" readonly>
							<button type="button" class="btn_plus" title="수량 1 증가" data-price="${dto.itemPrice}">+</button>
						</p>	
					</div>
				</li>
				<li class="totalAmount">
					<p style="margin-bottom: 20px;">
						<span>
							<strong>총 합계 : </strong><span id="payAmt">${dto.itemPrice}</span>원
						</span>
					</p>
					<form name="okForm" method="post">
					
						<h4 style="margin-bottom: 30px;">
							* 구매 전 상품과 수량을 확인해주세요! *
						</h4>		
					<button type="button" class="btn" onclick="buy()">구매하기</button>
					<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/item/list';">뒤로가기</button>
					
					</form>
				</li>
			</ul>
		</div>
		
  	</div>	

	</div>
</div>

<div id="modal">

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<script type="text/javascript">
function ajaxJSON(url, type, query, fn) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			fn(data);
		}
		,beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		}
		,error:function(jqXHR) {
			if(jqXHR.status==403) {
				login();
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

function ajaxHTML(url, type, query, selector) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			if($.trim(data)=="error") {
				listPage(1);
				return false;
			}
			$(selector).html(data);
		}
		,beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		}
		,error:function(jqXHR) {
			if(jqXHR.status==403) {
				login();
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

function buy(){
	var uid="${sessionScope.member.userId}";
	if(!uid){
		alert("로그인이 필요합니다!");
		location.href="<%=cp%>/member/login";
		return;
		
	} else {
		
	var IMP = window.IMP; // 생략가능
	IMP.init('imp36876789');  // 가맹점 식별 코드
	
	var uemail = "${sessionScope.customer.email}";
	var uname = "${sessionScope.customer.userName}";
	var utel = "${sessionScope.customer.tel}";
	var amount = $("#payAmt").text();
    var itemCount = $("#itemCount").val();
    var itemPrice = $("#itemPrice").val();
    var itemCode=$("#itemCode").val();
    
	IMP.request_pay({
	   	pg : 'html5_inicis', // 결제방식
	    pay_method : 'card',	// 결제 수단
	    merchant_uid : 'merchant_' + new Date().getTime(),
	   	name : '${dto.itemName}',	// order 테이블에 들어갈 주문명 혹은 주문 번호
	    amount : amount,	// 결제 금액 amount
	    buyer_email : uemail,	// 구매자 email
	   	buyer_name :  uname,	// 구매자 이름
	    buyer_tel :  utel,	// 구매자 전화번호
	    m_redirect_url : '/khx/payEnd.action'	// 결제 완료 후 보낼 컨트롤러의 메소드명
	}, function(rsp) {
		if ( rsp.success ) { // 성공시
			alert("결제가 완료되었습니다.");
			
		
			var f=document.storeForm;
			f.amount.value=amount;
			f.pdPayId.value=rsp.imp_uid;
			f.pdPayCode.value=rsp.apply_num;
			f.pdSudan.value=rsp.pay_method;
			f.action="<%=cp%>/mypage/store";
			f.submit();
			

		} else { // 실패시
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			alert(msg);
		}
	});
	}
}
 	 
</script>

<form name="storeForm" method="post">
  
  <input type="hidden" name="itemCode" value="${dto.itemCode}"/>
  <input type="hidden" name="itemPrice" value="${dto.itemPrice}"/>
  <input type="hidden" name="amount" value=""/>
  <input type="hidden" name="itemCount" value=""/>
  <input type="hidden" name="pdPayId" value=""/>
  <input type="hidden" name="pdPayCode" value=""/>
  

</form>

</div>