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
	<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<script src="resources/myLib/js/category.js"></script>
<title>Triplan</title>
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
			<a href="contentTypeId?contentTypeId=12" id="cti12">관광지</a> <a
				href="contentTypeId?contentTypeId=32" id="cti32">숙박</a> <a
				href="contentTypeId?contentTypeId=15" id="cti15">행사/축제</a> <a
				href="contentTypeId?contentTypeId=14" id="cti14">문화시설</a> <a
				href="contentTypeId?contentTypeId=38" id="cti38">쇼핑</a> <a
				href="contentTypeId?contentTypeId=39" id="cti39">음식점</a> <a
				href="contentTypeId?contentTypeId=28" id="cti28">레포츠</a> <a
				href="contentTypeId?contentTypeId=25" id="cti25">여행코스</a>
		</div>
	</div>
	<div class='outer'>
		<img src="resources/myLib/image/imgCat.png" id="cImg">
	</div>
	<br>
	<div class="outer category_outer" data-aos="fade-up" data-aos-duration="1000" > 
		<form action="catSearch" id="inner" method="get">
			<div class="drop-down drop-down-1">
				<div class="selected one">
					<a href="#"><span>지역</span></a>
				</div>
				<div class="options option">
					<ul>
						<li><a href="#" id="1">서울</a></li>
						<li><a href="#" id="2">인천</a></li>
						<li><a href="#" id="3">대전</a></li>
						<li><a href="#" id="4">대구</a></li>
						<li><a href="#" id="5">광주</a></li>
						<li><a href="#" id="6">부산</a></li>
						<li><a href="#" id="7">울산</a></li>
						<li><a href="#" id="8">세종</a></li>
						<li><a href="#" id="31">경기도</a></li>
						<li><a href="#" id="32">강원도</a></li>
					</ul>
				</div>
			</div>
			<div class="drop-down drop-down-1">
				<div class="selected two">
					<a href="#"><span>시/군/구</span></a>
				</div>
				<div class="options option_one">
					<ul>
						<li class='li1'><a class="name1" href="#"></a></li>
						<li class='li2'><a class="name2" href="#"></a></li>
						<li class='li3'><a class="name3" href="#"></a></li>
						<li class='li4'><a class="name4" href="#"></a></li>
						<li class='li5'><a class="name5" href="#"></a></li>
						<li class='li6'><a class="name6" href="#"></a></li>
						<li class='li7'><a class="name7" href="#"></a></li>
						<li class='li8'><a class="name8" href="#"></a></li>
						<li class='li9'><a class="name9" href="#"></a></li>
						<li class='li10'><a class="name10" href="#"></a></li>
					</ul>
				</div>
			</div>
			<div class="drop-down drop-down-1">
				<div class="selected three">
					<a href="#"><span>대분류</span></a>
				</div>
				<div class="options option_two">
					<ul>
						<li class='li1'><a class="name1" href="#"></a></li>
						<li class='li2'><a class="name2" href="#"></a></li>
					</ul>
				</div>
			</div>
			<div class="drop-down drop-down-1">
				<div class="selected four">
					<a href="#"><span>분류</span></a>
				</div>
				<div class="options option_three">
					<ul>
						<li class='li1'><a class="name1" href="#"></a></li>
						<li class='li2'><a class="name2" href="#"></a></li>
						<li class='li3'><a class="name3" href="#"></a></li>
						<li class='li4'><a class="name4" href="#"></a></li>
						<li class='li5'><a class="name5" href="#"></a></li>
						<li class='li6'><a class="name6" href="#"></a></li>
						<li class='li7'><a class="name7" href="#"></a></li>
					</ul>
				</div>
			</div>
			<div class="drop-down drop-down-1">
				<div class="selected five">
					<a href="#"><span>필터</span></a>
				</div>
				<div class="options option_four">
					<table>
						<tr>
							<td class='td1'><a href="#" class='name1'></a></td>
							<td class='td4'><a href="#" class='name4'></a></td>
						</tr>
						<tr>
							<td class='td2'><a href="#" class='name2'></a></td>
							<td class='td5'><a href="#" class='name5'></a></td>
						</tr>
						<tr>
							<td class='td3'><a href="#" class='name3'></a></td>
							<td class='td6'><a href="#" class='name6'></a></td>
						</tr>
						<tr>
							<td class='td7'><a href="#" class='name7'></a></td>
							<td class='td10'><a href="#" class='name10'></a></td>
						</tr>
						<tr>
							<td class='td8'><a href="#" class='name8'></a></td>
							<td class='td11'><a href="#" class='name11'></a></td>
						</tr>
						<tr>
							<td class='td9'><a href="#" class='name9'></a></td>
							<td class='td12'><a href="#" class='name12'></a></td>
						</tr>
						<tr>
							<td class='td13'><a href="#" class='name13'></a></td>
							<td class='td17'><a href="#" class='name17'></a></td>
						</tr>
						<tr>
							<td class='td14'><a href="#" class='name14'></a></td>
							<td class='td18'><a href="#" class='name18'></a></td>
						</tr>
						<tr>
							<td class='td15'><a href="#" class='name15'></a></td>
							<td class='td19'><a href="#" class='name19'></a></td>
						</tr>
						<tr>
							<td class='td16'><a href="#" class='name16'></a></td>
						</tr>
					</table>
				</div>
			</div>
			<input type="hidden" id='areaName' name='areaName' value=''>
			<input type="hidden" id='sigunguName' name='sigunguName' value=''>
			<input type="hidden" id='areaCode' name='areaCode' value=''>
			<input type="hidden" id='sigunguCode' name='sigunguCode' value=''>
			<input type="hidden" id='cat1' name='cat1' value=''> 
			<input type="hidden" id='cat2' name='cat2' value=''> 
			<input type="hidden" id='cat3' name='cat3' value=''> 
			<input type="hidden" id='contentTypeId' name='contentTypeId' value='${contentTypeId}'> 
			<input type="submit" id="select" value="검색">
		</form>
	</div>
	<br>
	<br>
	<div class="rowCat container">
		<c:if test="${contentTypeId eq '12'}"><p class="city">#&nbsp;관광지</p></c:if>
		<c:if test="${contentTypeId eq '32'}"><p class="city">#&nbsp;숙박</p></c:if>
		<c:if test="${contentTypeId eq '15'}"><p class="city">#&nbsp;축제/행사</p></c:if>
		<c:if test="${contentTypeId eq '14'}"><p class="city">#&nbsp;문화시설</p></c:if>
		<c:if test="${contentTypeId eq '38'}"><p class="city">#&nbsp;쇼핑</p></c:if>
		<c:if test="${contentTypeId eq '28'}"><p class="city">#&nbsp;레포츠</p></c:if>
		<c:if test="${contentTypeId eq '39'}"><p class="city">#&nbsp;음식점</p></c:if>
		<c:if test="${contentTypeId eq '25'}"><p class="city">#&nbsp;여행코스</p></c:if>
		&nbsp;&nbsp;<p class="city">${areaName}</p>&nbsp;&nbsp;<p class="city">${sigunguName}</p>
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
					<p id='tel'>tel. ${item.tel}</p>
					<a href="#" id="review">후기 ${count[status.index]}개</a>
				</div>
			</div>
			<br>
		</c:forEach>
		<c:if test="${empty list}">
			<br><br><br>
			<div class="outer">
				일치하는 결과가 없습니다.
			</div>
		</c:if>
	</div>
</body>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script> 
    AOS.init(); 
</script>
</html>