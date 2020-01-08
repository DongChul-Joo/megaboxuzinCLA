<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>

.bookingForm{
border: 1px solid black;
width: 750px;
 height: 500px;
}


.leftDiv{
width: 45%; 
height: 100%;
float: left;
border-right: 1px solid black;
}

.scheduleList{
width: 100%;
height: 100%;
}
.schClass{
width: 100%;
height: 20%;
background: white;
border-bottom: 1px solid #cccccc;
} 
.timeJone{
width: 24%;
height: 100%;
float: left;
font-size: 15px;
padding-top:15px;
border-right: 1px solid #cccccc;
}
.movieJone{
width: 50%;
height: 100%;
float: left;
font-size: 25px;
font-weight: bold;
border-right: 1px solid #cccccc;
}
.branJone{
width: 26%;   
height: 100%;
float: left;
font-size: 10px;
text-align: right;
color: black;
}
.nonScheduleMessage{
width: 100%;
height: 50px;
text-align: center;
margin-top: 50px;
}
.cinemaLi{  
width: 41%;
height: 55px; 
margin-left: 17px;
margin-bottom: 15px;    
background: white;
border: 1px solid #198591; 
list-style: none;
float: left;
}

.cinemaLi button{  
width: 100%;
height: 100%;     
background: white;
border: none;
outline: none; 
}

.cinemaLi :focus { 
outline:none; 
}  

.movieLi{  
width: 23%;
height: 120px;
margin-left: 5px;
background: white;
border: 1px solid #198591;
list-style: none;
float: left;
margin-top: 25px;
}

.movieLi button{  
width: 100%;
height: 100%;     
background: white;
border: none;
outline: none; 
}

.movieLi :focus {   
outline:none; 
}    

.timeDiv{     
width:89%;     
height:30%;
display: inline-block; 
overflow: hidden;   
cursor: pointer;
position: relative;
top: -28px;
left: 20px;
border: 1px solid black;
}  
.dateDiv{     
width:90%;     
height:30%;
display: inline-block; 
overflow: hidden;   
cursor: pointer;
position: relative;
top: -28px;
left: 17px;
border: 1px solid black;
} 

.timeDiv li{
width: 33px;
display: inline-block;
height: 100%;
text-align: center;
padding: 0px 0px 0px 0px;
list-style: none;
float: left;
}

.dateDiv li{
width: 59px;
display: inline-block;
height: 100%;  
text-align: center;
padding: 0px 0px 0px 0px;
list-style: none;
float: left;
}

#branchCinemas ul{
height: 87%;
width: 20%;
float: left

}
#branchCinemas li{
list-style: none;
}
.selectBranchActive{
background-color: #198591;
color: white;
}

.addSelects{  
width: 41%;
height: 55px;  
margin-left: 17px;
margin-bottom: 15px;    
background: white;
border: 1px solid #198591;
list-style: none;
float: left;
}

.addSelectsM{  
width: 23%;
height: 120px;
margin-left: 5px;
background: white;
border: 1px solid #198591;
list-style: none;
float: left;
margin-top: 25px;
}

.addSelectsbutton{
width: 17px;
height: 18px;  
background: none;
border-left: 1px solid #198591;
border-bottom: 1px solid #198591;
border-top:none;
border-right:none;
outline: none; 
float: right;

}

.addSelects button:focus ,.addSelectsM button:focus { 
outline:none; 
}
.addSelectsbuttonM{
width: 17px;
height: 18px;  
background: white;
border-left: 1px solid #198591;
border-bottom: 1px solid #198591;
border-top:none;
border-right:none;
outline: none; 
float: right;

}

.selBranchAdd{
width:130px;
height: 30px;
text-overflow: ellipsis; 
overflow: hidden; 
white-space: nowrap; 
display: inline-block;
text-align: center;
}

