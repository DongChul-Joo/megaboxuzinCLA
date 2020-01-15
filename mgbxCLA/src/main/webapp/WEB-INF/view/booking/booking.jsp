<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<div class="bookingForm">
	<div class="leftDiv">
		<div style="width: 100%; height: 15%;border-bottom: 1px solid black">
			<p style="font-weight: bold;">날짜</p> 
			 <div style="margin-top:10px;width:100%;border: none;display: inline-block;height: 30%">
				<span style="width: 5%;float:left;text-align: center;">
					<a href="javascript:leftDate();">&lt;</a></span>
				
				<span style="width: 5%;float: right;text-align: center">
					<a href="javascript:rightDate();">&gt;</a></span>
			</div>
			<div class="dateDiv">
						<ul style="width:894px;height: 100%;overflow: hidden;">
				
							
						</ul>    
				</div> 
		</div>
		<div style="width: 100%; height: 35%;border-bottom: 1px solid black">
			<p style="font-weight: bold;">극장</p>    
			<ul>
				 <li class="cinemaLi"><button type="button" >+</button></li>
				 <li class="addSelects" style="display: none;"><p><button class="addSelectsbutton" data-idx="0" type="button"></button></p><span class="selBranchAdd"></span></li>
				 
            	 <li class="cinemaLi"><button type="button" >+</button></li>
            	 <li class="addSelects" style="display: none;"><p><button class="addSelectsbutton" data-idx="1" type="button"></button></p><span class="selBranchAdd"></span></li>
            	 
           		 <li class="cinemaLi"><button type="button" >+</button></li>
           		 <li class="addSelects" style="display: none;"><p><button class="addSelectsbutton" data-idx="2" type="button"></button></p><span class="selBranchAdd"></span></li>
           		 
            	 <li class="cinemaLi"><button  type="button" >+</button></li>
				 <li class="addSelects" style="display: none;"><p><button class="addSelectsbutton" data-idx="3" type="button"></button></p><span class="selBranchAdd"></span></li>
			</ul>
		</div>
		<div style="width: 100%; height: 50%;">  
			<p style="font-weight: bold;">영화</p>
			<ul >
				 <li class="movieLi"><button class="movieButton" type="button" onclick="movieSerach();">+</button></li>
				 <li class="addSelectsM" style="display: none;"><p><button class="addSelectsbuttonM" data-idx="0" type="button"></button>
				 		</p><span class="selMovieAdd"></span></li>
				 
            	 <li class="movieLi"><button class="movieButton" type="button" onclick="movieSerach();">+</button></li>
            	 <li class="addSelectsM" style="display: none;"><p><button class="addSelectsbuttonM" data-idx="1" type="button"></button>
            			 </p><span class="selMovieAdd"></span></li>
            	 
           		 <li class="movieLi"><button class="movieButton" type="button" onclick="movieSerach();">+</button></li>
           		 <li class="addSelectsM" style="display: none;"><p><button class="addSelectsbuttonM" data-idx="2" type="button"></button>
           		 		</p><span class="selMovieAdd"></span></li>
           		 
            	 <li class="movieLi"><button class="movieButton" type="button" onclick="movieSerach();">+</button></li>
				 <li class="addSelectsM" style="display: none;"><p><button class="addSelectsbuttonM" data-idx="3" type="button"></button>
				 		</p><span class="selMovieAdd"></span></li>
			</ul>
		</div> 
	</div>    
	<div style="width: 55%;height: 100%;float: left">    
		<div style="width: 100%; height: 15%; border-bottom: 1px solid black">       
			<p style="font-weight: bold;">시간</p> 
			 <div style="margin-top:10px;width:100%;border: none;display: inline-block;height: 30%">
				<span style="width: 5%;float:left;text-align: center">
					<a href="javascript:leftTime();">&lt;</a></span>
				
				<span style="width: 5%;float: right;text-align: center">
					<a href="javascript:rightTime();">&gt;</a></span>
			</div>
			<div class="timeDiv">
						<ol style="width:1085px;height: 100%;overflow: hidden;">
						</ol>    
			</div> 
		</div>
		<div class="viewList" style="width: 100%; height: 85%;">
			<p style="font-weight: bold;border-bottom: 1px solid black">상영목록<p>
			<div class="scheduleList"></div>
			</div>
			
			 <button class="btnss"  type="button">취소</button><button class="btns" disabled="disabled" style="margin-right: 1px;" type="button">예매</button>
	</div>
	
	<div id="movieSelecter" style="display: none;width: 900px;height: 800px;overflow:none;">
		<div id="movieSelectList" style="width: 100%; height: 8%;border-bottom: 1px solid #cccccc;border-top: 1px solid #cccccc"></div>
		 <div style="width: 100%;height: 90%;overflow: scroll;overflow-x:hidden">
		 <c:forEach var="vo" items="${movieList}">
			      <div class="listOfMovie" data-select="" data-movieCode="${vo.movieCode}" data-movieNm="${vo.movieNm}" data-thumNail="${vo.thumbNail}" style="height: 300px; width: 180px; float: left; 
			      cursor: pointer;margin-left: 2px;margin-top: 2px;">
			      	<div style="width: 95%;height: 95%;margin: auto;margin-top: 7px;background-color: white;">
				      <div style="height: 78%; border: none; width: 100%;">
				      	<c:choose>
					      	<c:when test="${vo.thumbNail != 'No images'}">
					      		<img src="${vo.thumbNail}" width="100%;" height="100%">
					      	</c:when>
				      		<c:otherwise>
				      			<div style="width: 95%;height: 70%; text-align: center;">
				      				<p style="height: 150px; font-size: 25px;padding-top: 50px;">이미지가<br> 없습니다.</p>
				      			</div>
				      		</c:otherwise>
				      	</c:choose>
				   	  </div>
				   	  
				   	  <div style="height: 10%; border: 1px solid #e4e4e4; background-color: white;width: 100% ">
					   	 <span style="float:left; font-size: 11pt;">평점: ${vo.movieScores}</span>
					   	 <span class="fill" style="width: ${(vo.movieScores*11.4)}px;"></span>
				   	  </div>
				   	  
				      <div style="height: 12%; border: 1px solid #e4e4e4;background-color: white;">
				      		<div class="ccc" style="height: 100% ;width: 100%">
				      			<c:choose>
				      				<c:when test="${vo.audits == '전체'}">
				      					<div  style="padding:0px 3px 0px 3px;margin-top:5px; color: white; width: 20%; font-size:10px; height:65%;text
				      						text-align:center; border-style: solid; border-width: 1px; border-color: green; border-radius: 5px; background: green;float: left; ">${vo.audits}</div>
				      				</c:when>
				      				<c:when test="${vo.audits == '12'}">
				      					<div  style="padding:0px 3px 0px 3px;margin-top:5px;font-size: 10pt; color: white;  width: 20%; height:65%;
				      						text-align:center;  border-style: solid; border-width: 1px; border-color: green; border-radius: 5px; background-color: #3DB7CC; float: left;">${vo.audits}</div>
				      				</c:when>
				      				<c:when test="${vo.audits == '15'}">
				      					<div  style="padding:0px 3px 0px 3px;margin-top:5px;font-size: 10pt; color: white; width: 20%; height:65%;
				      						text-align:center;  border-style: solid; border-width: 1px; border-color: green; border-radius: 5px; background: orange;float: left;">${vo.audits}</div>
				      				</c:when>
				      				<c:otherwise>
				      					<div  style="padding:0px 3px 0px 3px;margin-top:5px;font-size: 10pt; color: white; width: 20%; height:65%;
				      						text-align:center;  border-style: solid; border-width: 1px; border-color: green; border-radius: 5px;background: red;float: left; ">${vo.audits}</div>
				      				</c:otherwise>
				      			</c:choose>   
				      			<div  style="margin-top:9px;margin-left:10px;font-weight: bold; font-size: 12px; width: 65%;  text-overflow: ellipsis; overflow: hidden; white-space: nowrap; display: inline-block;float: left;">${vo.movieNm}</div>
				      		</div>
				      </div>
			      </div>
			      </div>
			    </c:forEach>
			    </div>
	</div>
	  
</div>   
 
<div id="branchCinemas" style="display: none;width: 900px;height: 600px;overflow:none;">
   <div id="branchSelectList" style="width: 100%;height: 12%;border-bottom: 1px solid #cccccc;border-top: 1px solid #cccccc"></div>
   <ul id="areaListUL">
      <c:forEach var="vo" items="${areaList}">
         <li data-parent="${vo.parent}"><span>${vo.areaName}</span></li>
      </c:forEach>
   </ul>
   <ul id="branListUL">
   </ul>
   <div id="bookingMap"></div>
</div>
<div id="bookingSeat" style="display: none;width: 1000px;height: 600px;overflow:none;">
	
</div>


