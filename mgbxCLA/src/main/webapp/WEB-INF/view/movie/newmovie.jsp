<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">


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



function showMovieDetail(movieCode){
	var url ="<%=cp%>/movie/movieDetail";
	var query ="movieCode="+movieCode; 
	var selector = "#showDetail";
	var type="get";
	
	$("#showDetail").empty();
	ajaxHTML(url, type, query, selector);
	detailMovie(movieCode);
    			
    			$("#showDetail").dialog({
					modal: true,
					height:2000,
					width:1000,
					title: "영화 상세", 				
					close: function(event, ui) {
					}
				});
}

function detailMovie(movieCd){
	var url="<%=cp%>/movie/showDetail";
	var query="movieCode="+movieCd;
	    
	
	      jQuery.ajax({
	         type:"get"
	         ,url:url
	         ,data:query
	         ,dataType:"json"
	         ,success:function(data){
	            console.log(data);
	            
	            showTime="";
				movieOpen="";
				country="";
				prdtYear="";
	            movieNm="";
			
	            movieNm= data.movieInfoResult.movieInfo.movieNm;
				country = data.movieInfoResult.movieInfo.nations[0].nationNm
	        	
	        	var director="";
	        	if(data.movieInfoResult.movieInfo.directors.length > 0){
		        	for(var i=0; i<data.movieInfoResult.movieInfo.directors.length; i++){
		            	director +=data.movieInfoResult.movieInfo.directors[i].peopleNm+"/";
		        	}
		            	
		        	jQuery("input[name=moviedirector]").val(director);
	        	} else {
	        		jQuery("input[name=moviedirector]").val("unknown");
	        	}
	        	
	        	var showType="";
	        	if(data.movieInfoResult.movieInfo.showTypes.length> 0){
		            for(var i=0; i<data.movieInfoResult.movieInfo.showTypes.length; i++){
		            	showType += data.movieInfoResult.movieInfo.showTypes[i].showTypeGroupNm+"("
		        	  		+data.movieInfoResult.movieInfo.showTypes[i].showTypeNm+")/\n";
		            }
		           		 jQuery("textarea[name=showing]").val(showType);
		            
	        	} else {
	        		jQuery("textarea[name=showing]").val("unknown");
	        	}
	        	
	            var limit="";
	            if(data.movieInfoResult.movieInfo.audits.length > 0){
		            for(var i=0; i<data.movieInfoResult.movieInfo.audits.length; i++){
		        		limit =data.movieInfoResult.movieInfo.audits[0].watchGradeNm;
		            }
		            jQuery("input[name=audits]").val(limit);
	            } else {
	            	jQuery("input[name=movieLimit]").val("unknown");
	            }
		            
	        	
	            var actors="";
	        	for(var i=0; i<data.movieInfoResult.movieInfo.actors.length; i++){
	        	  	actors += data.movieInfoResult.movieInfo.actors[i].peopleNm+"/";
	        	  
	            }
	            
	        	var production="";
	        	if(data.movieInfoResult.movieInfo.companys.length >0 ){
		        	for(var i=0; i<data.movieInfoResult.movieInfo.companys.length; i++){
		        		production += data.movieInfoResult.movieInfo.companys[0].companyNm+"/";
		            }
		        	 
		        	jQuery("input[name=production]").val(production);
	        	} else {
		        	jQuery("input[name=production]").val("unknown");

	        	}
				
	        	var prdtYear="";
	        	
	        	prdtYear = data.movieInfoResult.movieInfo.prdtYear;
	        	 	
			    jQuery("input[name=mcreated]").val(prdtYear);
	           
	            
	            var genre="";
	            if(data.movieInfoResult.movieInfo.genres.length > 0){
		            for(var i=0; i<data.movieInfoResult.movieInfo.genres.length; i++){
		            	genre +=data.movieInfoResult.movieInfo.genres[i].genreNm+"/" ;
		            }
		            jQuery("input[name=genre]").val(genre);
	            } else {
	            	jQuery("input[name=genre]").val("unknown");
	            }
	            
	            if(data.movieInfoResult.movieInfo.showTm > 0){
		            showTime= data.movieInfoResult.movieInfo.showTm+"분";
	            	
		            jQuery("input[name=mtime]").val(showTime);
	            } else {
	            	jQuery("input[name=mtime]").val("unknown");
	            }
	          	
	            
	            
	            if(data.movieInfoResult.movieInfo.openDt >0){
	            	movieOpen = data.movieInfoResult.movieInfo.openDt   
	            	
	            	jQuery("input[name=openDate]").val(movieOpen);
	            } else {
	            	jQuery("input[name=openDate]").val("unknown");
	            }
				
		        jQuery("input[name=movieCode]").val(movieCd);
		        jQuery("input[name=movieNm]").val(movieNm);
		        jQuery("textarea[name=actor]").val(actors);
		        jQuery("input[name=country]").val(country);
		       
	         }
	         ,error:function(e){
	            console.log(e.responseText);
	        
	         }
	   });
}
</script>