.selMovieAdd {
width:100%;
height: 30px;
text-overflow: ellipsis; 
overflow: hidden; 
white-space: nowrap; 
display: inline-block;
text-align: center;
margin-top: 20px;
}

#areaListUL{
width: 20%;
height: 87%;


}
#areaListUL li{
width: 100%;
height: 12%;
text-align: center;
padding-top: 18px;
border: 1px solid #cccccc;
border-spacing: 0;
border-collapse: collapse;
border-top: none;
cursor: pointer;
font-weight: bold;
}

#branListUL{
width: 20%;
height: 87%;
overflow: scroll;
overflow-x:hidden
}
#branListUL li{
width: 100%;
height: 8%;
text-align: center;
cursor: pointer;
border-bottom:0.5px solid white;
padding-top: 5px;

}
#bookingMap{
width: 59%;
height:87%; 
float: left;
}

#branchSelectList span{

border: 1px solid #cccccc;
margin-left: 5px;
margin-top: 15px;
font-size: 16px;
font-weight: bold;
height: 45%;
width:20%;
text-overflow: ellipsis; 
overflow: hidden; 
white-space: nowrap; 
display: inline-block;
text-align: center;

}

#movieSelectList span{

border: 1px solid #cccccc;
margin-left: 5px;
margin-top: 15px;
font-size: 16px;
font-weight: bold;
height: 45%;
width:20%;
text-overflow: ellipsis; 
overflow: hidden; 
white-space: nowrap; 
display: inline-block;
text-align: center;

}
</style>

<script type="text/javascript">
var timePosition=0;
var datePosition=0;

var selBranchCount=0;
var selBranchCountEnd=0;

var selMovieCount=0;
var selMovieCountEnd=0;

function leftTime(){
	if(timePosition==0){
		return;
	}
	timePosition=timePosition+33;
	$(".timeDiv").find("ol").css("margin-left",timePosition+"px");
	
}  
  
function rightTime(){
	if(timePosition==-660){   
		return;
	}
	timePosition=timePosition-33;
	$(".timeDiv").find("ol").css("margin-left",timePosition+"px");
	
}

function leftDate(){
	if(datePosition==0){
		return;
	}
	datePosition=datePosition+59;
	$(".dateDiv").find("ul").css("margin-left",datePosition+"px");
	
}  
  
function rightDate(){
	if(datePosition==-531){   
		return;
	}
	datePosition=datePosition-59;
	$(".dateDiv").find("ul").css("margin-left",datePosition+"px");
	
}

