<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>

<style>
   *{margin:0;padding:0;}
    ul,li{list-style:none;}
    .slide{
    height:600px;
    overflow:hidden;
    position: relative;
    }
    .slide ul{position:relative;height:100%;}
    .slide li{position:absolute;left:0;right:0;top:0;bottom:0;opacity:0;animation:fade 8s infinite;}
    .slide li:nth-child(1){
    animation-delay:0s; 
    background-image:url(<%=cp%>/resource/images/slii3.jpg);
    background-size: 100% 100%;
    background-repeat: no-repeat; 
    }
    .slide li:nth-child(2){animation-delay:2s; background-image:url(<%=cp%>/resource/images/sli3.jpg); 
    background-size: 100% 100%;
    background-repeat: no-repeat; }
    
    .slide li:nth-child(3){animation-delay:4s; background-image:url(<%=cp%>/resource/images/sli4.jpg);
    background-repeat: no-repeat; 
    background-size: 100% 100%;
    }
    
    .slide li:nth-child(4){animation-delay:6s; background-image:url(<%=cp%>/resource/images/sli5.jpg);
    background-size: 100% 100%;
    background-repeat: no-repeat; 
    }
     /* 100 / 8 = 12.5 */
    @keyframes fade {
      0% {opacity:0;}
      5% {opacity:1;}
      25% {opacity:1;}
      30% {opacity:0;}
      100% {opacity:0;}
    }
    
    
    
    
      *{margin:0;padding:0;}
    ul,li{list-style:none;}
    .slide3{height:230px;overflow:hidden;}
    .slide3 ul{position:relative;height:100%;}
    .slide3 li{position:absolute;left:0;right:0;top:0;bottom:0;opacity:0;animation:fade 8s infinite;}
    .slide3 li:nth-child(1){
    animation-delay:0s; 
    background-image:url(<%=cp%>/resource/images/slide1.jpg);
    }
    .slide3 li:nth-child(2){animation-delay:2s; background-image:url(<%=cp%>/resource/images/slide2.jpg);}
    .slide3 li:nth-child(3){animation-delay:4s; background-image:url(<%=cp%>/resource/images/slide3.jpg);}
    .slide3 li:nth-child(4){animation-delay:6s; background-image:url(<%=cp%>/resource/images/pic03.jpg);}
     /* 100 / 8 = 12.5 */
    @keyframes fade {
      0% {opacity:0;}
      5% {opacity:1;}
      25% {opacity:1;}
      30% {opacity:0;}
      100% {opacity:0;}
    }
    
    
    
    .slide2{
    
    height: 50px;
    width: 600px;
    margin: auto;
    
    }
    

    
    
    .lin {
    text-align: center; 
    margin: 15px 0px;
    
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

	.slide3{
	text-align: center;
	}
	

    



    .swiper-container {
      width: 100%;
      height:  500px;
    }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -: center;	
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
    
    .swiper-wrapper {
    transition-duration: 0ms;
    transform: translate3d(170.5px, 0px, 0px);
    
    }
    
    
 #modal {
  display:none;
  position:absolute;
  width:100%;
  height:100%;
  z-index:1;
}

#modal h2 {
  margin:0;   
}

#modal button {
  display:inline-block;
  width:100px;
  margin-left:calc(100% - 100px - 10px);
}

#modal .modal_content {
  width:500px;
  height:500px;
  margin:100px auto;
  padding:20px 10px;
  background:#fff;
  border:2px solid #666;
}

#modal .modal_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
}
    
    
 
</style>


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

function getAudience(movieCode){
	var url ="<%=cp%>/main/getAudience";
	
	jQuery.ajax({
        type:"get"
        ,url:url
        ,data:""
        ,dataType:"json"
        ,success:function(data){
        	console.log(data);
        	
        	var item = data.boxOfficeResult.dailyBoxOfficeList;
        	if(item.length > 0){
        		for(i=0; i<item.length; i++){
	        		var code = item[i].movieCd;
	        		
	        		if(movieCode == code){
	        			var dailyAudi = item[i].audiCnt;
	        			var audience = item[i].audiAcc;
	        		}
        		}
        	}
        	
       	
       		if(dailyAudi > 0){
       			jQuery("span[class=dailyAudience]").html(dailyAudi+"명");
            }

       		if(audience > 0){
       			jQuery("span[class=audience]").html(audience+"명");
            }
            
        }
		,error:function(e){
            console.log(e.responseText);
	        
        }
	});
}


