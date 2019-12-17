<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
   String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mgbxCLA</title>

<link rel="stylesheet" href="<%=cp%>/resource/css/style.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/layout.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/bootstrap/css/bootstrap.css">
<link href="https://fonts.googleapis.com/css?family=Amatic+SC|Architects+Daughter|Gaegu:300,400,700&display=swap&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Amatic+SC|Architects+Daughter|Do+Hyeon|Gaegu:300,400,700|Gamja+Flower|Jua|Noto+Serif+KR|Sunflower:300&display=swap&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">


<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-3.4.1.min.js"></script>

<script type="text/javascript" src="<%=cp%>/resource/js/util-jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>




</head>

<body>

<div class="header">
    <tiles:insertAttribute name="header"/>
</div>
	
<div class="container" style="height: 100%; width: 100%; padding-right: 0px; padding-left: 0px; min-height: 800px;">
    <tiles:insertAttribute name="body"/>
</div>

<div class="footer" style="background-color: #221f1f; height:150px; padding-top: 20px;">
    <tiles:insertAttribute name="footer"/>
</div>

<script type="text/javascript" src="<%=cp%>/resource/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>

</body>
</html>