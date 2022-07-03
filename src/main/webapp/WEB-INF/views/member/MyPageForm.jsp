<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="resources/myLib/css/header.css">
	<link rel="stylesheet" type="text/css" href="resources/myLib/css/join.css">
	<link rel="stylesheet" type="text/css" href="resources/myLib/css/mypage.css">
	<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
	<link
	href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400;1,500;1,700&amp;display=swap"
	rel="stylesheet" />
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<script src="resources/myLib/js/update.js"></script>
<title>My Page</title>
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
		<h2>📌 회원정보</h2>
	</div>
	<div id="rowContainer">
		<form action="update" method="get" id="form">
			<label id="idLabel">아이디</label>
			<input id="id" name="id" type="hidden" value="${mInfo.id}">
			<p id="idname">${mInfo.id}</p>
			
			<label id="pwLabel">비밀번호</label><br>
			<input id="password" name="password" type="password" placeholder="비밀번호" value="${mInfo.password}">
			<p id="pwCheck"></p>
			
			<input id="passwordc" type="password" placeholder="비밀번호 확인" value="${mInfo.password}">
			<p id="pwcCheck"></p>
			
			<label id="nLabel">닉네임</label>
			<img id="nImg" width=20px height=20px src="resources/myLib/image/check.png"><br>
			<input id="nick" name="nick" type="hidden" value="${mInfo.nick}">
			<p id="idname">${mInfo.nick}</p>
			
			<label id="numLabel">전화번호( - 포함)</label><br>
			<input id="num" name="num" type="text" value="${mInfo.num}" placeholder="이벤트 알림시 필요합니다(선택)">
			<p id="numCheck"></p>
			<input type="submit" value="회원정보 수정" id="join_btn" onclick='return inCheck()'>
		</form>
		<div class="rightImg" data-aos="fade-up" >
			<img src="resources/myLib/image/banner2.png" id="banner2">
		</div>
	</div>
</body>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script> 
    AOS.init(); 
</script>
</html>