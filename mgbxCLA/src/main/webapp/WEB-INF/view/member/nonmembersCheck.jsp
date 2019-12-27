<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


<style>
.nomemberR {
font-size: 30px;
text-align: left;
width: 420px;
padding-top: 90px;
padding-bottom: 70px;

}

.easy-nonmember {
list-style: none;
width: 420px;

}

.notice{
list-style: none;

}

.reservation{
display: flex;
}

.reservationput{
padding-right: 50px;
width: 150px;
font-size: 16px;
margin-top: 5px;
}

.reservationput1{
width: 200px;
height: 28px;

}

.btn btn-outline-primary1{
padding-top: 20px;

}

.btn_wrap{
margin-top: 29px;
margin-bottom: 34px;
text-align: right;
}


</style>

<div class="body-container">
	<div class="nomemberR">${dto.userName}예매내역</div>
	
	

	<div style="border-top: 1px solid #e8e7e7; border-bottom: 1px solid #e8e7e7;">
		<div style="width: 420px; margin: 0 auto; padding-top: 40px; padding-bottom: 40px;">
			<table>		
				<tr>
					<td>번호</td>
					<td>영화</td>
					<td>영화제목</td>
					<td>번호</td>
					<td>번호</td>
				</tr>	
			</table>
			
			
		

		</div>
	</div>
</div>