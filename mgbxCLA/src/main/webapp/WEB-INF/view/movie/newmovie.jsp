<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">

jQuery(function(){
	   jQuery(".movieDetail").click(function(){
		  var url="<%=cp%>/movie/showingList";
	      var query=;
	      
	      jQuery.ajax({
	         type:"post"
	         ,url:url
	         ,data:query
	         ,dataType:"json"
	         ,success:function(data){
	            console.log(data);
	         // console.log(data.movieListResult.movieList[0].movieNm);
	         	jQuery("#movieList").empty(); 
	         	
	         	for(var i=0; i<data.movieListResult.movieList.length; i++){
	         		var tag;
	         		var movieTitle= data.movieListResult.movieList[i].movieNm;
	         		var movieCd= data.movieListResult.movieList[i].movieCd;
	         		tag="<tr style='height:35px;'><td><a href='javascript:detailMovie(\""+movieCd+"\");'>"+"영화제목 :"+movieTitle;
	         		
				for(var j=0; j<data.movieListResult.movieList[i].directors.length; j++){
	        	  		
		        	  	var director = data.movieListResult.movieList[i].directors[j].peopleNm;
		        	  	
		        	  	tag+="&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"+"| 감독 명 :"+director+"</a></td>";
	        	  	}
	        	  	
	        	  	tag+="</tr>">
	        	  		
	        	  	jQuery("#movieList").append(tag);
	          }
	         
	          
	         }
	         ,error:function(e){
	            console.log(e.responseText);
	         }
	      });
	      
	   });
	   
});  


</script>


