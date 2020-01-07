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
		
		<div style="background-color: black; height: 500px; "></div>
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
					<ul class="wnth">
						<li>도로명 주소 : 서울특별시 강남구 강남대로 422(역삼동, 씨티빌딩)</li>
						<li>지번 주소 : 서울특별시 강남구 역삼동 816-7 씨티빌딩</li>
					</ul>
				</div>
				
				
				<div style="background-color: tomato; height: 300px;">
				<strong>지도넣어주세요</strong>
				</div>
				
				
				<div>
				  <h3 class="cmdquf">교통 안내</h3>
				  <div> 버스
				  	<div>
				  		<ul>
				  			<li>서초03번, 3412번, 4412번</li>
				  			<li>140번, 144번, 145번, 360번, 400번, 402번, 407번, 420번, 421번, 440번, 441번,471번, 542번, 643번, N13번, N37번</li>
				  			<li>1005-1번, 1100번, 1550번, 1570번, 3030번, 3100번, .3600번, 6000, 6009, 6500, 6009-1, 8001, 8541, 9600,9700번, 9404번, 9408번, 9711B, M7412, G7426</li>
				  		</ul>
				  	</div>
				  </div>
				  
				  
				  <div> 지하철
				  	<div>
				  		<ul>
				  			<li> 지하철 2호선 ‘강남역’하차 → 지하철 11번 출구 이용 도보 3분 (250m)</li>
				  			<li>지하철 9호선 '신논현역'하차 -> 지하철 5번 출구 이용 도보 8분 (500m)</li>
				  		</ul>
				  	</div>
				  </div>
				  
				  
				  <div>
				  	<h3 class="cmdquf">주차 안내</h3>
				  		<ul>
				  			<li>씨티빌딩 후면 주차타워 이용 // 주차공간이 협소하오니 대중교통 이용바랍니다
				  					<ul>
				  						<li><strong>주차확인</strong></li>
				  						<li>매표소에서 주차 인증(평일) 또는 주차권 구매(주말 및 공휴일)</li>
				  					</ul>
				  					
				  					<ul>
				  						<li><strong>주차요금</strong></li>
				  						<li>주차 요금은 입차시간을 기준으로 합니다.</li>
				  						<li>평일관람시 3시간 무료 </li>
										<li>주말 및 공휴일 3시간 2,000원 (단, 주말 및 공휴일은 조조~2회차까지 3시간 무료)</li>
										<li>매표소에서 영화티켓과 주차권 함께 제시 (티켓당 1대 적용)</li>
										<li>초과 요금 발생시 출차시 정산 (30분당 2,000원)</li>
										<li>출차시 무인정산기 이용</li>
				  					</ul>
				  			
				  			</li>
				  			
				  		</ul>
				  	
				  </div>
				  
				  
				
				</div>
				
				
				
			<div style="color: white;background-color: rgba( 000, 000, 000, 0.7 );height: 150px;margin-top: 250px">
				  <p style="font-size: 20px; margin-top: 20px;margin-left: 30px">우편번호 : ${dto.branZip}</p>
			      <p style="font-size: 20px;margin-left: 30px">주소 : ${dto.branAddr1} ${dto.branAddr2}</p> 
			</div>
		</div>
	
	</div>