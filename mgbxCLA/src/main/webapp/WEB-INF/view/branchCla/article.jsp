<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
	<div >
	
		
		<h3 style="font-weight: bold;">${dto.branName}</h3>
		
		<div id="branImgArea" data-img="url('http://localhost:9090/mgbxAD/branchImg/branch/${dto.imageFilename}')" style="height: 400px;background-image: url('http://localhost:9090/mgbxAD/branchImg/branch/${dto.imageFilename}');background-size: 100% 100%;">
		<div>
		
		<h3 class="cmdquf">상영시간표</h3>
		
		<div style="height: 500px; ">
		  <h1>여기다가 상영시간표 넣으면 됩니다.</h1>
		</div>
		
	</div>
	
	
	<h3 class="cmdquf">층별안내</h3>
				<div class="floatch">
					<strong>지하2층 </strong>  
					<p>3관, 4관, 로비, 자판기, 엘리베이터, 게임센터, 남자,여자 화장실</p>
				</div>
				<div class="floatch">
					<strong>로비층</strong>
					<p>매표소, 매점, 로비, 무인발권기, 엘리베이터, 남자,여자 화장실</p> 
				</div>
				<div class="floatch">
					<strong>2층</strong> 
					<p>1관, 로비, 자판기, 남자,여자 화장실</p>
				</div>
				<div class="floatch">
					<strong>4층</strong> 
					<p>2관, 로비, 자판기, 엘리베이터, 남자,여자 화장실</p>
				</div>
				
				<div>
					<h3 class="cmdquf">약도 /교통 /주차</h3>
				</div>
				
				
				<div style="height: 300px;">
				<h1>여기다가 지도를 넣는 곳입니다.</h1>
				</div>
	
				
			<div style="color: white;background-color: rgba( 000, 000, 000, 0.7 );height: 150px;margin-top: 250px">
				  <p style="font-size: 20px; margin-top: 20px;margin-left: 30px">우편번호 : ${dto.branZip}</p>
			      <p style="font-size: 20px;margin-left: 30px">주소 : ${dto.branAddr1} ${dto.branAddr2}</p> 
			</div>
		</div>
	
	</div>