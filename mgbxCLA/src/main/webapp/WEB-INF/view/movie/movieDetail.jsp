<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


<div style="width: 1000px; min-height: 2000px; border-style: solid; border-radius: 3px; margin: 0px auto;">
	
	
	
	<div style="width: 900px; height: 400px; margin: 0px auto; margin-top: 30px;">
		
		<c:forEach var="vo" items="${movie}">
			<div style="width:250px; height: 350px;">
				<img src="${vo.thumbNail}" style="width: 230px; height: 336px;">
			</div>
		
		
		<div style="width: 630px; height: 330px;">

			<div style="width:100%; height: 69px; border-bottom: 2px; border-bottom-style: dotted;">
				<h3>
					<c:choose>
					      <c:when test="${vo.audits == '전체'}">
					      		<p class="ddd" style="margin-left: 5px; margin-right: 5px; font-size: 10pt; color: white; height:25px; width: 14%; float: left;
					      						 border-style: solid; border-width: 1px; border-color: green; border-radius: 5px; background: green; ">${vo.audits}</p>
					      </c:when>
					      <c:when test="${vo.audits == '12'}">
					      	<p class="ddd" style="margin-left: 5px; margin-right: 5px; font-size: 10pt; color: white; height:25px; width: 14%; float: left;
					      						 border-style: solid; border-width: 1px; border-color: green; border-radius: 5px; background-color: #3DB7CC; ">${vo.audits}</p>
					      </c:when>
					      <c:when test="${vo.audits == '15'}">
					      		<p class="ddd" style="margin-left: 5px; margin-right: 5px; font-size: 10pt; color: white; height:25px; width: 14%; float: left;
					      						 border-style: solid; border-width: 1px; border-color: green; border-radius: 5px; background: orange;">${vo.audits}</p>
					      </c:when>
					      <c:otherwise>
					      	<p class="ddd" style="margin-left: 5px; margin-right: 5px; font-size: 10pt; color: white; height:25px; width: 14%; float: left; border-style: solid; border-width: 1px; border-color: green; border-radius: 5px; background: red; ">${vo.audits}</p>
					      </c:otherwise>
				     </c:choose>
					<span>${vo.movieNm}</span>
				</h3>
			</div>
		
		
		
		
			<div style="width: 623px; height: 206px;">
				<span>별 몇개</span>
				<p>3353명 참여 7.1점(총점)</p>
				<p>예매율 1위 19.6퍼센트</p>
				<button>예매하기</button>
			</div>
			
			
			<ul>
				<li>
					<strong>타입 :</strong>
				</li>
				
				<li>
					<strong>개봉일 :</strong>
				</li>
				
				<li>
					<strong>감독 : </strong>
				</li>
				
				<li>
					<strong>출연진 :</strong>
				</li>
				
				<li>
					<strong>장르 :</strong>
				</li>
				
				<li>
					<strong>누적관객 :</strong>
				</li>
			</ul>
		</div>


		</c:forEach>
	</div>


	


	<div style="width: 888px; height: 274px;">
		<h3>줄거리</h3>
		<div>줄거리내용 블라블라</div>
	</div>



	


	<div style="width: 888px; height: 625px;">
		<h3>동영상</h3>
		<div>동영상 재생</div>
	</div>
	


	<div style="888px; height: 1070px;">
		<h3>한줄평(개수)</h3>
		


		<div style="height: 123px;">

			<div style="width: 56px;">
				<img src="">
			</div>
			
			
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
		

		<div style="width: 888px; height: 884px;">
			게시판
		</div>
		
	</div>
	
	
</div>
