<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>


<style>

.returnImage{
background-image: url(<%=cp%>/resource/images/returnImage.png);
background-size: 100% 100%;
width: 40px;
height: 89%;
float: left;
cursor: pointer;
}

.seatBtns{
width: 60px;
height: 35px;
outline: none;
border: 1px solid black;
font-weight: bold;
border-radius: 5px;
}

.seatBtns:hover{
font-size: 17px;
}
#bookingSeat div{
padding: 0;
margin: 0;
}
.infoSeat{  
width: 20px;
height: 20px;
border: 1px solid black;
float: left; 
}
.infoSeatDiv{
margin:5px auto;
width: 90%;
height: 10%;
}
.clickSeat{
width: 24px;
height: 24px;  
font-weight:bold; 
background: purple;
border: 1px solid black;
color: white
}
.deleteSeat{
width: 24px;
height: 24px;  
pointer-events:none;
background: white;
border: none;
color: white;
}
.seatRows{
width: 24px;
height: 24px;  
padding: 0;
text-align: center;
font-size: 10px;
font-weight:bold;   
background: white;
border: 1px solid black;  
} 
.seatSelect{
width: 24px;
height: 24px;  
padding: 0;
text-align: center;
font-weight:bold;   
background: white;
border: 1px solid black;  
}
.seatTableMap table{
margin: 0px auto;
margin-top: 30px;
}

p{
margin: 0px;
padding: 0px;

}
.movieJone p{
width: 90%;
height: 50%;
}
.movieJone a{
font-size: 20px;
margin-left: 10px;
font-weight: bold;
}
.age12{
	font-size: 15px;
    color: white;
    text-align: center;
    border-style: solid;
    border-width: 1px;
    border-color: green;
    border-radius: 5px;
    background-color: #3DB7CC;
}
.btn {
	font-weight: 600;
    text-transform: uppercase;
    font-size: 13px;
    background-color: white;
	font-family: 'Sunflower', sans-serif;
	border:1px solid;
	font-size: 13px;
	/* margin-top: 13px; */

}

.btn:hover {
	color: white;
	background-color: black;

}

.btn-outline-primary {
    color: #1a1a1a;
    border-color: #1a1a1a;
    height: 52px;
    width: 90px;
}


.btn-outline-primary1 {
    color: #1a1a1a;
    border-color: #1a1a1a;
    height: 35px;
    width: 90px;
}




.bookingForm{
border: 1px solid black;
width: 800px;
 height: 550px;
}


.leftDiv{
width: 45%; 
height: 100%;
float: left;
border-right: 1px solid black;
}

.scheduleList{
width: 99%;
height: 95%;
overflow: scroll;
overflow-x:hidden;
display: inline-block;
}
.schClass{
position:relative;
width: 99%;
height: 20%;
background: white;
border-bottom: 1px solid #cccccc;
cursor: pointer;
} 
.schClass a:hover{
text-decoration: none;
}
.timeJone{
width: 27%;
height: 100%;
float: left;
font-size: 15px;
padding-top:22px;
border-right: 1px solid #cccccc;
padding-left: 5px;
}
.timeJone strong{
font-size: 22px;
}
.movieJone{
width: 47%;
height: 100%;
float: left;
}
.branJone{
width: 26%;   
height: 100%;
float: left;
font-size: 11px;
text-align: right;
color: black;
font-weight: bold;
padding-right: 3px;
padding-top: 5px;
}
.nonScheduleMessage{
width: 100%;
height: 50px;
text-align: center;
margin-top: 50px;
}
.cinemaLi{  
width: 41%;
height: 60px; 
margin-left: 20px;   
background: white;
border: 1px solid #198591; 
list-style: none;
float: left;
margin-top: 15px
}

.cinemaLi button{  
width: 100%;
height: 100%;     
background: white;
border: none;
outline: none; 
}

.cinemaLi :focus { 
outline:none; 
}  

.movieLi{  
width: 23%;
height: 120px;
margin-left: 5px;
background: white;
border: 1px solid #198591;
list-style: none;
float: left;
margin-top: 35px;
}

.movieLi button{  
width: 100%;
height: 100%;     
background: white;
border: none;
outline: none; 
}

.movieLi :focus {   
outline:none; 
}    

.timeDiv{     
width:89%;     
height:30%;
display: inline-block; 
overflow: hidden;   
cursor: pointer;
position: relative;
top: -29px;
left: 20px;
border: 1px solid black;
}  
.dateDiv{     
width:90%;     
height:30%;
display: inline-block; 
overflow: hidden;   
cursor: pointer;
position: relative;
top: -28px;
left: 17px;
border: 1px solid black;
} 

.timeDiv li{
width: 35px;
display: inline-block;
height: 100%;
text-align: center;
padding: 0px 0px 0px 0px;
list-style: none;
float: left;
}

.dateDiv li{
width: 64px;
display: inline-block;
height: 100%;  
text-align: center;
padding: 0px 0px 0px 0px;
list-style: none;
float: left;
}

#branchCinemas ul{
height: 87%;
width: 20%;
float: left

}
#branchCinemas li{
list-style: none;
}
.selectBranchActive{
background-color: #198591;
color: white;
}

