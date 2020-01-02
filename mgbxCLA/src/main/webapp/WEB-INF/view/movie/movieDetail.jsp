<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


<div style="width: 1000px; min-height: 1000px">
	<!-- 상단 -->
	<div style="width: 900px; height: 400px;">
		<!--왼쪽 이미지 -->
		<div style="width:250px; height: 350px;">
			<img src="" style="width: 230px; height: 336px;">
		</div>
		
		<!-- 오른쪽 전체 -->
		<div style="width: 630px; height: 330px;">
			<!-- 타이틀 -->
			<div style="height: 69px;">
				<h3>
					<i>몇세관람가</i>
					<span>타이틀</span>
				</h3>
			</div>
		
			<!-- 타이틀 및 내용 -->
			<div style="width: 623px; height: 206px;">
				<span>별 몇개</span>
				<p>3353명 참여 7.1점(총점)</p>
				<p>예매율 1위 19.6퍼센트</p>
				<button>예매하기</button>
			</div>
			
			
			<ul>
				<li>
					<strong>타입</strong>
				</li>
				
				<li>
					<strong>개봉일</strong>
				</li>
				
				<li>
					<strong>감독</strong>
				</li>
				
				<li>
					<strong>출연진</strong>
				</li>
				
				<li>
					<strong>장르</strong>
				</li>
				
				<li>
					<strong>누적관객</strong>
				</li>
			</ul>
		</div>
		<!-- 오른쪽 전체끝-->
	</div>
	<!-- 상단 전체 끝 -->
	
	<!-- 줄거리 -->
	<div style="width: 888px; height: 274px;">
		<h3>줄거리</h3>
		<div>줄거리내용 블라블라</div>
	</div>
	<!-- 줄거리 끝 -->
	
	<!-- 동영상 -->
	<div style="width: 888px; height: 625px;">
		<h3>동영상</h3>
		<div>동영상 재생</div>
	</div>
	<!-- 동영상 끝-->
	
	<!-- 아래 게시판 전체 -->
	<div style="888px; height: 1070px;">
		<h3>한줄평(개수)</h3>
		
		<!-- 댓글입력창 -->
		<div style="height: 123px;">
			<!-- 로그인모양 이미지 -->
			<div style="width: 56px;">
				<img src="">
			</div>
			<!-- 로그인모양 이미지 끝 -->
			
			<div style="width: 807px; height: 86px;">
				<form action="">
					<div>
						<div>별몇개</div>
						<div>
							<textarea name="comment" rows="10" cols="30" maxlength="100" readonly onkeyup="로그인 후 댓글 작성 가능합니다." ></textarea>
						</div>
						<div>
							<button type="submit">등록</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- 댓글입력창 끝 -->
		
		<!-- 댓글 목록 -->
		<div style="width: 888px; height: 884px;">
			게시판
		</div>
		
	</div>
	<!-- 아래 게시판 전체 -->
	
	
</div>
<!-- 전체 -->