function showMovieDetail(movieCode){
	var url ="<%=cp%>/main/movieDetail";
	var query ="movieCode="+movieCode; 
	var selector = "#detailInfo";
	var type="get";

	$("#showDetail").empty();
	ajaxHTML(url, type, query, selector);
	detailMovie(movieCode);
	getAudience(movieCode);
	
    			$("#detailInfo").dialog({
					modal: true,
					height:2000,
					width:1000,
					title: "상세 정보",
					close: function(event, ui) {
						window.location.reload();
					}
	});
}

function detailMovie(movieCd){
	var url="<%=cp%>/main/showDetail";
	var query="movieCode="+movieCd;
	
	      jQuery.ajax({
	         type:"get"
	         ,url:url
	         ,data:query
	         ,dataType:"json"
	         ,success:function(data){
	            
	        	 console.log(data);
	        	
	        	var director="";
	        	if(data.movieInfoResult.movieInfo.directors.length > 0){
		        	for(var i=0; i<data.movieInfoResult.movieInfo.directors.length; i++){
		            	director +=data.movieInfoResult.movieInfo.directors[i].peopleNm+"&nbsp&nbsp&nbsp";
		        	}
		            	
		        	jQuery("span[class=moviedirector]").html(director);
	        	} else {
	        		jQuery("span[class=moviedirector]").html("");
	        	}
	        	
	        	var showType="";
	        	if(data.movieInfoResult.movieInfo.showTypes.length> 0){
		            for(var i=0; i<data.movieInfoResult.movieInfo.showTypes.length; i++){
		            	showType += data.movieInfoResult.movieInfo.showTypes[i].showTypeGroupNm+"("
		        	  		+data.movieInfoResult.movieInfo.showTypes[i].showTypeNm+")&nbsp&nbsp&nbsp";
		            }
		           		 jQuery("span[class=showing]").html(showType);
		            
	        	} else {
	        		jQuery("span[class=showing]").html("");
	        	}
	        	
	            var actors="";
	            if(data.movieInfoResult.movieInfo.actors.length >0){
		        	for(var i=0; i<6; i++){
		        	  	actors += data.movieInfoResult.movieInfo.actors[i].peopleNm+"&nbsp&nbsp&nbsp";
		            }
		        	jQuery("span[class=actor]").html(actors);
	            } else {
	            	jQuery("span[class=actor]").html("");
	            }
	            
	            var genre="";
	            if(data.movieInfoResult.movieInfo.genres.length > 0){
		            for(var i=0; i<data.movieInfoResult.movieInfo.genres.length; i++){
		            	genre +=data.movieInfoResult.movieInfo.genres[i].genreNm+"&nbsp&nbsp&nbsp" ;
		            }
		            jQuery("span[class=genre]").html(genre);
	            } else {
	            	jQuery("span[class=genre]").html("");
	            }
	            
	            showTime="";
	            if(data.movieInfoResult.movieInfo.showTm > 0){
		            showTime= data.movieInfoResult.movieInfo.showTm+"분";
	            	
		            jQuery("span[class=mtime]").html(showTime);
	            } else {
	            	jQuery("span[class=mtime]").html("");
	            }
	            
	         }
	         ,error:function(e){
	            console.log(e.responseText);
	        
	         }
	   });
}
</script>




		<div class="body-container" style="width: 100%; height: 300px; min-height: 670px;">
		   
		   <div class="slide">
		   			   	

		   	
		    <ul>
		      <li></li>
		      <li></li>
		      <li></li>
		      <li></li>
		    </ul>
		    			   	
		  </div>
		  
		  
		   		<div class="floating">
						
					<div>
					<a href="<%=cp%>" style="color: black;">
					<img src="<%=cp%>/resource/images/iconn.png" width="20px;" height="20px;">
					<br>
					2019년 <br>
					VIP안내
					</a>
					</div> 
					
					<div>
					<a href="<%=cp%>/movieschedule/schedulecinema" style="color: black;">
					영화관
					</a>
					</div> 
					
					<div>
					<a href="<%=cp%>/movieschedule/schedulespecial" style="color: black;">
					특별관
					</a>
					</div> 
					
					<div>
					<a href="<%=cp%>/movieschedule/schedulemovie" style="color: black; height: 100px;">
					상영시간표
					</a>
					</div> 
					
					<div>
					<a href="<%=cp%>/ticketing/ticketing" style="color: black; height: 100px;">
					빠른예매
					</a>
					</div> 
					
					<div>
					
					</div>
					

				
					

					</div>
		  

	</div>
	
	
			<div class="slide2" >

			      <!-- <li class="lin">최신개봉작</li> -->
	
			      	<button class="btn btn-outline-primary" onclick="javascript:location.href='<%=cp%>/movie/newmovie';" style="height: 50px; width: 100%;">최신개봉작
			      	<!-- <p style="color: white; text-align: center; margin-top: 12px;">최신개봉작</p> -->
			      	</button>

		  	</div>
		  	
		  	
		  	
		  	
		  	<%-- <div class="slide7" style="width: 100%; height: 500px; margin-top:20px; background-color: #f2f2f2 ">
			  	<div style="width: 835px;margin: 0 auto;">
			  	
			  	<ul>
			      <li>

			      	<div class="a1" style="height: 400px; width: 200px; float: left; margin-top: 50px;">
				      	<div style="height: 300px; border: none; width: 200px;">
				      		<img src="<%=cp%>/resource/images/eee1.jpg" width="200px;" height="300px;">
				      	
				      	</div>
				      	
				      	<div style=" height: 100px; border: 1px solid #e4e4e4; width: 200px; background-color: white;">
				      		<div class="ccc">
				      		<p class="ddd">MoonLight</p>
				      		<button class="btn btn-outline-primary1">상세정보</button>
				      		<button class="btn btn-outline-primary1">예매하기</button>
				      		</div>
				      	
				      	</div>
			      	
			      	</div>
			      	
			      	
			      	<div class="a1" style="height: 400px; width: 200px; float: left; margin-top: 50px;">
				      	<div style=" height: 300px;border: none; width: 200px;">
				      		<img src="<%=cp%>/resource/images/eee2.jpg" width="200px;" height="300px;">
				      	
				      	</div>
				      	
				      	<div style=" height: 100px; border: 1px solid #e4e4e4; width: 200px; background-color: white;">
				      		<div class="ccc">
				      		<p class="ddd">마센필라트2</p>
				      		<button class="btn btn-outline-primary1">상세정보</button>
				      		<button class="btn btn-outline-primary1">예매하기</button>
				      		</div>
				      	
				      	</div>
			      	
			      	</div>
			      	
			      	<div class="a1" style="height: 400px; width: 200px; float: left; margin-top: 50px;">
				      	<div style=" height: 300px; border: none; width: 200px; ">
				      		<img src="<%=cp%>/resource/images/eee3.jpg" width="200px;" height="300px;">
				      	
				      	</div>
				      	
				      	<div style=" height: 100px; border: 1px solid #e4e4e4; width: 200px; background-color: white;">
				      		<div class="ccc">
				      		<p class="ddd">유리정원</p>
				      		<button class="btn btn-outline-primary1">상세정보</button>
				      		<button class="btn btn-outline-primary1">예매하기</button>
				      		</div>
				      	</div>
			      	
			      	</div>
			      	
			      	
			      	<div class="a1" style="height: 400px; width: 200px; float: left; margin-top: 50px;">
				      	<div style=" height: 300px; border: none; width: 200px; ">
				      		<img src="<%=cp%>/resource/images/eee4.jpg" width="200px;" height="300px;">
				      	
				      	</div>
				      	
				      	<div style=" height: 100px; border: 1px solid #e4e4e4; width: 200px; background-color: white;">
				      		<div class="ccc">
				      		<p class="ddd">BlackSwan</p>
				      		<button class="btn btn-outline-primary1">상세정보</button>
				      		<button class="btn btn-outline-primary1">예매하기</button>
				      		</div>
				      		
				      	
				      	</div>
			      	
			      	</div>
			      	
			      </li>
			     
			    </ul>
			    </div>	

		  	</div> --%>
		  	
		  	
		  	
		  		<div style="padding-left: 10%; padding-right: 20%;">
		  			
		  			
		  			<div class="swiper-container">
						    <div class="swiper-wrapper">
						    
						    <c:forEach var="vo" items="${list}">
						      <div class="swiper-slide">
						      	<div>
				      				<c:choose>
								      	<c:when test="${vo.thumbNail != 'No images'}">
								      		<img src="${vo.thumbNail}" width="295px;" height="280px;">
								      	</c:when>
							      		<c:otherwise>
							      			<div style="width: 295px; height: 280px; text-align: center;">
							      				<p style="height: 150px; font-size: 30px; padding-top: 130px;">이미지가 없습니다.</p>
							      			</div>
							      		</c:otherwise>
				      				</c:choose>
					      			
					      			 <div style="height: 51px; width: 300px; border: 1px solid #e4e4e4; background-color: white; ">
					   	 				<span style="float:left; font-size: 15pt;">평점 : 9.5</span>
					   	 				<span style="float:right; margin-right:5px; font-size: 15pt;">★★★★☆</span>
				   	  				</div>
				   	  				
					      			<div style="border: 1px solid #e4e4e4; width: 300px; height: 100px;">
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
						      
						      <div id="detailInfo" style="display: none;width: 1000px;"></div>
						      
						      <div class="swiper-slide">
						      	<div>
				      				<img src="<%=cp%>/resource/images/eee2.jpg" height="330px;" width="300px;">
				      				<div style="border: 1px solid #e4e4e4; height: 100px;">
									<p style="margin-top: 10px;">MoonLight</p>
									<button class="btn btn-outline-primary1">상세정보</button>
						      		<button class="btn btn-outline-primary1">예매하기</button>
									</div>
								</div>
						      </div>
						      
						      <div class="swiper-slide">
						      
						      	<div>
				      				<img src="<%=cp%>/resource/images/eee3.jpg" height="330px;" width="300px;">
				      				<div style="border: 1px solid #e4e4e4; height: 100px;">
									<p style="margin-top: 10px;">MoonLight</p>
									<button class="btn btn-outline-primary1">상세정보</button>
						      		<button class="btn btn-outline-primary1">예매하기</button>
									</div>
								</div>
						      
						      </div>
						      
						      <div class="swiper-slide">
						      	<div>
				      				<img src="<%=cp%>/resource/images/eee4.jpg" height="330px;" width="300px;">
				      				<div style="border: 1px solid #e4e4e4; height: 100px;">
									<p style="margin-top: 10px;">MoonLight</p>
									<button class="btn btn-outline-primary1">상세정보</button>
						      		<button class="btn btn-outline-primary1">예매하기</button>
									</div>
								</div>
								
						      
						      
						      </div>
						      
							      <div class="swiper-slide">Slide 5</div>
							      <div class="swiper-slide">Slide 6</div>
							      <div class="swiper-slide">Slide 7</div>
							      <div class="swiper-slide">Slide 8</div>
							      <div class="swiper-slide">Slide 9</div>
							      <div class="swiper-slide">Slide 10</div>
							      
							   
		  	
							      
						    </div>
						    <!-- Add Pagination -->
						    <div class="swiper-pagination"></div>
						  </div>
						  
						  
						     
							      <div id="modal">
   
									<div class="modal_content">
										<button type="button" id="modal_close_btn">모달 창 닫기</button>
										 <h2>모달 창</h2>
													       
										<p>모달 창 입니다.</p>
				       
							</div>
										   
						<div class="modal_layer"></div>
					</div>
						  
		
		  			</div>
		  			
		  			
		  			
		  	
		  	 
		  	<div style="background-color: white-space; width: 100%; height: 1500px; padding-top: 50px;" >
		  	
		  	
		  	<p style="color: black ; margin-left:435px; margin-top: 20px; font-size: 25px;">새로운 이벤트</p> 
		  	
		  	
		  		<div style="margin-left:435px; height: 560px; width: 100%; margin-top: 10px;">		 		
		  			<div style="background-color: blue; width: 35%; height: 450px; float: left; margin-left: 10px;">
		  			
							   <div class="slide3">
							    <ul>
							      <li></li>
							      <li></li>
							      <li></li>
							      <li></li>
							    </ul>
							  </div>
		
		  				<div style="background-color: yellow; width: 50%; height: 300px; float: left;">
		  					<a href="<%=cp%>">
		  					<img src="<%=cp%>/resource/images/e2.JPG" width="100%;" height="300px">
		  					</a>
		  				</div>
		  				
		  				<div style="background-color: green ; width: 50%; height: 300px;float: left; ">
		  					<a href="<%=cp%>">
		  					<img src="<%=cp%>/resource/images/e3.JPG" width="100%;" height="300px">
		  					</a>
		  				</div>
		  			</div>
		  			
		  			
		  			
		  			<div style="background-color: red; width: 16%; height: 530px; float: left;">
		  				
		  				
		  				<a href="<%=cp%>">
		  					<img src="<%=cp%>/resource/images/event.jpg" width="100%;" height="530px">
		  				</a>
		  			
		  			</div>
		  			

		  		</div>
		  		
		  		
		  		
		  		
		  		<div style="margin-top: 150px;">
		  			<img src="<%=cp%>/resource/images/sli5.jpg" width="100%" height="500px;">
		  		</div>
	

		  	</div>
		  		
		  		
<script type="text/javascript">

var swiper = new Swiper('.swiper-container', {
    slidesPerView: 4,
    spaceBetween: 30,
    centeredSlides: true,
    pagination: {
      el: '.swiper-pagination',
      clickable: true,
    },
  });
  
  
$("#modal_opne_btn").click(function(){
    $("#modal").attr("style", "display:block");
});

 $("#modal_close_btn").click(function(){
    $("#modal").attr("style", "display:none");
});      

</script>
		  	

		
		
		