.addSelects{  
width: 41%;
height: 60px;  
margin-left: 20px;
margin-top: 15px;    
background: white;
border: 1px solid #198591;
list-style: none;
float: left;
}

.addSelectsM{  
width: 23%;
height: 120px;
margin-left: 5px;
background: white;
border: 1px solid #198591;
list-style: none;
float: left;
margin-top: 35px;
}

.addSelectsbutton{
width: 17px;
height: 18px;  
background: none;
border-left: 1px solid #198591;
border-bottom: 1px solid #198591;
border-top:none;
border-right:none;
outline: none; 
float: right;
background-image:url(<%=cp%>/resource/images/ximage.jpg);
background-size: 100% 100%;
}

.addSelects button:focus ,.addSelectsM button:focus { 
outline:none; 
}
.addSelectsbuttonM{
width: 17px;
height: 18px;  
background: white;
border-left: 1px solid #198591;
border-bottom: 1px solid #198591;
border-top:none;
border-right:none;
outline: none; 
float: right;
background-image:url(<%=cp%>/resource/images/ximage.jpg);
background-size: 100% 100%;
}

.selBranchAdd{
width:130px;
height: 30px;
text-overflow: ellipsis; 
overflow: hidden; 
white-space: nowrap; 
display: inline-block;
text-align: center;
padding-left: 12px;
}

.selMovieAdd {
width:100%;
height: 30px;
text-overflow: ellipsis; 
overflow: hidden; 
white-space: nowrap; 
display: inline-block;
text-align: center;
margin-top: 20px;
}

#areaListUL{
width: 20%;
height: 87%;


}
#areaListUL li{
width: 100%;
height: 12%;
text-align: center;
padding-top: 18px;
border: 1px solid #cccccc;
border-spacing: 0;
border-collapse: collapse;
border-top: none;
cursor: pointer;
font-weight: bold;
}

#branListUL{
width: 20%;
height: 87%;
overflow: scroll;
overflow-x:hidden
}
#branListUL li{
width: 100%;
height: 8%;
text-align: center;
cursor: pointer;
border-bottom:0.5px solid white;
padding-top: 5px;
font-weight: bold;

}
#bookingMap{
width: 59%;
height:87%; 
float: left;
}

#branchSelectList span{

border: 1px solid #cccccc;
margin-left: 5px;
margin-top: 15px;
font-size: 16px;
font-weight: bold;
height: 45%;
width:20%;
text-overflow: ellipsis; 
overflow: hidden; 
white-space: nowrap; 
display: inline-block;
text-align: center;

}

#movieSelectList span{

border: 1px solid #cccccc;
margin-left: 5px;
margin-top: 15px;
font-size: 16px;
font-weight: bold;
height: 45%;
width:20%;
text-overflow: ellipsis; 
overflow: hidden; 
white-space: nowrap; 
display: inline-block;
text-align: center;

}

.btnss{
	font-weight: 600;
    text-transform: uppercase;
    font-size: 13px;
    background-color: white;
    font-family: 'Sunflower', sans-serif;
    border: 1px solid;
    font-size: 13px;
    float: right; 
    border-radius: 0;
    width: 55px;
    height: 35px;
}
.btns{
	font-weight: 600;
    text-transform: uppercase;
    font-size: 13px;
    background-color: #e6e6e6;
    font-family: 'Sunflower', sans-serif;
    border: 1px solid;
    font-size: 13px;
    float: right; 
    border-radius: 0;
    width: 55px;
    height: 35px;
}
.btnsBooking{
	font-weight: 600;
    text-transform: uppercase;
    font-size: 13px;
    background-color: white;
    font-family: 'Sunflower', sans-serif;
    border: 1px solid black;
    font-size: 13px;
    float: right; 
    border-radius: 0;
    width: 55px;
    height: 35px;
}
.btnsBooking:hover,.btnss:hover {
	color: white;
	background-color: purple;
	border: 1px solid black;

}
.btnsBooking:focus{
outline: none;
}

.btnss:focus{
outline: none;
}

