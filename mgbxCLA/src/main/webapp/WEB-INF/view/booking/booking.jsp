<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
.bookingForm{
border: 1px solid black;
width: 750px;
 height: 500px;
}

.bookingForm div{
border: 1px solid black;
}  
.cinemaButton{  
width: 41%;
height: 30%; 
margin-left: 17px;
margin-bottom: 15px;    
background: white;
border: 1px solid #198591; 
}
.movieButton{  
width: 22%;  
height: 45%;
margin-left: 1px;
margin-top:28px;
margin-bottom: 15px;  
background: white;
border: 1px solid #198591; 
}  
.cinemaButton :focus { 
outline:none; 
}    

.timeDiv{     
width:376px;     
height:30%;
display: inline-block; 
overflow: hidden;   
cursor: pointer;
position: relative;
top: -28px;
left: 17px;
}  

li{
width: 34px;
list-style: none;
display: inline-block;
height: 100%;  
text-align: center;
padding: 0px 0px 0px 0px;
}
</style>

<script type="text/javascript">
var timePosition=0;
function leftTime(){
	if(timePosition==0){
		return;
	}
	timePosition=timePosition+34;
	$(".timeDiv").find("ol").css("margin-left",timePosition+"px");
	
}  
  
function rightTime(){
	if(timePosition==-680){   
		return;
	}
	timePosition=timePosition-34;
	$(".timeDiv").find("ol").css("margin-left",timePosition+"px");
	
}
</script>
<div class="bookingForm">
	<div style="width: 45%; height: 100%;float: left;">
		<div style="width: 100%; height: 15%;">날짜</div>
		<div style="width: 100%; height: 35%;">
			<p>극장</p>    
			<span>
				 <button class="cinemaButton" type="button" onclick="">+</button>
			     <button class="cinemaButton" type="button" onclick="">+</button>
				 <button class="cinemaButton" type="button" onclick="">+</button>
				 <button class="cinemaButton" type="button" onclick="">+</button>
			</span>
		</div>
		<div style="width: 100%; height: 50%;">  
			<p>영화</p>
			<span style="margin-left: 14px;">
				 <button class="movieButton" type="button" onclick="">+</button>
			     <button class="movieButton" type="button" onclick="">+</button>
				 <button class="movieButton" type="button" onclick="">+</button>
				 <button class="movieButton" type="button" onclick="">+</button>
			</span>
		</div> 
	</div>    
	<div style="width: 55%;height: 100%;float: left">    
		<div style="width: 100%; height: 15%; ">       
			<p>시간</p> 
			 <div style="width:100%;border: none;display: inline-block;height: 30%">
				<span style="width: 5%;float:left;text-align: center">
					<a href="javascript:leftTime();">&lt;</a></span>
				
				<span style="width: 5%;float: right;text-align: center">
					<a href="javascript:rightTime();">&gt;</a></span>
			</div>
			<div class="timeDiv">
						<ol style="width:1054px;height: 100%;overflow: hidden;">
							<c:forEach var="vv" begin="0" end="30">
								<li style="float: left">${vv}</li> 
							</c:forEach>
						</ol>    
			</div> 
		</div>
		<div style="width: 100%; height: 85%;">상영목록</div>
	</div>
	
</div>