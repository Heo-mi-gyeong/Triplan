<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="resources/myLib/css/header.css">
	<link rel="stylesheet" type="text/css" href="resources/myLib/css/likenav.css">
	<link rel="stylesheet" type="text/css" href="resources/myLib/css/category.css">
	<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
	<link
	href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400;1,500;1,700&amp;display=swap"
	rel="stylesheet" />
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<script src="resources/myLib/js/category.js"></script>
</head>
<title>찜 목록</title>
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
<br>
<div class="container">
	<h2 data-aos="fade-up">💜 나의 찜 목록 💜</h2>
	<div class="rowContainer">
		<div id="nav">
			<input id="contentTypeId" type="hidden" value="${contentTypeId}">
			<a href="likeList?id=${LoginId}&contentTypeId=12" id="cti12">관광지</a> 
			<a href="likeList?id=${LoginId}&contentTypeId=32" id="cti32">숙박</a> 
			<a href="likeList?id=${LoginId}&contentTypeId=15" id="cti15">행사/축제</a> 
			<a href="likeList?id=${LoginId}&contentTypeId=14" id="cti14">문화시설</a> 
			<a href="likeList?id=${LoginId}&contentTypeId=38" id="cti38">쇼핑</a> 
			<a href="likeList?id=${LoginId}&contentTypeId=39" id="cti39">음식점</a> 
			<a href="likeList?id=${LoginId}&contentTypeId=28" id="cti28">레포츠</a> 
			<a href="likeList?id=${LoginId}&contentTypeId=25" id="cti25">여행코스</a>
		</div>
		<div class=' outer column'>
			<c:forEach var="item" items="${list}" varStatus="status">
				<div class='lbContainer'>
					<c:if test="${not empty item.firstimage}">
						<div id="imageCon">
							<a id='title' href="detail?contentId=${item.contentid}&contentTypeId=${contentTypeId}"> <img
								src="${item.firstimage}" id="image">
							</a>
						</div>
						<br>
					</c:if>
					<c:if test="${empty item.firstimage}">
						<a href="detail?contentId=${item.contentid}&contentTypeId=${contentTypeId}"> <img
							src="resources/myLib/image/noimage.gif"
							style="width: 300px; height: 200px;"><br>
						</a>
					</c:if>
					<div class='cContainer'>
						<a id='title' href="detail?contentId=${item.contentid}&contentTypeId=${contentTypeId}"><b>${item.title}</b></a>
						<hr width=400px style="margin: 10px 0px;">
						<p id='addr'>주소 : ${item.addr1}</p>
						<p id='tel'>tel. ${item.tel}</p>
						<a href="#" id="review">후기 ${count[status.index]}개</a>
					</div>
				</div>
				<br>
			</c:forEach>
			<c:if test="${empty list}">
				<div class='lContainer'>
					<p id="likeNo">찜 목록이 없습니다.</p>
				</div>
			</c:if>
		</div>
	</div>
</div><br>
</body>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script> 
    AOS.init(); 
</script>
</html>