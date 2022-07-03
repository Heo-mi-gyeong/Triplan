<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="resources/myLib/css/nav.css">
	<link rel="stylesheet" type="text/css" href="resources/myLib/css/header.css">
	<link rel="stylesheet" type="text/css" href="resources/myLib/css/login.css">
	<link
	href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400;1,500;1,700&amp;display=swap"
	rel="stylesheet" />
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<script src="resources/myLib/js/loginCheck.js"></script>
<title>Login</title>
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
			<a class="headerI" href="mypage"><b>${LoginId}</b>님<img class="icon" src="resources/myLib/image/mypage.png"></a>
			<a class="headerI" href="like?id=${LoginId}" ><img id="like" class="icon" src="resources/myLib/image/like1.png">&nbsp;찜</a>
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
</div><br>
<div id="container">
	<h1>로그인</h1><br>
	<form action="login">
		<label id="idLabel">아이디</label><br>
		<input id="id" name="id" type="text" placeholder="아이디">
		<p id="idCheck"></p>
		<label id="pwLabel">비밀번호</label><br>
		<input id="password" name="password" type="password" placeholder="비밀번호">
		<p id="pwCheck"></p>
		<input type="submit" value="로그인" id="login_btn" onclick='return inCheck()'>
	</form>
	<div id="join_container">
		<p>아직 회원이 아니신가요? </p>&nbsp;&nbsp;
		<a href="joinf">회원가입 하러가기</a>
	</div>
	<br>
	<div id="image_container">
		<img class="social" src="https://cdn-icons-png.flaticon.com/512/174/174848.png">
		<img class="social" src="https://news.imaeil.com/photos/2021/09/02/2021090220442908957_l.jpg">	
		<img class="social" src="https://blog.kakaocdn.net/dn/Amigh/btrnxlmVMsH/KIbvtvDllMikaBK3NFXDRk/img.png">
	</div>
	<a></a>
</div>
</body>
</html>