<style>
	*{margin:0;padding:0;}
	
	
	.moviemenu{
	margin-left: 100px;
	float: left;
	}
	
	.sub_navi{
	background-color : #f2f2f2;
	border-top: 1px solid #e1e1e1;
	border-bottom: 3px solid #503396;
	height: 60px;
	width: 100%
	
	}
	.sub_navi_wrap{
	width: 60%;
	padding-top: 15px;
	margin: auto;
	height: 55px;
	
	}

  
    .bbb {
    border: none;
    height: 40px;
    width: 90px;
    }

	
	.ccc{
	
	text-align: center;
	margin-top: 10px;
	
	
	}
	
	.ddd {
		margin-top: 15px;
		margin-bottom: 10px;
	}
	
	.a1 {
		display: inline-block;
	}
li{
list-style: none;}


</style>
	<div class="sub_navi">
			<div class="sub_navi_wrap">
			 	<ul style="margin: 0px auto;">
				 	<li class="moviemenu">
				 		<a style="border: none; font-size: 18px; float: left;" href="<%=cp%>/movie/newmovie">최신 개봉작</a>
				 	 </li>
					 <li class="moviemenu">
				 		<a style="border: none; font-size: 18px; float: left;" href="<%=cp%>/movie/newmovie">상영 예정작</a>
				 	 </li>
				 	<li class="moviemenu">
				 		<a  style="border: none; font-size: 18px; float: left;">영화제</a>
				 	 </li>
				 	<li class="moviemenu">
				 		<a style="border: none; font-size: 18px; float: left;" href="<%=cp%>/movie/newmovie">예매</a>
				 	 </li>
				 </ul>
			 </div>
		</div>	

	
	<div style="width: 90%;margin: 0 auto; min-height: 1800px;">
		
		<ul>
			<li style="margin-left: 50px;">
			
			    <c:forEach var="vo" items="${list}">
			      <div class="a1" style="height: 420px; width: 230px; float: left; margin-top: 100px; padding-right: 245px">
				      <div style="height: 336px; border: none; width: 230px;">
				      	<c:choose>
					      	<c:when test="${vo.thumbNail != 'No images'}">
					      		<img src="${vo.thumbNail}" width="230px;" height="336px;">
					      	</c:when>
				      		<c:otherwise>
				      			<div style="width: 230px; height: 336px; text-align: center;">
				      				<p style="height: 150px; font-size: 30px; padding-top: 130px;">이미지가 없습니다.</p>
				      			</div>
				      		</c:otherwise>
				      	</c:choose>
				   	  </div>
				   	  
				   	  <div style="height: 51px; width: 230px; border: 1px solid #e4e4e4; background-color: white; ">
					   	 <span style="float:left; font-size: 15pt;">평점 : 9.5</span>
					   	 <span style="float:right; margin-right:5px; font-size: 15pt;">★★★★☆</span>
				   	  </div>
				   	  
				      	<div style=" height: 110px; border: 1px solid #e4e4e4; width: 230px; background-color: white;">
				      		<div class="ccc">
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
				      			<p class="ddd" style="margin-left: 5px; font-weight: bold; font-size: 15pt; width: 70%; float: left; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; display: inline-block;">${vo.movieNm}</p>
				      			<button type="button" name ="movieDetail" class="btn btn-outline-primary1" onclick="showMovieDetail('${vo.movieCode}')">상세정보</button>
				      			<button type="button" class="btn btn-outline-primary1">예매하기</button>
				      		</div>
				      </div>
			      </div>
			    </c:forEach>
			    
			</li>
		</ul>
		
	</div>	

	<div id="showDetail" style="display: none;width: 1000px;"></div>
	
	