<style>
	*{margin:0;padding:0;}
	
	
	.moviemenu{
	margin-left: 100px;
	float: left;
	}
	
	.sub_navi{
	backgroun-color : #f2f2f2;
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

	
		<div style="width: 90%;margin: 0 auto; height: 100px;">
			  <ul>
			     <li style="margin-left: 50px;">
			     
			     <c:forEach var="vo" items="listMovie">
			      <div class="a1" style="height: 420px; width: 230px; float: left; margin-top: 100px; padding-right: 245px">
				      <div style="height: 336px; border: none; width: 230px;">
				      	<img src="${vo.thumbNail}" width="230px;" height="336px;">
				   	  </div>
				   	  
				   	  <div style="height: 51px; width: 230px; border: 1px solid #e4e4e4; background-color: white; ">
					   	 <span style="float:left; font-size: 15pt;">평점 : 9.5</span>
					   	 <span style="float:right; margin-right:5px; font-size: 15pt;">★★★★☆</span>
				   	  </div>
				   	  
				      	<div style=" height: 110px; border: 1px solid #e4e4e4; width: 230px; background-color: white;">
				      		<div class="ccc">
				      			<p class="ddd" style="font-size: 15pt; width: 20%">${vo.audits}</p>
				      			<p class="ddd" style="font-size: 15pt; width: 80%">${vo.movieNm}</p>
				      			<button type="button" name ="movieDetail" class="btn btn-outline-primary1">상세정보</button>
				      			<button class="btn btn-outline-primary1">예매하기</button>
				      		</div>
				      </div>
			      </div>
			      </c:forEach>
			      
			      
			      
			      
			       <div class="a1" style="height: 420px; width: 230px; float: left; margin-top: 100px; padding-right: 245px">
				      <div style="height: 336px; border: none; width: 230px;">
				      	<img src="<%=cp%>/resource/images/eee2.jpg" width="230px;" height="336px;">
				   	  </div>
				   	  
				   	  <div style="height: 51px; width: 230px; border: 1px solid #e4e4e4; background-color: white; ">
					   	 <span style="float:left; font-size: 15pt;">평점 : 9.5</span>
					   	 <span style="float:right; margin-right:5px; font-size: 15pt;">★★★★☆</span>
				   	  </div>
				   	  
				      	<div style=" height: 110px; border: 1px solid #e4e4e4; width: 230px; background-color: white;">
				      		<div class="ccc">
				      			<p class="ddd" style="font-size: 15pt;">마센필라트2</p>
				      			<button class="btn btn-outline-primary1">상세정보</button>
				      			<button class="btn btn-outline-primary1">예매하기</button>
				      		</div>
				      </div>
			      </div>
			      
			       <div class="a1" style="height: 420px; width: 230px; float: left; margin-top: 100px; padding-right: 245px">
				      <div style="height: 336px; border: none; width: 230px;">
				      	<img src="<%=cp%>/resource/images/eee3.jpg" width="230px;" height="336px;">
				   	  </div>
				   	  
				   	  <div style="height: 51px; width: 230px; border: 1px solid #e4e4e4; background-color: white; ">
					   	 <span style="float:left; font-size: 15pt;">평점 : 9.5</span>
					   	 <span style="float:right; margin-right:5px; font-size: 15pt;">★★★★☆</span>
				   	  </div>
				   	  
				      	<div style=" height: 110px; border: 1px solid #e4e4e4; width: 230px; background-color: white;">
				      		<div class="ccc">
				      			<p class="ddd" style="font-size: 15pt;">유리정원</p>
				      			<button class="btn btn-outline-primary1">상세정보</button>
				      			<button class="btn btn-outline-primary1">예매하기</button>
				      		</div>
				      </div>
			      </div>
			      
			       <div class="a1" style="height: 420px; width: 230px; float: left; margin-top: 100px; padding-right: 245px">
				      <div style="height: 336px; border: none; width: 230px;">
				      	<img src="<%=cp%>/resource/images/eee4.jpg" width="230px;" height="336px;">
				   	  </div>
				   	  
				   	  <div style="height: 51px; width: 230px; border: 1px solid #e4e4e4; background-color: white; ">
					   	 <span style="float:left; font-size: 15pt;">평점 : 9.5</span>
					   	 <span style="float:right; margin-right:5px; font-size: 15pt;">★★★★☆</span>
				   	  </div>
				   	  
				      	<div style=" height: 110px; border: 1px solid #e4e4e4; width: 230px; background-color: white;">
				      		<div class="ccc">
				      			<p class="ddd" style="font-size: 15pt;">BlackSwan</p>
				      			<button class="btn btn-outline-primary1">상세정보</button>
				      			<button class="btn btn-outline-primary1">예매하기</button>
				      		</div>
				      </div>
			      </div>
			      
			      <div class="a1" style="height: 420px; width: 230px; float: left; margin-top: 100px; padding-right: 245px">
				      <div style="height: 336px; border: none; width: 230px;">
				      	<img src="<%=cp%>/resource/images/eee4.jpg" width="230px;" height="336px;">
				   	  </div>
				   	  
				   	  <div style="height: 51px; width: 230px; border: 1px solid #e4e4e4; background-color: white; ">
					   	 <span style="float:left; font-size: 15pt;">평점 : 9.5</span>
					   	 <span style="float:right; margin-right:5px; font-size: 15pt;">★★★★☆</span>
				   	  </div>
				   	  
				      	<div style=" height: 110px; border: 1px solid #e4e4e4; width: 230px; background-color: white;">
				      		<div class="ccc">
				      			<p class="ddd" style="font-size: 15pt;">BlackSwan</p>
				      			<button class="btn btn-outline-primary1">상세정보</button>
				      			<button class="btn btn-outline-primary1">예매하기</button>
				      		</div>
				      </div>
			      </div>
			      
			      <div class="a1" style="height: 420px; width: 230px; float: left; margin-top: 100px; padding-right: 245px">
				      <div style="height: 336px; border: none; width: 230px;">
				      	<img src="<%=cp%>/resource/images/eee4.jpg" width="230px;" height="336px;">
				   	  </div>
				   	  
				   	  <div style="height: 51px; width: 230px; border: 1px solid #e4e4e4; background-color: white; ">
					   	 <span style="float:left; font-size: 15pt;">평점 : 9.5</span>
					   	 <span style="float:right; margin-right:5px; font-size: 15pt;">★★★★☆</span>
				   	  </div>
				   	  
				      	<div style=" height: 110px; border: 1px solid #e4e4e4; width: 230px; background-color: white;">
				      		<div class="ccc">
				      			<p class="ddd" style="font-size: 15pt;">BlackSwan</p>
				      			<button class="btn btn-outline-primary1">상세정보</button>
				      			<button class="btn btn-outline-primary1">예매하기</button>
				      		</div>
				      </div>
			      </div>
			      
			      <div class="a1" style="height: 420px; width: 230px; float: left; margin-top: 100px; padding-right: 245px">
				      <div style="height: 336px; border: none; width: 230px;">
				      	<img src="<%=cp%>/resource/images/eee4.jpg" width="230px;" height="336px;">
				   	  </div>
				   	  
				   	  <div style="height: 51px; width: 230px; border: 1px solid #e4e4e4; background-color: white; ">
					   	 <span style="float:left; font-size: 15pt;">평점 : 9.5</span>
					   	 <span style="float:right; margin-right:5px; font-size: 15pt;">★★★★☆</span>
				   	  </div>
				   	  
				      	<div style=" height: 110px; border: 1px solid #e4e4e4; width: 230px; background-color: white;">
				      		<div class="ccc">
				      			<p class="ddd" style="font-size: 15pt;">BlackSwan</p>
				      			<button class="btn btn-outline-primary1">상세정보</button>
				      			<button class="btn btn-outline-primary1">예매하기</button>
				      		</div>
				      </div>
			      </div>
			      
			      </li>
			      
			       <li style="margin-left: 50px;">
			     
			     
			     
			      
			      </li>
			      
			      
			    </ul>
			    </div>	

		