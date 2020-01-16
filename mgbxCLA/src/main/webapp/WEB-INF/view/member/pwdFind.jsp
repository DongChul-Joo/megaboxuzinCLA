<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
.lbl {
   position:absolute; 
   margin-left:15px; margin-top: 17px;
   color: #999999; font-size: 11pt;
}
.loginTF {
  width: 360px; height: 50px;
  padding: 5px;
  padding-left: 15px;
  border:1px solid #999999;
  color:#333333;
  margin-top:5px; margin-bottom:5px;
  font-size:14px;
  border-radius:4px;
}
.container {
background-color: #f9f9f9;
}

.container {
background-color: #f9f9f9;
}

.body-container{
margin-top: 130px;

}

</style>
<script type="text/javascript">
	function bgLabel(ob, id) {
	    if(!ob.value) {
		    document.getElementById(id).style.display="";
	    } else {
		    document.getElementById(id).style.display="none";
	    }
	}

	function sendOk() {
        var f = document.pwdFindForm;

        var str = f.userId.value;
        if(!str) {
            alert("아이디를 입력하세요. ");
            f.userId.focus();
            return;
        }

        f.action = "<%=cp%>/member/pwdFind";
        f.submit();
	}
</script>

<div class="body-container">
    <div style="width:500px; margin: 0px auto;border: 1px solid #e4e4e4;">
	
    	<div style="text-align: center;">
        	<span style="font-weight: bold; font-size:27px; color: #424951;"></span>
        </div>
	
		<form name="pwdFindForm" method="post" action="">
		  <table style="width:100%; margin: 20px auto; padding:30px;  border-collapse: collapse; background-color:#f9f9f9; height: 500px;">
		  <tr style="height:50px;"> 
		      <td style="text-align: center; padding-top: 20px;">
		       <p style="font-size: 30px; font-weight: 600;">비밀번호 찾기</p>
		          회원 아이디를 입력 하세요.
		      </td>
		  </tr>

		  <tr align="center" height="60"> 
		      <td>
		        &nbsp;
		        <label for="userId" id="lblUserId" class="lbl" >아이디</label>
		        <input type="text" name="userId" id="userId" class="loginTF" maxlength="20" 
		                   tabindex="2"
                           onfocus="document.getElementById('lblUserId').style.display='none';"
                           onblur="bgLabel(this, 'lblUserId');">
		        &nbsp;
		      </td>
		  </tr>
		  <tr align="center" height="65" > 
		      <td>
		        &nbsp;
		        <button type="button" onclick="sendOk();" class="btnConfirm">확인</button>
		        &nbsp;
		      </td>
		  </tr>
		  <tr align="center" height="10" > 
		      <td>&nbsp;</td>
		  </tr>
	    </table>
		</form>
		           
	    <table style="width:100%; margin: 10px auto 0; border-collapse: collapse;">
		  <tr align="center" height="30" >
		    	<td><span style="color: blue;">${message}</span></td>
		  </tr>
		</table>
	</div>
</div>