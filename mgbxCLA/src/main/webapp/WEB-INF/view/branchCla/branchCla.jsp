<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>

.body-container div{
width:100%;
clear: both;
display: inline-block;
}

#listAreas a,#listBranchs a{
color: white;
font-size: 18px;
font-weight: bold;
height: 45px;
float: left;
line-height:45px;
text-decoration: none;
margin: 0;
padding: 0;
}
#listBranchs a{
font-size: 15px;
}

#listAreas,#listBranchs{
width: 100%;
margin: 0px auto;
}
#listAreas ul,#listBranchs ul{
clear: both;  
margin: 0;
margin-left:40px;
padding: 0;
}

#listAreas{
border-bottom: 2px solid #b5b5b5;
border-top: 2px solid #b5b5b5;
height: 45px;
}

#listBranchs{
height: 200px; 
}

#listAreas li,#listBranchs li{
list-style: none;
display:inline-block;
float: left;
}

.listTObranch{
height: 400px;
background-image: url("<%=cp%>/resource/images/megaBranchBar.png");
background-size:cover;
}

.barContent{
background-color: rgba( 000, 000, 000, 0.8 );
margin-top: 70px;
width: 100%;
}
</style>
<script type="text/javascript">

$(function(){
	listArea("${areaList[0].parent}");
	var type="get";
	var query="branCode=${branchList[0].branCode}";
	var url="<%=cp%>/branchCla/article";
	var selector="#articleBranch";
	
	ajaxHTML(url, type, query, selector);
});

function ajaxJSON(url, type, query, fn) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			fn(data);
		}
	});
}


function ajaxHTML(url, type, query, selector) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			$(selector).html(data);
		}
		
	});
}



function listArea(parent){
	var type="get";
	var query="parent="+parent;
	var url="<%=cp%>/branchCla/list";
	var fn=function (data){
		$("#listBranchs").find("li").remove();
		 
		if(data.length>0){
			for(var i=0;i<data.length;i++){
				var lb="";
				if(i!=(data.length-1)){
		  			lb="<li><a href='javascript:readBranch(\""+data[i].branCode+"\")'>&nbsp;&nbsp;"+data[i].branName+"&nbsp;&nbsp;|</a></li>";
				}else{
					lb="<li><a href='javascript:readBranch(\""+data[i].branCode+"\")'>&nbsp;&nbsp;"+data[i].branName+"&nbsp;&nbsp;</a></li>";
				}
		  		$("#listBranchs").find("ul").append(lb);  
			}
		}else{
			var lb="<li><a>해당 지역에는 지점이 존재하지 않습니다.</a></li>";
	  		$("#listBranchs").find("ul").append(lb);
		}
		
	};
	
	ajaxJSON(url, type, query, fn);
	
}

function readBranch(branCode){
	var type="get";
	var query="branCode="+branCode;
	var url="<%=cp%>/branchCla/article";
	var selector="#articleBranch";
	
	$("#articleBranch").empty();
	
	ajaxHTML(url, type, query, selector);
	 
}
</script>

<div style="border-top: 3px solid #503396;;margin-bottom: 10px;margin-top: 10px;"></div>  

<div class="body-container" style="padding-left: 80px" > 
	<div style="width: 850px; margin: 0px auto;">
		<div class="listTObranch">  
			<div class="barContent">
			
				<div id="listAreas">
					<ul>
					<c:forEach var="vo" items="${areaList}">
						<li><a href="javascript:listArea('${vo.parent}')">&nbsp;&nbsp;${vo.areaName}&nbsp;&nbsp;&nbsp;</a></li>
					</c:forEach>
					</ul>
				</div>
				
				<div id="listBranchs">
					<ul>
					</ul> 
				</div>
			</div>
		</div>
		<h3>==============================CINEMA===========================</h3>  
		<div id="articleBranch" >
		</div>
	</div>
	<button type="button" onclick="javascript:location.href='<%=cp%>/booking/booking'">예매</button>
</div>
