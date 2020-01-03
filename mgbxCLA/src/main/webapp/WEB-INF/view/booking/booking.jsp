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

function movieSerach(){
	$("#movieSelecter").dialog({
		modal: true,
		height:800,
		width:900,
		title: "영화목록",
		close: function(event, ui) {
		}
	});
}
</script>
<div class="bookingForm">
	<div style="width: 45%; height: 100%;float: left;">
		<div style="width: 100%; height: 15%;">날짜</div>
		<div style="width: 100%; height: 35%;">
			<p>극장</p>    
			<span>
				 <button class="cinemaButton" type="button" onclick="cinemaSearch();">+</button>
			     <button class="cinemaButton" type="button" onclick="cinemaSearch();">+</button>
				 <button class="cinemaButton" type="button" onclick="cinemaSearch();">+</button>
				 <button class="cinemaButton" type="button" onclick="cinemaSearch();">+</button>
			</span>
		</div>
		<div style="width: 100%; height: 50%;">  
			<p>영화</p>
			<span style="margin-left: 14px;">
				 <button class="movieButton" type="button" onclick="movieSerach();">+</button>
			     <button class="movieButton" type="button" onclick="movieSerach();">+</button>
				 <button class="movieButton" type="button" onclick="movieSerach();">+</button>
				 <button class="movieButton" type="button" onclick="movieSerach();">+</button>
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
	
	<div id="movieSelecter" style="display: none;">
		 <c:forEach var="vo" items="${list}">
			      <div class="a1" style="height: 300px; width: 150px; float: left; margin-top: 20px;">
				      <div style="height: 78%; border: none; width: 100%;">
				      	<c:choose>
					      	<c:when test="${vo.thumbNail != 'No images'}">
					      		<img src="${vo.thumbNail}" width="100%;" height="100%">
					      	</c:when>
				      		<c:otherwise>
				      			<div style="width: 100%;height: 70%; text-align: center;">
				      				<p style="height: 150px; font-size: 25px;padding-top: 50px;">이미지가<br> 없습니다.</p>
				      			</div>
				      		</c:otherwise>
				      	</c:choose>
				   	  </div>
				   	  
				   	  <div style="height: 10%; border: 1px solid #e4e4e4; background-color: white; ">
					   	 <span style="float:left; font-size: 11pt;">평점 : 9.5</span>
					   	 <span style="float:right; margin-right:5px; font-size: 11pt;">★★★★☆</span>
				   	  </div>
				   	  
				      <div style="height: 12%; border: 1px solid #e4e4e4;background-color: white;">
				      		<div class="ccc" style="height: 100% ;width: 100%">
				      			<c:choose>
				      				<c:when test="${vo.audits == '전체'}">
				      					<span class="ddd" style="margin-left: 5px; margin-right: 5px; font-size: 10pt; color: white; height:20px; width: 20%; 
				      						text-align:center; border-style: solid; border-width: 1px; border-color: green; border-radius: 5px; background: green; ">${vo.audits}</span>
				      				</c:when>
				      				<c:when test="${vo.audits == '12'}">
				      					<span class="ddd" style="margin-left: 5px; margin-right: 5px; font-size: 10pt; color: white; height:20px; width: 20%; 
				      						text-align:center;  border-style: solid; border-width: 1px; border-color: green; border-radius: 5px; background-color: #3DB7CC; ">${vo.audits}</span>
				      				</c:when>
				      				<c:when test="${vo.audits == '15'}">
				      					<span class="ddd" style="margin-left: 5px; margin-right: 5px; font-size: 10pt; color: white; height:20px; width: 20%; 
				      						text-align:center;  border-style: solid; border-width: 1px; border-color: green; border-radius: 5px; background: orange;">${vo.audits}</span>
				      				</c:when>
				      				<c:otherwise>
				      					<span class="ddd" style="margin-left: 5px; margin-right: 5px; font-size: 10pt; color: white; height:20px; width: 20%; 
				      						text-align:center;  border-style: solid; border-width: 1px; border-color: green; border-radius: 5px;background: red; ">${vo.audits}</span>
				      				</c:otherwise>
				      			</c:choose>
				      			<span class="ddd" style="margin-top:5px;padding-top:5px;margin-left: 10px; font-weight: bold; font-size: 12px; width: 65%;  text-overflow: ellipsis; overflow: hidden; white-space: nowrap; display: inline-block;">${vo.movieNm}</span>
				      		</div>
				      </div>
			      </div>
			    </c:forEach>
	</div>
	
</div>