function movieSerach(){
	$("#movieSelecter").dialog({
		modal: true,
		height:800,
		width:900,
		title: "영화목록",
		open:function(){
       	 $(this).parents(".ui-dialog:first").find(".ui-dialog-titlebar").remove();
        },
        buttons: {
            " 확인 " : function() {
            	var inMovie=$(".addSelectsM");
            	var movieSelectList=$("span[name=selectMovies]");
            	var movieLi=$(".movieLi");
            	
            	for(var z=0;z<4;z++){
           
                	if(z<selMovieCount){
                		var movieSelectList=$("span[name=selectMovies]");
                		$(inMovie[z]).css("background-image","none").css("background-size","none").find("span").html("");
                		inMovie[z].setAttribute("data-movieCode",movieSelectList[z].getAttribute("data-movieCode"));
                		inMovie[z].setAttribute("data-movieNm",movieSelectList[z].getAttribute("data-movieNm"));
                		inMovie[z].setAttribute("data-thumNail",movieSelectList[z].getAttribute("data-thumNail"));
                		
                		if(movieSelectList[z].getAttribute("data-thumNail")=="No images"){
                			$(inMovie[z]).find("span").html(movieSelectList[z].getAttribute("data-movieNm"));
                		}else{
                			$(inMovie[z]).css("background-image","url('"+movieSelectList[z].getAttribute("data-thumNail")+"')").css("background-size","cover");
                		}
                		
                		inMovie[z].style.display="";
                		
                		movieLi[z].style.display="none";
                	}else{
                		$(inMovie[z]).css("background-image","none").css("background-size","none").find("span").html("");
                		inMovie[z].style.display="none";
                		movieLi[z].style.display="";
                		inMovie[z].setAttribute("data-movieCode","");
                		inMovie[z].setAttribute("data-movieName","");
                	}
            	}
            	selMovieCountEnd=selMovieCount;
        
            	 $(this).dialog("close");
             },
             " 취소 " : function() {
            	 var inMovie=$(".addSelectsM");
	             
                 
            	 $("#movieSelectList").find("span").remove();
            	 $(".listOfMovie").css("background","").attr("data-select","");
            	 for(var z=0;z<selMovieCountEnd;z++){
           					 
	                var movieCode=inMovie[z].getAttribute("data-movieCode");
	                var movieNm=inMovie[z].getAttribute("data-movieNm");
	  				var thumNail=inMovie[z].getAttribute("data-thumNail");
	  				$(".listOfMovie[data-movieCode="+movieCode+"]").css("background","#198591").attr("data-select","select");
	                var selMovie="<span name='selectMovies' name='selectmovies' data-thumNail='"+thumNail+"' data-movieCode='"+movieCode+"' data-movieNm='"+movieNm+"'>"+movieNm+"</span>";
	            	
	            	$("#movieSelectList").append(selMovie);
                	}
            	 selMovieCount=selMovieCountEnd;
            	 $(this).dialog("close");
       		},
        },
		close: function(event, ui) {
			scheduleList();
		}
	});
}

$(function(){
	   var today = new Date();
	   var time=today.getHours();
	   var mi
	   today.setDate(today.getDate()-1);
	   
	   for(var i=0;i<14;i++){
	  		today.setDate(today.getDate()+1);
			var mm = today.getMonth()+1; 
	   		var yyyy = today.getFullYear();
	   		var dateDay=dateToString(today);
	   		if(i==0){
	   			var dateLi="<li data-dSelect='select' data-dSelect='select' data-day='"+dateDay+"' >오늘</li>"; 
	   		}else{
	   			var dateLi="<li data-dSelect='' data-day='"+dateDay+"' >"+mm+"월 "+today.getDate()+"일</li>"; 
	   		}
			
			$(".dateDiv").find("ul").append(dateLi);
		   }  
	   $(".dateDiv li[data-dSelect=select]").css("background","#198591").css("color","white");
	   if((time-10)>0){
		   if((time-10)>=15){
			    timePosition=20*-33;
		   }else{
		   		timePosition=(time-5)*-33;
		   }
	   		$(".timeDiv li[data-time='"+time+"']").attr("data-tSelect","select").css("background","#198591").css("color","white").closest("ol").css("margin-left",timePosition+"px");
	   }
	   
	   scheduleList();
});
	
$(document).on("click",".dateDiv li",function(){
	$(".dateDiv li").css("background","").css("color","").attr("data-dSelect","");
	$(this).css("background","#198591").css("color","white").attr("data-dSelect","select");
	scheduleList();
});

$(document).on("click",".timeDiv li",function(){
	$(".timeDiv li").css("background","").css("color","").attr("data-tSelect","");
	$(this).css("background","#198591").css("color","white").attr("data-tSelect","select");
	scheduleList();
	
});

function timeToString(hour,min) {
    var h = hour;
    if(h < 10) h='0'+h;
    var m = min;
    if(m < 10) m='0'+m;
    
    return h + ':' + m;
}

