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

#listAreas li,#listBranchs li{
color: white;
font-size: 18px;
height: 45px;
float: left;
line-height:45px;
text-decoration: none;
margin: 0;
padding: 0;
list-style: none;
display:inline-block;
float: left;
cursor: pointer;
}
#listAreas li:hover,#listBranchs li:hover{
font-weight: bold;
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
border-bottom: 1px solid #d8d8d82b;
border-top: 1px solid #d8d8d82b;
height: 45px;
}

#listAreas ul{
width: 45%;
margin: 0 auto;
}

#listBranchs{
height: 100px; 
}

#listBranchs ul{
width: 45%;
margin: 0 auto;
}


.listTObranch{
height: 500px;
width: 100%;
background-size:cover;
}

.barContent{
background-color: rgba(0, 0, 0, 0.2);
width: 100%;
padding-top: 473px;
}

.main_top {
background-image: url("<%=cp%>/resource/images/movie1.jpg") ;
width: 100%;
height: 620px;
background-size: 100% 100%;
}

.floatch {
list-style: none;
width:100%;
border: 1px solid #e4e4e4;
height: 50px;
margin-bottom: 5px;
font-size: 20px;
font-weight: bold;
padding: 10px 40px;
}

.floatch strong {
float: left;
}

.floatch p {
font-size: 13px;
margin: 6px 90px;
}

.cmdquf {
padding: 15px;
border-bottom: 1px solid #e4e4e4;
}


.wnth {
padding-left: 20px;
}

.branSchdule{
width: 100%;
}

.branSchdule table{
width: 100%;
text-align: center;
border-spacing: 0;
border-collapse: collapse;
}

.bsTrClass{
width: 100%;
height: 65px;
border: 1px solid #cccccc;
}

.bsTd{
width: 20%;
height: 100%;
border-right: 1px solid #cccccc;
font-weight: bold;
background:#f9f9f9;
}
.bsLastTd{
width: 60%;
height: 100%;
}
.bsLastTd span{
width:70px;
float: left;
cursor: pointer;

}
.bsLastTd span:hover{
background: purple;
color: white;
font-weight: bold ;
}
</style>
<script type="text/javascript">

$(document).on("click",".bsLastTd span",function(){
	bookingForm();
});

$(document).on("click","#listAreas li",function(){
	var parent=$(this).attr("data-parent");
	$("#listAreas li").css("font-weight","");
	$(this).css("font-weight","bold");
	listArea(parent);

});

$(document).on("click","#listBranchs li",function(){
	var branCode=$(this).attr("data-branCode");
	$("#listBranchs li").css("font-weight","");
	$(this).css("font-weight","bold");
	readBranch(branCode);
});

$(function(){
	listArea("${areaList[0].parent}");
	readBranch("${branchList[0].branCode}");

    $("#listAreas li[data-parent=${areaList.get(0).parent}]").css("font-weight","bold");
    $("#listBranchs li[data-branCode=${branchList[0].branCode}]").css("font-weight","bold");
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


function ajaxHTML(url, type, query, selector,fn) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			$(selector).html(data);
			fn();
		}
		
	});
}

function imgChange(){
	var imgId=document.getElementById("branImgArea");
	var imgUrl=imgId.getAttribute("data-img");
	$(".main_top").css("background-image",imgUrl);
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
		  			lb="<li data-branCode='"+data[i].branCode+"'>&nbsp;&nbsp;"+data[i].branName+"&nbsp;&nbsp;|</li>";
				}else{
					lb="<li data-branCode='"+data[i].branCode+"'>&nbsp;&nbsp;"+data[i].branName+"&nbsp;&nbsp;</li>";
				}
		  		$("#listBranchs").find("ul").append(lb);  
			}
		}else{
			var lb="<li>해당 지역에는 지점이 존재하지 않습니다.</li>";
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
	
	var fn=function(){ 
		imgChange();
		maps($("#branMap").attr("data-addr"),$("#branMap").attr("data-branName"),'branMap');
	};
	ajaxHTML(url, type, query, selector,fn);
	
}

function openSearch(){
	
	window.open("https://map.kakao.com/","길찾기");
}
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=04e4431a8f42ef7f22f5a23dfe0e8324&libraries=servicesappkey=APIKEY&libraries=services"></script>
<div style="margin-bottom: 10px;margin-top: 10px;"></div>  
<div class="main_top">
<div class="listTObranch">  
			<div class="barContent">
			
				<div id="listAreas">
					<ul>
					<c:forEach var="vo" items="${areaList}">
						<li data-parent="${vo.parent}">&nbsp;&nbsp;${vo.areaName}&nbsp;&nbsp;&nbsp;</li>
					</c:forEach>
					</ul>
				</div>
				
				<div id="listBranchs">
					<ul>
					</ul> 
				</div>
			</div>
		</div>

</div>

<div class="body-container"> 
	<div style="width: 100%; margin: 0px auto;">	
	
			
				
		<div id="articleBranch" >
			
		</div>
		
	
		
		
	</div>
</div>