.btn-outline-primary{
border: none; 
font-size: 18px; 
padding:3px; 
padding-top: 14px;
}
.fill{
	margin-right:5px;
    width: 119px;
    height: 20px;
    float:left;
    background: url(http://image2.megabox.co.kr/mop/home/bg_star.png) 0 -20px no-repeat;
}
.bmemberLogin{
cursor:pointer;
padding-top: 15px;
font-size: 25px;
margin:0px auto;
text-align:center;
width: 80%;
height: 40%;
background: black;
color: white;
font-weight: bold;
}
.bnmemberLogin{
cursor:pointer;
border:1px solid black;
padding-top: 15px;
font-size: 25px;
margin:0px auto;
text-align:center;
margin-top:10px;
width: 80%;
height: 40%;
font-weight: bold;
}
.nonMemberIn{
font-weight: bold;
width: 100%;
height: 90%;
overflow: hidden;
}

.nonMemberIn table{
width: 100%;
height: 90%;
}

.nonMemberIn input{
width: 50px;
border-radius: 5px;
outline: none;
height: 23px;
border: 1px solid #cccccc;
}

.nonMemberIn select{
width: 70px;
height: 23px;
text-overflow: ellipsis;
overflow: hidden;
white-space: nowrap;
display: inline-block;
border: 1px solid #cccccc;
border-radius: 5px;

}
.nonMemberIn tr{
height: 20%;
}

.selLogin{
width: 100%;height: 90%;padding-top: 40px;
}
</style>



<script type="text/javascript">
var timePosition=0;
var datePosition=0;

var selBranchCount=0;
var selBranchCountEnd=0;

var selMovieCount=0;
var selMovieCountEnd=0;

var totBookingCount=0;
var selectSeatCount=0;

var schduleTimer=null;

function schduleCreateTimers(){
	schduleTimer =setInterval("scheduleList()",10000);
}

function schduleClealTimers(){
	clearInterval(schduleTimer);
}

function seatCreateTimers(){
	schduleTimer=setInterval("readBookingSeat()",20000);
}


function buyForm(data){
	console.log(data);
	
	var type="get";
	var url="<%=cp%>/booking/bookingTiketingForm";
	var query=
	ajaxHTMLBooking(url, type, query, selector);
	
	$("#bookingTiketingForm").dialog({
		modal: true,
		height:650, 
		width:1050,
		title: "",
		open:function(){
       	 $(this).parents(".ui-dialog:first").find(".ui-dialog-titlebar").remove();
        },
		close: function(event, ui) {

		}
	   
	});
}

function nmemInsert(){
	var str;
	
	var query="";
	
    str = $("input[name=name]").val();
	str = str.trim();
    if(!str) {
        alert("이름을 입력하세요. ");
        $("input[name=name]").focus();
        return;
    }
	
    query="userName="+str;
    
    str = $("select[name=tel1]").val();
	str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요. ");
        $("select[name=tel1]").focus();
        return;
    }
	
    query+="&tel1="+str;
    
    str = $("input[name=tel2]").val();
	str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요. ");
        $("input[name=tel2]").focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        $("input[name=tel2]").focus();
        return;
    }
    
    query+="&tel2="+str;

    str = $("input[name=tel3]").val();
	str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요. ");
        $("input[name=tel3]").focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        $("input[name=tel3]").focus();
        return;
    }
    
    query+="&tel3="+str;
    
    str = $("input[name=email1]").val();
	str = str.trim();
    if(!str) {
        alert("이메일을 입력하세요. ");
        $("input[name=email1]").focus();
        return;
    }
    
    query+="&email1="+str;

    str = $("input[name=email2]").val();
	str = str.trim();
    if(!str) {
        alert("이메일을 입력하세요. ");
        $("input[name=email2]").focus();
        return;
    }
    
    query+="&email2="+str;

    
    str = $("input[name=birth]").val();
	str = str.trim();
    if(!str || !isValidDateFormat(str)) {
        alert("생년월일를 입력하세요[YYYY-MM-DD]. ");
        $("input[name=birth]").focus();
        return;
    }
    
    query+="&birth="+str;

    var url="<%=cp%>/booking/noMemSubMit";
    var type="post";
    var fn=function(data){
    	$("#bookingLoginForm").dialog("close");
    	if(!data.data){
    		alert("잘못된 정보입니다.");	
    		return;
    	}
    	console.log(data.data);
    	buyForm(data);
    }
    ajaxJSONs(url, type, query, fn);
}

function ajaxHTMLBooking(url, type, query, selector) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			$(selector).html(data);
		}
	    ,error:function(jqXHR) {
	    	
	    }
	});
}
$(document).on("change","select[name=selectEmailss]",function(){
	    
    var str = $(this).val();
    if(str!="direct") {
    	$("input[name=email2]").val(str).attr("readonly",true); 
    }
    else {
    	$("input[name=email2]").val("").attr("readonly",false);

    }
    
    $("input[name=email1]").focus();
});

$(document).on("click",".bmemberLogin",function(){
	location.href="<%=cp%>/member/login";

});
$(document).on("click",".bnmemberLogin",function(){
	var url = "<%=cp%>/booking/nmemLoginForm";
	var type="get";
	var query="";
	var selector="#bookingLoginForm"
	ajaxHTMLBooking(url, type, query, selector);
});
function blfReturn(){
	var url = "<%=cp%>/booking/nmemSelectForm";
	var type="get";
	var query="";
	var selector="#bookingLoginForm"
	ajaxHTMLBooking(url, type, query, selector);
}
function blfClose(){
	$("#bookingLoginForm").dialog("close");
}
function buyTiket(){
	
	var selectSeat=$(".clickSeat");
	if(totBookingCount!=selectSeatCount||selectSeat.length==0){
		alert("좌석을 선택해 주세요.");
		return;
	}
	var scheduleCode=$("input[name=scheduleCode]").val();
	
	var url="<%=cp%>/booking/logincheck";
	var type="get";
	var query="";
	var fn=function(data){
		if(!data.data){
			alert("로그인이 필요한 서비스입니다.");
						
						
						$("#bookingLoginForm").dialog({
							modal: true,
							height:300, 
							width:350,
							title: "",
							open:function(){
					       	 $(this).parents(".ui-dialog:first").find(".ui-dialog-titlebar").remove();
					       		blfReturn();
					        },
							close: function(event, ui) {
			
							}
						   
						});
		}else{
			buyForm(data);
			alert("로그인이 필요한 서비스입니다.");
			
		}
	}
	ajaxJSONs(url, type, query, fn);
}

