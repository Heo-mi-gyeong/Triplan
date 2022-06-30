<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>국내 여행</title>
	<link rel="stylesheet" type="text/css" href="resources/myLib/css/nav.css">
	<link rel="stylesheet" type="text/css" href="resources/myLib/css/header.css">
	<link rel="stylesheet" type="text/css" href="resources/myLib/css/hotArea.css">
	<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<script src="resources/myLib/js/likeCheck.js"></script>
	<link
	href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400;1,500;1,700&amp;display=swap"
	rel="stylesheet" />
</head>
<body>
<div id="header">
	<div class="logo">
		<a href="home"><img id="logo" src="resources/myLib/image/logo.png" ></a>
	</div>
	
	<div id="header_right">
		<c:if test="${empty LoginId}">
			<a class="headerI" href="loginf">LogIn</a>
			<a id="join" class="headerI" href="joinf" >Join</a>
			<a href="about" class="headerI" >About</a>
		</c:if>
		<c:if test="${not empty LoginId}">
			<a class="headerI" href="mypage?id=${LoginId}"><b>${LoginId}</b>님<img class="icon" src="resources/myLib/image/mypage.png"></a>
			<a class="headerI" href="likeList?id=${LoginId}&contentTypeId=12"><img id="like" class="icon" src="resources/myLib/image/like1.png">&nbsp;찜</a>
			<a class="headerI" href="logout"><img class="icon"  src="resources/myLib/image/logout.png">Logout</a>
		</c:if>
		
		<form class="search_bar" method="get" action="search">
			<input id="keyword"  name="keyword" type="text" placeholder="검색어를 입력하세요.">
			<input name="contentTypeId" type="hidden" value="12">
			<input type="image" class="icon" src="resources/myLib/image/search.png" onsubmit="true">
		</form>	
	</div>
</div>
<div class="container">
	<div id="nav">
		<a href="contentTypeId?contentTypeId=12">관광지</a>
		<a href="contentTypeId?contentTypeId=32">숙박</a>
		<a href="contentTypeId?contentTypeId=15">행사/축제</a>
		<a href="contentTypeId?contentTypeId=14">문화시설</a>
		<a href="contentTypeId?contentTypeId=38">쇼핑</a>
		<a href="contentTypeId?contentTypeId=39">음식점</a>
		<a href="contentTypeId?contentTypeId=28">레포츠</a>
		<a href="contentTypeId?contentTypeId=25">여행코스</a>
	</div>
</div>
<div class="outer" data-aos="flip-left" data-aos-duration="2000" >
	<img src="resources/myLib/image/banner.png" id="cImg">
</div><br>
<div class="outer">
	<p class="content_label">📣 지금 HOT한 여행지</p>
	<div class="inner">
		<div class="outer">
			<a class="imgCon" href="contentTypeId?areaCode=${hot[0].areaCode}&sigunguCode=${hot[0].sigunguCode}&contentTypeId=12
				&areaName=${hot[0].areaName}&sigunguName=${hot[0].sigunguName}">
				<img class="hotImg" src="https://cdn.pixabay.com/photo/2014/01/02/10/08/sea-237482_960_720.jpg">
			</a>
			<p>${hot[0].areaName} ${hot[0].sigunguName}</p>
		</div>
		<div class="outer">
			<a class="imgCon" href="contentTypeId?areaCode=${hot[1].areaCode}&sigunguCode=${hot[1].sigunguCode}&contentTypeId=12
				&areaName=${hot[1].areaName}&sigunguName=${hot[1].sigunguName}">
				<img class="hotImg" src="https://cdn.pixabay.com/photo/2016/03/15/04/11/towards-the-garden-1256872_960_720.jpg">
			</a>
			<p>${hot[1].areaName} ${hot[1].sigunguName}</p>
		</div>
		<div class="outer">
			<a class="imgCon" href="contentTypeId?areaCode=${hot[2].areaCode}&sigunguCode=${hot[2].sigunguCode}&contentTypeId=12
				&areaName=${hot[2].areaName}&sigunguName=${hot[2].sigunguName}">
				<img class="hotImg" src="https://cdn.pixabay.com/photo/2020/05/05/07/52/republic-of-korea-5131925_960_720.jpg">
			</a>
			<p>${hot[2].areaName} ${hot[2].sigunguName}</p>
		</div>
		<div class="outer">
			<a class="imgCon" href="contentTypeId?areaCode=${hot[3].areaCode}&sigunguCode=${hot[3].sigunguCode}&contentTypeId=12
				&areaName=${hot[3].areaName}&sigunguName=${hot[3].sigunguName}">
				<img class="hotImg" src="https://cdn.pixabay.com/photo/2017/06/07/12/24/building-2380214_960_720.jpg">
			</a>
			<p>${hot[3].areaName} ${hot[3].sigunguName}</p>
		</div>
	</div>
</div>
</body>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script> 
    AOS.init(); 
</script>
</html>
