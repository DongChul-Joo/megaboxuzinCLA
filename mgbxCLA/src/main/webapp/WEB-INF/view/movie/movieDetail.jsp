<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


<div style="width: 1000px; min-height: 2000px; border-style: solid; border-radius: 3px; margin: 0px auto;">
	
	
	
	<div style="width: 900px; height: 400px; margin: 0px auto; margin-top: 30px;">
		
			<div style="width:250px; height: 350px;">
				<img src="${movie.thumbNail}" style="width: 230px; height: 336px;">
			</div>
		
		
		<div style="width: 630px; height: 330px;">

			<div style="width:100%; height: 69px; border-bottom: 2px; border-bottom-style: dotted;">
				<h3>
					<c:choose>
					      <c:when test="${movie.audits == '전체'}">
					      		<p class="ddd" style="margin-left: 5px; margin-right: 5px; font-size: 10pt; color: white; height:25px; width: 14%; float: left;
					      						 border-style: solid; border-width: 1px; border-color: green; border-radius: 5px; background: green; ">${movie.audits}</p>
					      </c:when>
					      <c:when test="${movie.audits == '12'}">
					      	<p class="ddd" style="margin-left: 5px; margin-right: 5px; font-size: 10pt; color: white; height:25px; width: 14%; float: left;
					      						 border-style: solid; border-width: 1px; border-color: green; border-radius: 5px; background-color: #3DB7CC; ">${movie.audits}</p>
					      </c:when>
					      <c:when test="${movie.audits == '15'}">
					      		<p class="ddd" style="margin-left: 5px; margin-right: 5px; font-size: 10pt; color: white; height:25px; width: 14%; float: left;
					      						 border-style: solid; border-width: 1px; border-color: green; border-radius: 5px; background: orange;">${movie.audits}</p>
					      </c:when>
					      <c:otherwise>
					      	<p class="ddd" style="margin-left: 5px; margin-right: 5px; font-size: 10pt; color: white; height:25px; width: 14%; float: left; border-style: solid; border-width: 1px; border-color: green; border-radius: 5px; background: red; ">${movie.audits}</p>
					      </c:otherwise>
				     </c:choose>
					<span>${movie.movieNm}</span>
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
	<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
				 <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
				 	
				     <td width="100" bgcolor="#eeeeee" style="text-align: center;">영&nbsp;&nbsp;화&nbsp;&nbsp;명</td>
				     
				 	 <td style="padding-left:10px;"> 
						<input id="movieTitle" type="text" placeholder="영화 제목"/><button type="button" id="btnMovie">영화 검색</button>
					 </td> 
					 
				</tr>
				
				<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
				     <td width="100" bgcolor="#eeeeee" style="text-align: center;">감&nbsp;&nbsp;독&nbsp;&nbsp;명</td>
				 	 <td style="padding-left:10px;"> 
						<input id="director" type="text" placeholder="영화 감독"/>
					 </td> 
				</tr>
			</table>
			<br>
			
			<div style="width: 100%; min-height: 10px;">
				<h3>영화 선택</h3>
				<table id="movieList" style="width: 100%; height: 100%'">
				
				</table>
			</div>
			<br>
			
			<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
				<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
				     <td width="100" bgcolor="#eeeeee" style="text-align: center;">영&nbsp;화&nbsp;코&nbsp;&nbsp;드</td>
				 	 <td style="padding-left:10px;"> 
						<input name="movieCode" type="text" style="width: 200px;">
					 </td> 
				</tr>
				
				<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
				     <td width="100" bgcolor="#eeeeee" style="text-align: center;">영&nbsp;&nbsp;화&nbsp;&nbsp;명</td>
				 	 <td style="padding-left:10px;"> 
						<input name="movieNm" type="text" style="width: 200px;">
					 </td> 
				</tr>
				
				<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
				     <td width="100" bgcolor="#eeeeee" style="text-align: center;">감&nbsp;&nbsp;독&nbsp;&nbsp;명</td>
				 	 <td style="padding-left:10px;"> 
						<input name="moviedirector" type="text" style="width: 200px;">
					 </td> 
				</tr>
				
				<tr align="left" height="110" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
				     <td width="100" bgcolor="#eeeeee" style="text-align: center;">출&nbsp;연&nbsp;진&nbsp;&nbsp;</td>
				 	 <td style="padding-left:10px;"> 
						<textarea name="actor" style="width: 250px; height: 95px;"/></textarea>
					 </td> 
				</tr>
				
				<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
				     <td width="100" bgcolor="#eeeeee" style="text-align: center;">장&nbsp;&nbsp;&nbsp;&nbsp;르</td>
				 	 <td style="padding-left:10px;"> 
						<input name="genre" type="text" style="width: 200px;">
					 </td> 
				</tr>
				
				<tr align="left" height="110" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
				     <td width="100" bgcolor="#eeeeee" style="text-align: center;">상&nbsp;영&nbsp;분&nbsp;&nbsp;류</td>
				 	 <td style="padding-left:10px;"> 
						<textarea name="showing" style="width: 250px; height: 95px;"/></textarea>
					 </td> 
				</tr>
				
				<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
				     <td width="100" bgcolor="#eeeeee" style="text-align: center;">영&nbsp;화&nbsp;등&nbsp;&nbsp;급</td>
				 	 <td style="padding-left:10px;"> 
						<input name="audits" type="text" style="width: 200px;">
					 </td> 
				</tr>
				
				<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
				     <td width="100" bgcolor="#eeeeee" style="text-align: center;">제&nbsp;&nbsp;작&nbsp;&nbsp;사</td>
				 	 <td style="padding-left:10px;"> 
						<input name="production" type="text" style="width: 200px;">
					 </td> 
				</tr>
				
				<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
				     <td width="100" bgcolor="#eeeeee" style="text-align: center;">제&nbsp;작&nbsp;년&nbsp;&nbsp;도</td>
				 	 <td style="padding-left:10px;"> 
						<input name="mcreated" type="text" style="width: 200px;">
					 </td> 
				</tr>
				
				<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
				     <td width="100" bgcolor="#eeeeee" style="text-align: center;">상&nbsp;영&nbsp;시&nbsp;&nbsp;간</td>
				 	 <td style="padding-left:10px;"> 
						<input name="mtime" type="text" style="width: 200px;">
					 </td> 
				</tr>
				
				
				
				<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
				     <td width="100" bgcolor="#eeeeee" style="text-align: center;">제&nbsp;작&nbsp;국&nbsp;&nbsp;가</td>
				 	 <td style="padding-left:10px;"> 
						<input name="country" type="text" style="width: 200px;">
					 </td> 
				</tr>
				
				<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
				     <td width="100" bgcolor="#eeeeee" style="text-align: center;">썸&nbsp;네&nbsp;일&nbsp;&nbsp;</td>
				 	 <td style="padding-left:10px;"> 
						<input name="thumbNail" type="text" style="width: 200px;">
					 </td> 
				</tr>
				
				<tr align="left" height="110" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
				     <td width="100" bgcolor="#eeeeee" style="text-align: center;">줄&nbsp;&nbsp;거&nbsp;&nbsp;리</td>
				 	 <td style="padding-left:10px;"> 
						<textarea name="movieStory" style="width: 500px; height: 95px;"></textarea>
					 </td> 
				</tr>
				
				<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
				     <td width="100" bgcolor="#eeeeee" style="text-align: center;">개&nbsp;봉&nbsp;날&nbsp;&nbsp;짜</td>
				 	 <td style="padding-left:10px;"> 
						<input name="openDate" type="text" style="width: 200px;">
					 </td> 
				</tr>
				
				<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
				     <td width="100" bgcolor="#eeeeee" style="text-align: center;">상&nbsp;영&nbsp;시&nbsp;작&nbsp;일(ex:20191227)</td>
				 	 <td style="padding-left:10px;"> 
						<input name="startDate" type="text"  style="width: 200px;">
					 </td> 
				</tr>
				
				
				<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
				     <td width="100" bgcolor="#eeeeee" style="text-align: center;">상&nbsp;영&nbsp;종&nbsp;료&nbsp;일(ex:20200127)</td>
				 	 <td style="padding-left:10px;"> 
						<input name="endDate" type="text"  style="width: 200px;">
					 </td> 
				</tr>
				</table>
				
				
				<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     	<tr height="45"> 
			      		<td align="center" >
			        		<button type="button" onclick="submitMovie();">${mode=='update'?'수정완료':'등록하기'}</button>
			        		<button type="reset" name="resetMovie">다시입력</button>
				 		</td>
			    	</tr>
			  </table>
	
</div>