$(document).on("click",".returnImage",function(){
	totBookingCount=0;
	selectSeatCount=0;
	$(".clickSeat").attr("class","seatSelect");
	$("select").val("0");
	$(".totMoney").html("0원").attr("data-price","");
});

$(document).on("click",".btnss",function(){
	$("#bookingForm").dialog("close");
});

function closedSeat(){
	$("#bookingSeat").dialog("close");
}

$(document).on('change',".peopleSelectjone select", function() {
	  var sels=$(".peopleSelectjone select");
	  var tot=0;
	  for(var i=0;i<sels.length;i++){
		  tot+=parseInt(sels[i].value);
	  }
	  if(tot>8){
		  alert("인원 선택은 최대 8명까지 가능합니다.\n단체관람 문의:02-2455-4568");
		  $(this).val("0");
		  return;
	  }
	  if(tot<selectSeatCount){
		  alert("선택하신 좌석수가 인원수 보다 많습니다.\n좌석 선택을 전부 취소하시겠습니까?");
		  $(".clickSeat").attr("class","seatSelect");
		  selectSeatCount=0;
	  }
	  
	  totBookingCount=tot;
	});

$(document).on('click',".seatSelect", function() {
	if(selectSeatCount>=totBookingCount){
		alert("선택하신 인원수보다 예매하실 좌석수가 많습니다.");
		return;
	}
	selectSeatCount++;
	$(this).attr("class","clickSeat");
	  var totprice=0;
  	  var i=selectSeatCount
      var sels=$(".peopleSelectjone select");
	go:  for(var z=0;z<sels.length;z++){
			  var price=parseInt(sels[z].getAttribute("data-price"));
			for(var j=0;j<parseInt(sels[z].value);j++){
				if(i==0){
				 	break go;
				  }
				totprice+=price;
				i--;
			} 
		  }
	  
	  $(".totMoney").attr("data-price",totprice).html(totprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원");
});

$(document).on('click',".clickSeat", function() {
	selectSeatCount--;
	$(this).attr("class","seatSelect");
	
	  var totprice=0;
	  go:for(var i=selectSeatCount;0<i;i--){
			  var sels=$(".peopleSelectjone select");
			  for(var z=0;z<sels.length;z++){
				  var price=parseInt(sels[z].getAttribute("data-price"));
				for(var j=0;j<parseInt(sels[z].value);j++){
					if(i==0){
					 	break go;
					  }
					totprice+=price;
					i--;
				} 
			  }
		  }
		  $(".totMoney").html(totprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원");
});

function readBookingSeat(){
	var scheduleCode=$(".schClass[data-select=select]").attr("data-schedulecode");
	
	var url="<%=cp%>/booking/readSeat";
	var query="scheduleCode="+scheduleCode;
	var type="get";
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			$("#bookingSeat").html(data);
			
		}
	});
}
$(document).on("click",".btnsBooking",function(){
	readBookingSeat();
		$("#bookingSeat").dialog({
			modal: true,
			height:680, 
			width:1050,
			title: "",
			open:function(){
	       	 $(this).parents(".ui-dialog:first").find(".ui-dialog-titlebar").remove();
	       	schduleClealTimers();
	         seatCreateTimers();
	        },
			close: function(event, ui) {
				schduleClealTimers();
				schduleCreateTimers();
				totBookingCount=0; 
				selectSeatCount=0;
			}
		});

});


$(document).on("click",".schClass",function(){
	$(".schClass").css("border","none").attr("data-select","");
	$(this).css("border","#198591 solid 2px").attr("data-select","select");
	$(".btns").attr("class","btnsBooking");
	$(".btnsBooking").attr("disabled",false);
});

function bookingForm(){
	
	var url="<%=cp%>/booking/booking";
	var type="get";
	var query="";
	var selector="#bookingForm";
	ajaxHTMLs(url, type, query, selector);
	
	$("#bookingForm").dialog({
		modal: true,
		height:680, 
		width:850,
		title: "",
		open:function(){
       	 $(this).parents(".ui-dialog:first").find(".ui-dialog-titlebar").remove();
         $('html').css('overflow','hidden');
 
        },
		close: function(event, ui) {
			timePosition=0;
			datePosition=0;
			selBranchCount=0;
			selBranchCountEnd=0;
			selMovieCount=0;
			selMovieCountEnd=0;
			totBookingCount=0; 
			selectSeatCount=0;
			schduleClealTimers();
		 $('html').css('overflow','auto');
		}
	   
	});
}

