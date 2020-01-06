<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
	<div >
		
		<h3 style="font-weight: bold;">${dto.branName}</h3>
		
		<div style="height: 400px;background-image: url('http://localhost:9090/mgbxAD/branchImg/branch/${dto.imageFilename}');background-size: 100% 100%;">
		
			<div style="color: white;background-color: rgba( 000, 000, 000, 0.7 );height: 150px;margin-top: 250px">
				  <p style="font-size: 20px; margin-top: 20px;margin-left: 30px">우편번호 : ${dto.branZip}</p>
			      <p style="font-size: 20px;margin-left: 30px">주소 : ${dto.branAddr1} ${dto.branAddr2}</p> 
			</div>
		</div>
	
	</div>