function scheduleList(){
	var query="";
	var today = new Date();
	var mi=today.getMinutes();
	var time=timeToString($(".timeDiv li[data-tSelect=select]").attr("data-time"),mi);
		query="time="+time;
	var date=$(".dateDiv li[data-dSelect=select]").attr("data-day");
		query+="&date="+date;
	var inMovie=$("#movieSelectList").find("span");   
		for(var im=0;im<inMovie.length;im++){
			query+="&movieCode="+inMovie[im].getAttribute("data-movieCode");
		}
		
	var inCinema=$("#branchSelectList").find("span");
		for(var ic=0;ic<inCinema.length;ic++){
			query+="&branCode="+inCinema[ic].getAttribute("data-branCode");
		}
	var type="get";
	var url="<%=cp%>/booking/scheduleList";
	
	var fn=function(data){
		$(".scheduleList").empty();
		if(data.length!=0){
			for(var i=0;i<data.length;i++){
				var tag="<div class='schClass' data-select='' data-scheduleCode='"+data[i].scheduleCode+"'>";
					tag+="<div class='timeJone'><strong>"+data[i].starttime+"</strong><span>~"+data[i].endTime+"</span></div>";
					tag+="<div class='movieJone'><p><span class='"+data[i].audits+"'>"+data[i].audits+"</span><span>"+data[i].movieNm+"</span></p>";
					if(data[i].showingKind==1){
						tag+="<p><span>2D<span><p></div>";
					}else{
						tag+="<p><span>3D<span><p></div>";
					}
					tag+="<div class='branJone'><p>"+data[i].branName+"</p><p>"+data[i].cmName+"</p><p>"+data[i].cmSeatTot+"</p></div></div>";
	
				$(".scheduleList").append(tag);
			}
		}else{
			
			var tag="<p class='nonScheduleMessage'>현재 상영중인 영화가 없습니다.</p>";
			
			$(".scheduleList").append(tag);
		}
	};
	
	ajaxJSON(url, type, query, fn);
    
}