function ajaxHTMLs(url, type, query, selector) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			$(selector).empty();
			$(selector).html(data);
			
			schduleCreateTimers();
			var today = new Date();
			   var time=today.getHours();
			   var mi
			   today.setDate(today.getDate()-1);
			   
			   for(var i=0;i<15;i++){
			  		today.setDate(today.getDate()+1);
					var mm = today.getMonth()+1; 
			   		var yyyy = today.getFullYear();
			   		var dateDay=dateToString(today);
			   		if(i==0){
			   			var dateLi="<li data-idx='"+(i+1)+"' data-dSelect='select' data-dSelect='select' data-day='"+dateDay+"' >오늘</li>"; 
			   		}else{
			   			var dateLi="<li data-idx='"+(i+1)+"' data-dSelect='' data-day='"+dateDay+"' >"+mm+"월 "+today.getDate()+"일</li>"; 
			   		}
					
					$(".dateDiv").find("ul").append(dateLi);
				   }  
			   $(".dateDiv li[data-dSelect=select]").css("background","#198591").css("color","white");
			   
			   for(var z=0;z<31;z++){
				   if(z<10){
					   var timeLi="<li data-tSelect='' data-time='0"+z+"'>"+z+"</li>";
				   }
				   else{
					   var timeLi="<li data-tSelect='' data-time='"+z+"'>"+z+"</li>";
				   }
				   $(".timeDiv").find("ol").append(timeLi);
			   }
			   
			   if((time-5)<0){
					timePosition=0;
				}else if((time-5)>20){
					timePosition=-700;
				}else{
					timePosition=(time-5)*-35;
				}
			   if(time<10){
				    time="0"+time;
				}
			  $(".timeDiv li[data-time='"+time+"']").attr("data-tSelect","select").css("background","#198591").css("color","white").closest("ol").css("margin-left",timePosition+"px");
			  
			   
			   scheduleList();
		}
		
	});
}

function leftTime(){
	if(timePosition==0){
		return;
	}
	timePosition=timePosition+35;
	$(".timeDiv").find("ol").css("margin-left",timePosition+"px");
	
}  
  
function rightTime(){
	if(timePosition==-700){   
		return;
	}
	timePosition=timePosition-35;
	$(".timeDiv").find("ol").css("margin-left",timePosition+"px");
	
}

function leftDate(){
	if(datePosition==0){
		return;
	}
	datePosition=datePosition+64;
	$(".dateDiv").find("ul").css("margin-left",datePosition+"px");
	
}  
  
function rightDate(){
	if(datePosition==-640){   
		return;
	}
	datePosition=datePosition-64;
	$(".dateDiv").find("ul").css("margin-left",datePosition+"px");
	
}

function movieSerach(){
	$("#movieSelecter").dialog({
		modal: true,
		height:800,
		width:900,
		title: "영화목록",
		open:function(){
       	 $(this).parents(".ui-dialog:first").find(".ui-dialog-titlebar").remove();
        },
        buttons: {
            " 확인 " : function() {
            	var inMovie=$(".addSelectsM");
            	var movieSelectList=$("span[name=selectMovies]");
            	var movieLi=$(".movieLi");
            	
            	for(var z=0;z<4;z++){
           
                	if(z<selMovieCount){
                		var movieSelectList=$("span[name=selectMovies]");
                		$(inMovie[z]).css("background-image","none").css("background-size","none").find("span").html("");
                		inMovie[z].setAttribute("data-movieCode",movieSelectList[z].getAttribute("data-movieCode"));
                		inMovie[z].setAttribute("data-movieNm",movieSelectList[z].getAttribute("data-movieNm"));
                		inMovie[z].setAttribute("data-thumNail",movieSelectList[z].getAttribute("data-thumNail"));
                		
                		if(movieSelectList[z].getAttribute("data-thumNail")=="No images"){
                			$(inMovie[z]).find("span").html(movieSelectList[z].getAttribute("data-movieNm"));
                		}else{
                			$(inMovie[z]).css("background-image","url('"+movieSelectList[z].getAttribute("data-thumNail")+"')").css("background-size","cover");
                		}
                		
                		inMovie[z].style.display="";
                		
                		movieLi[z].style.display="none";
                	}else{
                		$(inMovie[z]).css("background-image","none").css("background-size","none").find("span").html("");
                		inMovie[z].style.display="none";
                		movieLi[z].style.display="";
                		inMovie[z].setAttribute("data-movieCode","");
                		inMovie[z].setAttribute("data-movieName","");
                	}
            	}
            	selMovieCountEnd=selMovieCount;
            	scheduleList();
            	 $(this).dialog("close");
             },
             " 취소 " : function() {
            	 var inMovie=$(".addSelectsM");
	             
                 
            	 $("#movieSelectList").find("span").remove();
            	 $(".listOfMovie").css("background","").attr("data-select","");
            	 for(var z=0;z<selMovieCountEnd;z++){
           					 
	                var movieCode=inMovie[z].getAttribute("data-movieCode");
	                var movieNm=inMovie[z].getAttribute("data-movieNm");
	  				var thumNail=inMovie[z].getAttribute("data-thumNail");
	  				$(".listOfMovie[data-movieCode="+movieCode+"]").css("background","#198591").attr("data-select","select");
	                var selMovie="<span name='selectMovies' name='selectmovies' data-thumNail='"+thumNail+"' data-movieCode='"+movieCode+"' data-movieNm='"+movieNm+"'>"+movieNm+"</span>";
	            	
	            	$("#movieSelectList").append(selMovie);
                	}
            	 selMovieCount=selMovieCountEnd;
            	 $(this).dialog("close");
       		},
        },
		close: function(event, ui) {
		}
	});
}

