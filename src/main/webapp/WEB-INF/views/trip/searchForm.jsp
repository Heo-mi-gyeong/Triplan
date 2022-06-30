<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="resources/myLib/css/nav.css">
	<link rel="stylesheet" type="text/css" href="resources/myLib/css/header.css">
	<link rel="stylesheet" type="text/css" href="resources/myLib/css/category.css">
	<link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400;1,500;1,700&amp;display=swap" rel="stylesheet" />
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<script src="resources/myLib/js/category.js"></script>
<title>검색 결과</title>
</head>
<body>
	<div id="header">
		<div class="logo">
			<a href="home"><img id="logo"
				src="resources/myLib/image/logo.png"></a>
		</div>

		<div id="header_right">
			<c:if test="${empty LoginId}">
				<a class="headerI" href="loginf">LogIn</a>
				<a id="join" class="headerI" href="joinf">Join</a>
				<a href="about" class="headerI">About</a>
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
			<input type="hidden" id='contentTypeId' name='contentTypeId' value='${contentTypeId}'> 
			<a href="search?contentTypeId=12&keyword=${keyword}" id="cti12">관광지</a> <a
				href="search?contentTypeId=32&keyword=${keyword}" id="cti32">숙박</a> <a
				href="search?contentTypeId=15&keyword=${keyword}" id="cti15">행사/축제</a> <a
				href="search?contentTypeId=14&keyword=${keyword}" id="cti14">문화시설</a> <a
				href="search?contentTypeId=38&keyword=${keyword}" id="cti38">쇼핑</a> <a
				href="search?contentTypeId=39&keyword=${keyword}" id="cti39">음식점</a> <a
				href="search?contentTypeId=28&keyword=${keyword}" id="cti28">레포츠</a> <a
				href="search?contentTypeId=25&keyword=${keyword}" id="cti25">여행코스</a>
		</div>
	</div>
	<br>
	<div class="container">
		<h2>'${keyword}' 에 대한 검색 결과</h2>
	</div><br>
	<div class="rowCat container">
		<c:if test="${contentTypeId eq '12'}"><p class="city">#&nbsp;관광지</p></c:if>
		<c:if test="${contentTypeId eq '32'}"><p class="city">#&nbsp;숙박</p></c:if>
		<c:if test="${contentTypeId eq '15'}"><p class="city">#&nbsp;축제/행사</p></c:if>
		<c:if test="${contentTypeId eq '14'}"><p class="city">#&nbsp;문화시설</p></c:if>
		<c:if test="${contentTypeId eq '38'}"><p class="city">#&nbsp;쇼핑</p></c:if>
		<c:if test="${contentTypeId eq '28'}"><p class="city">#&nbsp;레포츠</p></c:if>
		<c:if test="${contentTypeId eq '39'}"><p class="city">#&nbsp;음식점</p></c:if>
		<c:if test="${contentTypeId eq '25'}"><p class="city">#&nbsp;여행코스</p></c:if>
	</div> 
	<br>
	<div class=' outer column'>
		<c:forEach var="item" items="${list}" varStatus="status">
			<div class='bContainer'>
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
					<hr width=500px style="margin: 10px 0px;">
					<p id='addr'>주소 : ${item.addr1}</p>
					<a href="#" id="review">후기 ${count[status.index]}개</a>
				</div>
			</div>
			<br>
		</c:forEach>
		<c:if test="${empty list}">
			<div class="ncontainer">일치하는 검색 결과가 없습니다.</div>
		</c:if>
	</div>
</body>
</html>