$(document).on("click",".cinemaLi", function(){
   $("#branchCinemas").dialog({
      modal: true,
      height:600,
      width:900,
      title: "",
      open:function(){
     	 $(this).parents(".ui-dialog:first").find(".ui-dialog-titlebar").remove();
     	 listAreas("${areaList[0].parent}");
      },
      buttons: {
             " 확인 " : function() {
             	
             	var inCinema=$(".addSelects");
             	var cibtn=$(".cinemaLi");
             	for(var z=0;z<4;z++){
             		
	                	if(z<selBranchCount){
	                		var selCinema=$("span[name=selectbranchs]");
	                		inCinema[z].setAttribute("data-branCode",selCinema[z].getAttribute("data-branCode"));
	                		inCinema[z].setAttribute("data-branName",selCinema[z].getAttribute("data-branName"));
	                		inCinema[z].style.display="";
	                		$(inCinema[z]).find("span").html(selCinema[z].getAttribute("data-branName"));
	                		cibtn[z].style.display="none";
	                	}else{
	                		inCinema[z].style.display="none";
	                		cibtn[z].style.display="";
	                		inCinema[z].setAttribute("data-branCode","");
	                		inCinema[z].setAttribute("data-branName","");
	                	}
             	}
             	selBranchCountEnd=selBranchCount;
             	 $(this).dialog("close");
              },
              " 취소 " : function() {                	 
             	 var inCinema=$(".addSelects");
	              
	                 
             	 $("#branchSelectList").find("span").remove();
             	 $("#branListUL").find("li").attr("class",""); 
             	 for(var z=0;z<selBranchCountEnd;z++){
	           					 
		                var branCode=inCinema[z].getAttribute("data-branCode");
		                var branName=inCinema[z].getAttribute("data-branName");
		  
						
		                var selectBranchs="<span name='selectbranchs' data-branCode='"+branCode+"' data-branName='"+branName+"'>"+branName+"</span>";
		                		   
		                $("#branchSelectList").append(selectBranchs);
	                	}
             	 selBranchCount=selBranchCountEnd;
                   $(this).dialog("close");
              }     
        },
      close: function(event, ui) {
    	  scheduleList();
      }
       
   });
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

$(document).on("click", "#areaListUL li",function(){
	listAreas(this.getAttribute("data-parent"));
	
	$("#areaListUL li").css("background","white");
	
	$(this).css("background","#e5e5e5");
	
	
});
function listAreas(parent){
	   var type="get";
	   var query="parent="+parent;
	   var url="<%=cp%>/branchCla/list";
	   var fn=function (data){
	      $("#branListUL").find("li").remove();
	       
	      if(data.length>0){
	         for(var i=0;i<data.length;i++){
	            var lb="<li data-Addr='"+data[i].branAddr1+"' data-branCode='"+data[i].branCode+"' data-branName='"+data[i].branName+"' class=''>"+data[i].branName+"</li>";
	            
	              $("#branListUL").append(lb);  
	         }
	         
	         if(selBranchCount!=0){
	            var selectbranchs=document.getElementsByName("selectbranchs");
	            
	            var lis=$("#branListUL").find("li");
	            
	            for(var s=0;s<selBranchCount;s++){
	            	
	               for(ss=0;ss<lis.length;ss++){
	            	   
		               if(selectbranchs[s].getAttribute("data-branCode")==lis[ss].getAttribute("data-branCode")){
		                  lis[ss].setAttribute("class","selectBranchActive");
		                  }
	               	}
	            }
	         }
	         
	      }else{
	         var lb="<li>해당 지역에는 지점이 존재하지 않습니다.</li>";
	           $("#branListUL").append(lb);
	      }
	   }
	   ajaxJSON(url, type, query, fn);
	};

$(document).on("click", "#branListUL li", function() {
	   
	   var branCode=this.getAttribute('data-branCode');
	    var branName=this.getAttribute('data-branName');
	   
	   if(this.getAttribute('class')!=""){
	      $("#branchSelectList span[data-branCode="+branCode+"]").remove();
	      this.setAttribute("class","");
	      selBranchCount--;
	      return;
	   }
	   
	   if(selBranchCount==4){
	      alert("극장은 4개까지만 선택이 가능합니다.");
	      return;
	   }

	   
	    var selectBranchs="<span name='selectbranchs' data-branCode='"+branCode+"' data-branName='"+branName+"'>"+branName+"</span>";
	   
	    $("#branchSelectList").append(selectBranchs);
	    
	    this.setAttribute("class","selectBranchActive");
	    maps(this.getAttribute("data-Addr"),this.getAttribute("data-branName"));
	    selBranchCount++;
	});

$(document).on("click",".addSelectsbutton",function(){
	var idx=this.getAttribute("data-idx");
	var inCinema=$(".addSelects");
	var cibtn=$(".cinemaLi");

	
	$("span[data-branCode="+inCinema[idx].getAttribute("data-branCode")+"]").remove();
	$("#branListUL li[data-branCode="+inCinema[idx].getAttribute("data-branCode")+"]").attr("class","");   
	selBranchCount--;
	
	for(var z=0;z<4;z++){
		
    	if(z<selBranchCount){
    		var selCinema=$("span[name=selectbranchs]");
    		inCinema[z].setAttribute("data-branCode",selCinema[z].getAttribute("data-branCode"));
    		inCinema[z].setAttribute("data-branName",selCinema[z].getAttribute("data-branName"));
    		inCinema[z].style.display="";
    		$(inCinema[z]).find("span").html(selCinema[z].getAttribute("data-branName"));
    		cibtn[z].style.display="none";
    	}else{
    		inCinema[z].style.display="none";
    		cibtn[z].style.display="";
    		inCinema[z].setAttribute("data-branCode","");
    		inCinema[z].setAttribute("data-branName","");
    	}
	}
	selbranCountEnd=selbranCount;
	scheduleList();
});

$(document).on("click",".addSelectsbuttonM",function(){
	var idx=this.getAttribute("data-idx");
	var inMovie=$(".addSelectsM");
	var movieLi=$(".movieLi");

	
	$("#movieSelectList span[data-movieCode="+inMovie[idx].getAttribute("data-movieCode")+"]").remove();
	$(".listOfMovie[data-movieCode="+inMovie[idx].getAttribute("data-movieCode")+"]").css("background","");
	$(".listOfMovie[data-movieCode="+inMovie[idx].getAttribute("data-movieCode")+"]").attr("data-select","");
    
 
	selMovieCount--;
	
	for(var z=0;z<4;z++){
        
    	if(z<selMovieCount){
    		$(inMovie[z]).css("background-image","none").css("background-size","none").find("span").html("");
    		var movieSelectList=$("span[name=selectMovies]");
    		inMovie[z].setAttribute("data-movieCode",movieSelectList[z].getAttribute("data-movieCode"));
    		inMovie[z].setAttribute("data-movieNm",movieSelectList[z].getAttribute("data-movieNm"));

    		if(movieSelectList[z].getAttribute("data-thumNail")=="No images"){
    			$(inMovie[z]).find("span").html(movieSelectList[z].getAttribute("data-movieNm"));
    		}else{
    			$(inMovie[z]).css("background-image","url('"+movieSelectList[z].getAttribute("data-thumNail")+"')").css("background-size","cover");
    		}
    		
    		inMovie[z].style.display="";
    		
    		movieLi[z].style.display="none";
    	}else{
    		$(inMovie[z]).css("background-image","none").css("background-size","none").find("span").html("");
    		inMovie[z].style.display="none";
    		movieLi[z].style.display="";
    		inMovie[z].setAttribute("data-movieCode","");
    		inMovie[z].setAttribute("data-movieName","");
    	}
	}
	selMovieCountEnd=selMovieCount;
	scheduleList();
});

$(document).on("click",".listOfMovie",function(){
	var movieCode=this.getAttribute("data-movieCode");
	
	if(this.getAttribute("data-select")!=""){
		
		$("#movieSelectList span[data-movieCode="+movieCode+"]").remove();
		
		  this.style.background="";
		  
	      this.setAttribute("data-select","");
	      
	      selMovieCount--;
	      
	      return;
	}
	if(selMovieCount==4){
	      alert("영화는 4개까지만 선택이 가능합니다.");
	      return;
	   }
	
	var movieNm=this.getAttribute("data-movieNm");
	var thumNail=this.getAttribute("data-thumNail");
	
	var selMovie="<span name='selectMovies' name='selectmovies' data-thumNail='"+thumNail+"' data-movieCode='"+movieCode+"' data-movieNm='"+movieNm+"'>"+movieNm+"</span>";
	
	$("#movieSelectList").append(selMovie);
	
	this.style.background="#198591";
	
	this.setAttribute("data-select","select");
	
	selMovieCount++;
});
</script>
<div class="bookingForm">
	<div class="leftDiv">
		<div style="width: 100%; height: 15%;border-bottom: 1px solid black">
			<p style="font-weight: bold;">날짜</p> 
			 <div style="width:100%;border: none;display: inline-block;height: 30%">
				<span style="width: 5%;float:left;text-align: center">
					<a href="javascript:leftDate();">&lt;</a></span>
				
				<span style="width: 5%;float: right;text-align: center">
					<a href="javascript:rightDate();">&gt;</a></span>
			</div>
			<div class="dateDiv">
						<ul style="width:1054px;height: 100%;overflow: hidden;">
				
							
						</ul>    
				</div> 
		</div>
		<div style="width: 100%; height: 35%;border-bottom: 1px solid black">
			<p style="font-weight: bold;">극장</p>    
			<ul>
				 <li class="cinemaLi"><button type="button" >+</button></li>
				 <li class="addSelects" style="display: none;"><p><button class="addSelectsbutton" data-idx="0" type="button">x</button></p><span class="selBranchAdd">1</span></li>
				 
            	 <li class="cinemaLi"><button type="button" >+</button></li>
            	 <li class="addSelects" style="display: none;"><p><button class="addSelectsbutton" data-idx="1" type="button">x</button></p><span class="selBranchAdd">2</span></li>
            	 
           		 <li class="cinemaLi"><button type="button" >+</button></li>
           		 <li class="addSelects" style="display: none;"><p><button class="addSelectsbutton" data-idx="2" type="button">x</button></p><span class="selBranchAdd">3</span></li>
           		 
            	 <li class="cinemaLi"><button  type="button" >+</button></li>
				 <li class="addSelects" style="display: none;"><p><button class="addSelectsbutton" data-idx="3" type="button">x</button></p><span class="selBranchAdd">4</span></li>
			</ul>
		</div>
		<div style="width: 100%; height: 50%;">  
			<p style="font-weight: bold;">영화</p>
			<ul >
				 <li class="movieLi"><button class="movieButton" type="button" onclick="movieSerach();">+</button></li>
				 <li class="addSelectsM" style="display: none;"><p><button class="addSelectsbuttonM" data-idx="0" type="button">x</button>
				 		</p><span class="selMovieAdd"></span></li>
				 
            	 <li class="movieLi"><button class="movieButton" type="button" onclick="movieSerach();">+</button></li>
            	 <li class="addSelectsM" style="display: none;"><p><button class="addSelectsbuttonM" data-idx="1" type="button">x</button>
            			 </p><span class="selMovieAdd"></span></li>
            	 
           		 <li class="movieLi"><button class="movieButton" type="button" onclick="movieSerach();">+</button></li>
           		 <li class="addSelectsM" style="display: none;"><p><button class="addSelectsbuttonM" data-idx="2" type="button">x</button>
           		 		</p><span class="selMovieAdd"></span></li>
           		 
            	 <li class="movieLi"><button class="movieButton" type="button" onclick="movieSerach();">+</button></li>
				 <li class="addSelectsM" style="display: none;"><p><button class="addSelectsbuttonM" data-idx="3" type="button">x</button>
				 		</p><span class="selMovieAdd"></span></li>
			</ul>
		</div> 
	</div>    
	<div style="width: 55%;height: 100%;float: left">    
		<div style="width: 100%; height: 15%; border-bottom: 1px solid black">       
			<p style="font-weight: bold;">시간</p> 
			 <div style="width:100%;border: none;display: inline-block;height: 30%">
				<span style="width: 5%;float:left;text-align: center">
					<a href="javascript:leftTime();">&lt;</a></span>
				
				<span style="width: 5%;float: right;text-align: center">
					<a href="javascript:rightTime();">&gt;</a></span>
			</div>
			<div class="timeDiv">
						<ol style="width:1054px;height: 100%;overflow: hidden;">
							<c:forEach var="vv" begin="0" end="30">
								<li data-tSelect="" data-time="${vv}">${vv}</li>
							</c:forEach>
						</ol>    
			</div> 
		</div>
		<div style="width: 100%; height: 85%;">
			<p style="font-weight: bold;border-bottom: 1px solid black">상영목록<p>
			<div class="scheduleList"></div>
			</div>
	</div>
	
	<div id="movieSelecter" style="display: none;width: 900px;height: 800px;overflow:none;">
		<div id="movieSelectList" style="width: 100%; height: 8%;border-bottom: 1px solid #cccccc;border-top: 1px solid #cccccc"></div>
		 <div style="width: 100%;height: 90%;overflow: scroll;overflow-x:hidden">
		 <c:forEach var="vo" items="${movieList}">
			      <div class="listOfMovie" data-select="" data-movieCode="${vo.movieCode}" data-movieNm="${vo.movieNm}" data-thumNail="${vo.thumbNail}" style="height: 300px; width: 180px; float: left; 
			      cursor: pointer;margin-left: 2px;margin-top: 2px;">
			      	<div style="width: 95%;height: 95%;margin: auto;margin-top: 7px;background-color: white;">
				      <div style="height: 78%; border: none; width: 100%;">
				      	<c:choose>
					      	<c:when test="${vo.thumbNail != 'No images'}">
					      		<img src="${vo.thumbNail}" width="100%;" height="100%">
					      	</c:when>
				      		<c:otherwise>
				      			<div style="width: 95%;height: 70%; text-align: center;">
				      				<p style="height: 150px; font-size: 25px;padding-top: 50px;">이미지가<br> 없습니다.</p>
				      			</div>
				      		</c:otherwise>
				      	</c:choose>
				   	  </div>
				   	  
				   	  <div style="height: 10%; border: 1px solid #e4e4e4; background-color: white; ">
					   	 <span style="float:left; font-size: 11pt;">평점 : 9.5</span>
					   	 <span style="float:right; margin-right:5px; font-size: 11pt;">★★★★☆</span>
				   	  </div>
				   	  
				      <div style="height: 12%; border: 1px solid #e4e4e4;background-color: white;">
				      		<div class="ccc" style="height: 100% ;width: 100%">
				      			<c:choose>
				      				<c:when test="${vo.audits == '전체'}">
				      					<div  style="padding:0px 3px 0px 3px;margin-top:5px; color: white; width: 20%; font-size:10px; height:65%;text
				      						text-align:center; border-style: solid; border-width: 1px; border-color: green; border-radius: 5px; background: green;float: left; ">${vo.audits}</div>
				      				</c:when>
				      				<c:when test="${vo.audits == '12'}">
				      					<div  style="padding:0px 3px 0px 3px;margin-top:5px;font-size: 10pt; color: white;  width: 20%; height:65%;
				      						text-align:center;  border-style: solid; border-width: 1px; border-color: green; border-radius: 5px; background-color: #3DB7CC; float: left;">${vo.audits}</div>
				      				</c:when>
				      				<c:when test="${vo.audits == '15'}">
				      					<div  style="padding:0px 3px 0px 3px;margin-top:5px;font-size: 10pt; color: white; width: 20%; height:65%;
				      						text-align:center;  border-style: solid; border-width: 1px; border-color: green; border-radius: 5px; background: orange;float: left;">${vo.audits}</div>
				      				</c:when>
				      				<c:otherwise>
				      					<div  style="padding:0px 3px 0px 3px;margin-top:5px;font-size: 10pt; color: white; width: 20%; height:65%;
				      						text-align:center;  border-style: solid; border-width: 1px; border-color: green; border-radius: 5px;background: red;float: left; ">${vo.audits}</div>
				      				</c:otherwise>
				      			</c:choose>   
				      			<div  style="margin-top:9px;margin-left:10px;font-weight: bold; font-size: 12px; width: 65%;  text-overflow: ellipsis; overflow: hidden; white-space: nowrap; display: inline-block;float: left;">${vo.movieNm}</div>
				      		</div>
				      </div>
			      </div>
			      </div>
			    </c:forEach>
			    </div>
	</div>
	  
</div>   
 
<div id="branchCinemas" style="display: none;width: 900px;height: 600px;overflow:none;">
   <div id="branchSelectList" style="width: 100%;height: 12%;border-bottom: 1px solid #cccccc;border-top: 1px solid #cccccc"></div>
   <ul id="areaListUL">
      <c:forEach var="vo" items="${areaList}">
         <li data-parent="${vo.parent}"><span>${vo.areaName}</span></li>
      </c:forEach>
   </ul>
   <ul id="branListUL">
   </ul>
   <div id="bookingMap"></div>
</div>
<div id="bookingSeat">
</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=04e4431a8f42ef7f22f5a23dfe0e8324&libraries=servicesappkey=APIKEY&libraries=services"></script>
	<script>
function maps(addr,bn){
		
	var addr1=addr;
	var branName=bn;
		var mapContainer = document.getElementById('bookingMap'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(addr1, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+branName+'</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	    
	    
	});    
	}
	</script>