$(document).on("click",".dateDiv li",function(){
	$(".dateDiv li").css("background","").css("color","").attr("data-dSelect","");
	var idx=$(this).attr("data-idx");
	if((idx-3)<0){
		datePosition=0;
	}else if((idx-3)>10){
		datePosition=-640;
	}else{
		datePosition=(idx-3)*-64; 
	}
	$(this).css("background","#198591").css("color","white").attr("data-dSelect","select").closest("ul").css("margin-left",datePosition+"px");
	scheduleList();
});

$(document).on("click",".timeDiv li",function(){
	var hour=$(this).attr("data-time");
	var position = $(".schClass[data-hour="+hour+"]");
	
	if(position.length==0){
		return;
	} 
	
	var today = new Date();
	var time=today.getHours();

	var top=((hour-time)*88.75)-88.75;

	if((hour-5)<0){
		timePosition=0;
	}else if((hour-5)>20){
		timePosition=-700;
	}else{
		timePosition=(hour-5)*-35;
	}
	
	
	$(".timeDiv li").css("background","").css("color","").attr("data-tSelect","");
	$(this).css("background","#198591").css("color","white").attr("data-tSelect","select").closest("ol").css("margin-left",timePosition+"px");

	$(".scheduleList").animate({scrollTop:top},500);
});

function timeToString(hour,min) {
    var m = min;
    if(m < 10) m='0'+m;
    
    return hour + ':' + m;
}

function scheduleList(){
	console.log("1");
	var query="";
	var today = new Date();
	var mi=today.getMinutes();
	var date=$(".dateDiv li[data-dSelect=select]").attr("data-day");
		query+="date="+date;
	var inMovie=$("#movieSelectList").find("span");   
		for(var im=0;im<inMovie.length;im++){
			query+="&movieCode="+inMovie[im].getAttribute("data-movieCode");
		}
		
	var inCinema=$("#branchSelectList").find("span");
		for(var ic=0;ic<inCinema.length;ic++){
			query+="&branCode="+inCinema[ic].getAttribute("data-branCode");
		}
	var type="get";
	var url="<%=cp%>/booking/scheduleList";
	
	var fn=function(data){
		$(".scheduleList").empty();
		if(data.length!=0){
			for(var i=0;i<data.length;i++){
				
				$(".btnsBooking").attr("disabled",true);
				$(".btnsBooking").attr("class","btns");
				
				var startHour=data[i].starttime.substring(0,2);
				var tag="<div class='schClass' data-hour='"+startHour+"' data-select='' data-scheduleCode='"+data[i].scheduleCode+"'>";
					tag+="<div class='timeJone'><strong>"+data[i].starttime+"</strong><span>~"+data[i].endTime+"</span></div>";
					tag+="<div class='movieJone'><p><a class='age"+data[i].audits+"'>"+data[i].audits+"</a><a>"+data[i].movieNm+"</a></p>";
					if(data[i].showingKind==1){
						tag+="<p><a>2D</a></p></div>";
					}else{
						tag+="<p><a>3D</a></p></div>";
					}
					tag+="<div class='branJone'><p>"+data[i].branName+"</p><p>"+data[i].cmName+"</p><p>"+(data[i].cmSeatTot-data[i].seatCount)+"/"+data[i].cmSeatTot+"</p></div></div>";
	
				$(".scheduleList").append(tag);
				if(i==0){
					var time=parseInt(data[i].starttime.substring(0,2));
					 if((time-5)<0){
							timePosition=0;
						}else if((time-5)>20){
							timePosition=-700;
						}else{
							timePosition=(time-5)*-35;
						}
					
					$(".timeDiv li").css("background","").css("color","").attr("data-tSelect","");
					$(".timeDiv li[data-time='"+startHour+"']").attr("data-tSelect","select").css("background","#198591").css("color","white").closest("ol").css("margin-left",timePosition+"px");
					
				}
			}
		}else{
			
			var tag="<p class='nonScheduleMessage'>현재 상영중인 영화가 없습니다.</p>";
			
			$(".scheduleList").append(tag);
		}
	};
	
	ajaxJSONs(url, type, query, fn);
    
}

$(document).on("click",".cinemaLi", function(){
   $("#branchCinemas").dialog({
      modal: true,
      height:600,
      width:900,
      title: "",
      open:function(){
     	 $(this).parents(".ui-dialog:first").find(".ui-dialog-titlebar").remove();
     	 listAreas("${areaList[0].parent}");
      },
      buttons: {
             " 확인 " : function() {
             	
             	var inCinema=$(".addSelects");
             	var cibtn=$(".cinemaLi");
             	for(var z=0;z<4;z++){
             		
	                	if(z<selBranchCount){
	                		var selCinema=$("span[name=selectbranchs]");
	                		inCinema[z].setAttribute("data-branCode",selCinema[z].getAttribute("data-branCode"));
	                		inCinema[z].setAttribute("data-branName",selCinema[z].getAttribute("data-branName"));
	                		inCinema[z].style.display="";
	                		$(inCinema[z]).find("span").html(selCinema[z].getAttribute("data-branName"));
	                		cibtn[z].style.display="none";
	                	}else{
	                		inCinema[z].style.display="none";
	                		cibtn[z].style.display="";
	                		inCinema[z].setAttribute("data-branCode","");
	                		inCinema[z].setAttribute("data-branName","");
	                	}
             	}
             	selBranchCountEnd=selBranchCount;
             	scheduleList();
             	 $(this).dialog("close");
              },
              " 취소 " : function() {                	 
             	 var inCinema=$(".addSelects");
	              
	                 
             	 $("#branchSelectList").find("span").remove();
             	 $("#branListUL").find("li").attr("class",""); 
             	 for(var z=0;z<selBranchCountEnd;z++){
	           					 
		                var branCode=inCinema[z].getAttribute("data-branCode");
		                var branName=inCinema[z].getAttribute("data-branName");
		  
						
		                var selectBranchs="<span name='selectbranchs' data-branCode='"+branCode+"' data-branName='"+branName+"'>"+branName+"</span>";
		                		   
		                $("#branchSelectList").append(selectBranchs);
	                	}
             	 selBranchCount=selBranchCountEnd;
                   $(this).dialog("close");
              }     
        },
      close: function(event, ui) {
    	
      }
       
   });
});


