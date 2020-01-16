<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="nonMemberIn">
				<p style="width: 35%;margin: 0px auto">비회원 로그인</p>
				<table>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<td>휴대폰</td>
						<td>
							<p style="margin-top: 1px; margin-bottom: 4px;">
					            <select  name="tel1" >
					                <option value="">선 택</option>
					                <option value="010">010</option>
					                <option value="011" >011</option>
					                <option value="016" >016</option>
					                <option value="017" >017</option>
					                <option value="018" >018</option>
					                <option value="019" >019</option>
					            </select>
					            -
					            <input type="text" name="tel2"  maxlength="4">
					            -
					            <input type="text" name="tel3"   maxlength="4">
				       		 </p>
			       	   </td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>
							<p style="margin-top: 1px; margin-bottom: 5px;">
					            <select name="selectEmailss" >
					                <option value="">선 택</option>
					                <option value="naver.com" >네이버 메일</option>
					                <option value="hanmail.net" >한 메일</option>
					                <option value="hotmail.com" >핫 메일</option>
					                <option value="gmail.com" >지 메일</option>
					                <option value="direct">직접입력</option>
					            </select>
					            <input type="text" name="email1"  size="13" maxlength="30" >
					            @ 
					            <input type="text" name="email2"  size="13" maxlength="30"  readonly="readonly">
				        	</p>
			        	</td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td>
							<input type="text" name="birth"  maxlength="10" 
			                       style="width: 95%;" placeholder="생년월일">
			            </td>
					</tr>
				</table>
			</div>
			<p class="offOn">
				<button style="border-radius:5px;float: right;width: 40px;height: 25px;background: white;border: 1px solid black;" type="button" onclick="blfReturn();" >취소</button>
				<button style="margin-right:2px;border-radius:5px;float: right;width: 40px;height: 25px;background: purple;border: 1px solid black;color: white" type="button" onclick="nmemInsert();" >확인</button>
			</p>