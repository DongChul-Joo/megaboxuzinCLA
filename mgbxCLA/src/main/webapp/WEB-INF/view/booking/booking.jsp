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

.bookingForm div{
border: 1px solid black;
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
width:376px;     
height:30%;
display: inline-block; 
overflow: hidden;   
cursor: pointer;
position: relative;
top: -28px;
left: 17px;
}  


.timeDiv li{
width: 34px;
display: inline-block;
height: 100%;  
text-align: center;
padding: 0px 0px 0px 0px;
list-style: none;
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

.addSelects button :focus { 
outline:none; 
}
.addSelectsbuttonM{
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

.selBranchAdd{
width:130px;
height: 30px;
text-overflow: ellipsis; 
overflow: hidden; 
white-space: nowrap; 
display: inline-block;
text-align: center;
}  
</style>

<script type="text/javascript">
var timePosition=0;


var selBranchCount=0;
var selBranchCountEnd=0;

var selMovieCount=0;
var selMovieCountEnd=0;

function leftTime(){
	if(timePosition==0){
		return;
	}
	timePosition=timePosition+34;
	$(".timeDiv").find("ol").css("margin-left",timePosition+"px");
	
}  
  
function rightTime(){
	if(timePosition==-680){   
		return;
	}
	timePosition=timePosition-34;
	$(".timeDiv").find("ol").css("margin-left",timePosition+"px");
	
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
                		inMovie[z].setAttribute("data-movieCode",movieSelectList[z].getAttribute("data-movieCode"));
                		inMovie[z].setAttribute("data-movieNm",movieSelectList[z].getAttribute("data-movieNm"));
                		
                		if(movieSelectList[z].getAttribute("data-thumNail")=="No images"){
                			$(inMovie[z]).find("span").html(movieSelectList[z].getAttribute("data-movieNm"));
                		}else{
                			$(inMovie[z]).css("bacground-image","url('"+movieSelectList[z].getAttribute("data-movieNm")+"')");
                			$(inMovie[z]).css("bacground-size","cover");
                		}
                		
                		inMovie[z].style.display="";
                		
                		movieLi[z].style.display="none";
                	}else{
                		inMovie[z].style.display="none";
                		movieLi[z].style.display="";
                		inMovie[z].setAttribute("data-branCode","");
                		inMovie[z].setAttribute("data-branName","");
                	}
            	}
            	selMovieCountEnd=selMovieCount;
            	
            	 $(this).dialog("close");
             },
             " 취소 " : function() {                	 
            	 $(this).dialog("close");
       		},
        },
		close: function(event, ui) {
			
		}
	});
}

$(function(){
	   
	   $(".cinemaLi").on("click", function(){
	      $("#branchCinemas").dialog({
	         modal: true,
	         height:600,
	         width:900,
	         title: "영화관 선택",
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
			  
							
			                var selectBranchs="<span name='selectbranchs' data-branCode='"+branCode+"' data-branName='"+branName+"'>"+branName+"<a>X</a></span>";
			                		   
			                $("#branchSelectList").append(selectBranchs);
		                	}
	                	 selBranchCount=selBranchCountEnd;
	                      $(this).dialog("close");
	                 }     
	           },
	         close: function(event, ui) {
	  
	         }
	         
	      });
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


function listAreas(parent){
	   var type="get";
	   var query="parent="+parent;
	   var url="<%=cp%>/branchCla/list";
	   var fn=function (data){
	      $("#branListUL").find("li").remove();
	       
	      if(data.length>0){
	         for(var i=0;i<data.length;i++){
	            var lb="<li data-branCode='"+data[i].branCode+"' data-branName='"+data[i].branName+"' class=''>"+data[i].branName+"</li>";
	            
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

	   
	    var selectBranchs="<span name='selectbranchs' data-branCode='"+branCode+"' data-branName='"+branName+"'>"+branName+"<a>X</a></span>";
	   
	    $("#branchSelectList").append(selectBranchs);
	    
	    this.setAttribute("class","selectBranchActive");
	    
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
	
	var selMovie="<span name='selectMovies' name='selectmovies' data-thumNail='"+thumNail+"' data-movieCode='"+movieCode+"' data-movieNm='"+movieNm+"'>"+movieNm+"<a>X</a></span>";
	
	$("#movieSelectList").append(selMovie);
	
	this.style.background="#198591";
	
	this.setAttribute("data-select","select");
	
	selMovieCount++;
});
</script>
<div class="bookingForm">
	<div style="width: 45%; height: 100%;float: left;">
		<div style="width: 100%; height: 15%;">날짜</div>
		<div style="width: 100%; height: 35%;">
			<p>극장</p>    
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
			<p>영화</p>
			<ul >
				 <li class="movieLi"><button class="movieButton" type="button" onclick="movieSerach();">+</button></li>
				 <li class="addSelectsM" style="display: none;"><p><button class="addSelectsbuttonM" data-idx="0" type="button">x</button>
				 		</p><span class="selMovieAdd">1</span></li>
				 
            	 <li class="movieLi"><button class="movieButton" type="button" onclick="movieSerach();">+</button></li>
            	 <li class="addSelectsM" style="display: none;"><p><button class="addSelectsbuttonM" data-idx="1" type="button">x</button>
            			 </p><span class="selMovieAdd">2</span></li>
            	 
           		 <li class="movieLi"><button class="movieButton" type="button" onclick="movieSerach();">+</button></li>
           		 <li class="addSelectsM" style="display: none;"><p><button class="addSelectsbuttonM" data-idx="2" type="button">x</button>
           		 		</p><span class="selMovieAdd">3</span></li>
           		 
            	 <li class="movieLi"><button class="movieButton" type="button" onclick="movieSerach();">+</button></li>
				 <li class="addSelectsM" style="display: none;"><p><button class="addSelectsbuttonM" data-idx="3" type="button">x</button>
				 		</p><span class="selMovieAdd">4</span></li>
			</ul>
		</div> 
	</div>    
	<div style="width: 55%;height: 100%;float: left">    
		<div style="width: 100%; height: 15%; ">       
			<p>시간</p> 
			 <div style="width:100%;border: none;display: inline-block;height: 30%">
				<span style="width: 5%;float:left;text-align: center">
					<a href="javascript:leftTime();">&lt;</a></span>
				
				<span style="width: 5%;float: right;text-align: center">
					<a href="javascript:rightTime();">&gt;</a></span>
			</div>
			<div class="timeDiv">
						<ol style="width:1054px;height: 100%;overflow: hidden;">
							<c:forEach var="vv" begin="0" end="30">
								<li style="float: left">${vv}</li> 
							</c:forEach>
						</ol>    
			</div> 
		</div>
		<div style="width: 100%; height: 85%;">상영목록</div>
	</div>
	
	<div id="movieSelecter" style="display: none;width: 900px;height: 800px;">
		<div id="movieSelectList" style="width: 100%; height: 8%;border-bottom: 1px solid #cccccc;border-top: 1px solid #cccccc"></div>
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

<div id="branchCinemas" style="display: none;width: 900px;height: 600px;">
   <div id="branchSelectList" style="width: 100%;height: 12%;border-bottom: 1px solid #cccccc;border-top: 1px solid #cccccc"></div>
   <ul id="areaListUL">
      <c:forEach var="vo" items="${areaList}">
         <li><a href="javascript:listAreas('${vo.parent}')">${vo.areaName}</a></li>
      </c:forEach>
   </ul>
   <ul id="branListUL">
   </ul>
</div>
<div id="bookingSeat">
</div>