function ajaxJSONs(url, type, query, fn) {
	   $.ajax({
	      type:type
	      ,url:url
	      ,data:query
	      ,dataType:"json"
	      ,success:function(data) {
	         fn(data);
	      }
	   });
	}

$(document).on("click", "#areaListUL li",function(){
	listAreas(this.getAttribute("data-parent"));
	
	$("#areaListUL li").css("background","white");
	
	$(this).css("background","#e5e5e5");
	
	
});
function listAreas(parent){
	   var type="get";
	   var query="parent="+parent;
	   var url="<%=cp%>/branchCla/list";
	   var fn=function (data){
	      $("#branListUL").find("li").remove();
	       
	      if(data.length>0){
	         for(var i=0;i<data.length;i++){
	            var lb="<li data-Addr='"+data[i].branAddr1+"' data-branCode='"+data[i].branCode+"' data-branName='"+data[i].branName+"' class=''>"+data[i].branName+"</li>";
	            
	              $("#branListUL").append(lb);  
	         }
	         
	         if(selBranchCount!=0){
	            var selectbranchs=document.getElementsByName("selectbranchs");
	            
	            var lis=$("#branListUL").find("li");
	            
	            for(var s=0;s<selBranchCount;s++){
	            	
	               for(ss=0;ss<lis.length;ss++){
	            	   
		               if(selectbranchs[s].getAttribute("data-branCode")==lis[ss].getAttribute("data-branCode")){
		                  lis[ss].setAttribute("class","selectBranchActive");
		                  }
	               	}
	            }
	         }
	         
	      }else{
	         var lb="<li>해당 지역에는 지점이 존재하지 않습니다.</li>";
	           $("#branListUL").append(lb);
	      }
	   }
	   ajaxJSONs(url, type, query, fn);
	};

$(document).on("click", "#branListUL li", function() {
	   
	   var branCode=this.getAttribute('data-branCode');
	    var branName=this.getAttribute('data-branName');
	   
	   if(this.getAttribute('class')!=""){
	      $("#branchSelectList span[data-branCode="+branCode+"]").remove();
	      this.setAttribute("class","");
	      selBranchCount--;
	      return;
	   }
	   
	   if(selBranchCount==4){
	      alert("극장은 4개까지만 선택이 가능합니다.");
	      return;
	   }

	   
	    var selectBranchs="<span name='selectbranchs' data-branCode='"+branCode+"' data-branName='"+branName+"'>"+branName+"</span>";
	   
	    $("#branchSelectList").append(selectBranchs);
	    
	    this.setAttribute("class","selectBranchActive");
	    maps(this.getAttribute("data-Addr"),this.getAttribute("data-branName"));
	    selBranchCount++;
	});

$(document).on("click",".addSelectsbutton",function(){
	var idx=this.getAttribute("data-idx");
	var inCinema=$(".addSelects");
	var cibtn=$(".cinemaLi");

	
	$("span[data-branCode="+inCinema[idx].getAttribute("data-branCode")+"]").remove();
	$("#branListUL li[data-branCode="+inCinema[idx].getAttribute("data-branCode")+"]").attr("class","");   
	selBranchCount--;
	
	for(var z=0;z<4;z++){
		
    	if(z<selBranchCount){
    		var selCinema=$("span[name=selectbranchs]");
    		inCinema[z].setAttribute("data-branCode",selCinema[z].getAttribute("data-branCode"));
    		inCinema[z].setAttribute("data-branName",selCinema[z].getAttribute("data-branName"));
    		inCinema[z].style.display="";
    		$(inCinema[z]).find("span").html(selCinema[z].getAttribute("data-branName"));
    		cibtn[z].style.display="none";
    	}else{
    		inCinema[z].style.display="none";
    		cibtn[z].style.display="";
    		inCinema[z].setAttribute("data-branCode","");
    		inCinema[z].setAttribute("data-branName","");
    	}
	}
	selBranCountEnd=selBranchCount;
	scheduleList();
});

$(document).on("click",".addSelectsbuttonM",function(){
	var idx=this.getAttribute("data-idx");
	var inMovie=$(".addSelectsM");
	var movieLi=$(".movieLi");

	
	$("#movieSelectList span[data-movieCode="+inMovie[idx].getAttribute("data-movieCode")+"]").remove();
	$(".listOfMovie[data-movieCode="+inMovie[idx].getAttribute("data-movieCode")+"]").css("background","");
	$(".listOfMovie[data-movieCode="+inMovie[idx].getAttribute("data-movieCode")+"]").attr("data-select","");
    
 
	selMovieCount--;
	
	for(var z=0;z<4;z++){
        
    	if(z<selMovieCount){
    		$(inMovie[z]).css("background-image","none").css("background-size","none").find("span").html("");
    		var movieSelectList=$("span[name=selectMovies]");
    		inMovie[z].setAttribute("data-movieCode",movieSelectList[z].getAttribute("data-movieCode"));
    		inMovie[z].setAttribute("data-movieNm",movieSelectList[z].getAttribute("data-movieNm"));

    		if(movieSelectList[z].getAttribute("data-thumNail")=="No images"){
    			$(inMovie[z]).find("span").html(movieSelectList[z].getAttribute("data-movieNm"));
    		}else{
    			$(inMovie[z]).css("background-image","url('"+movieSelectList[z].getAttribute("data-thumNail")+"')").css("background-size","cover");
    		}
    		
    		inMovie[z].style.display="";
    		
    		movieLi[z].style.display="none";
    	}else{
    		$(inMovie[z]).css("background-image","none").css("background-size","none").find("span").html("");
    		inMovie[z].style.display="none";
    		movieLi[z].style.display="";
    		inMovie[z].setAttribute("data-movieCode","");
    		inMovie[z].setAttribute("data-movieName","");
    	}
	}
	selMovieCountEnd=selMovieCount;
	scheduleList();
});

$(document).on("click",".listOfMovie",function(){
	var movieCode=this.getAttribute("data-movieCode");
	
	if(this.getAttribute("data-select")!=""){
		
		$("#movieSelectList span[data-movieCode="+movieCode+"]").remove();
		
		  this.style.background="";
		  
	      this.setAttribute("data-select","");
	      
	      selMovieCount--;
	      
	      return;
	}
	if(selMovieCount==4){
	      alert("영화는 4개까지만 선택이 가능합니다.");
	      return;
	   }
	
	var movieNm=this.getAttribute("data-movieNm");
	var thumNail=this.getAttribute("data-thumNail");
	
	var selMovie="<span name='selectMovies' name='selectmovies' data-thumNail='"+thumNail+"' data-movieCode='"+movieCode+"' data-movieNm='"+movieNm+"'>"+movieNm+"</span>";
	
	$("#movieSelectList").append(selMovie);
	
	this.style.background="#198591";
	
	this.setAttribute("data-select","select");
	
	selMovieCount++;
});

</script>

<div class="header-top">
    <div class="header-left">
        <p style="margin: 2px;">
            <a href="<%=cp%>/" style="text-decoration: none;">
                <span style="width: 200px; height: 70; position: relative; left: 0; top:20px; color: black; filter: mask(color=red) shadow(direction=135) chroma(color=red);font-style: italic; font-family: arial black; font-size: 30px; font-weight: bold;"></span>                
            </a>
            <a href="<%=cp%>"><img src="<%=cp%>/resource/images/logo2.jpg" style="float: left; height: 100%; width:180px; margin-right: 100px;"></a>
            
            
            <a class="btn btn-outline-primary" href="<%=cp%>/movie/newmovie">영화</a>
            <a class="btn btn-outline-primary" href="<%=cp%>/branchCla/branchCla">영화관</a>
            <a class="btn btn-outline-primary" href="<%=cp%>/event/list">이벤트</a>
            <a class="btn btn-outline-primary" href="<%=cp%>/item/list">스토어</a>
            <c:if test="${not empty sessionScope.member}">
            <a class="btn btn-outline-primary" href="<%=cp%>/mypage/info">마이페이지</a>
        	</c:if>
            <a class="btn btn-outline-primary" href="<%=cp%>/customer/main">고객센터</a>
            
        </p>
    </div>
    
    
    <div class="header-right">
        <div style="float: right; margin-top: 13px;">
            <c:if test="${empty sessionScope.member}">
            
  
                <a href="<%=cp%>/member/login" class="btn btn-outline-primary1">로그인</a>
                <a href="<%=cp%>/member/member" class="btn btn-outline-primary1">회원가입</a>
                
            </c:if>
            <c:if test="${not empty sessionScope.member}">
                <span style="color:blue; margin-top: 20px;">${sessionScope.member.userName}</span>님
                &nbsp;|&nbsp;
                <a href="<%=cp%>/member/logout" style="margin-top: 20px;">로그아웃</a>
                <c:if test="${sessionScope.member.userId=='admin'}">
                    &nbsp;|&nbsp;
                    <a href="<%=cp%>/admin">관리자</a>
                </c:if>
                
            </c:if>
        </div>
    </div>
</div>



<div id="bookingForm" style="display: none;width: 760px;height: 550px;">
	
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=04e4431a8f42ef7f22f5a23dfe0e8324&libraries=servicesappkey=APIKEY&libraries=services"></script>
	<script>
function maps(addr,bn){
		
	var addr1=addr;
	var branName=bn;
		var mapContainer = document.getElementById('bookingMap'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(addr1, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+branName+'</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	    
	    
	});    
	}
	</script>

