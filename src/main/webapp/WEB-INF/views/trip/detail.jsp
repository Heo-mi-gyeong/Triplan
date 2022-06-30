<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Trip Place</title>
	<link rel="stylesheet" type="text/css" href="resources/myLib/css/header.css">
	<link rel="stylesheet" type="text/css" href="resources/myLib/css/detail.css">
	<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<script src="resources/myLib/js/detail.js"></script>
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
	<div class='bContainer' data-aos="fade-left" data-aos-duration="700" >
		<input type="hidden" id="LoginId"  value="${LoginId}">
		<input type="hidden" id="contentTypeId"  value="${contentTypeId}">
		<input type="hidden" id="contentId"  value="${contentId}">
		<c:if test="${not empty list.firstimage}">
			<div class='cContainer' data-aos="fade-right" data-aos-duration="1000" >
				<img src="${list.firstimage}"  id="image" class="itemImg">
			</div><br>
		</c:if>
		<c:if test="${empty list.firstimage}">
			<div class='cContainer'>
				<img class="itemImg" src="resources/myLib/image/noimage.gif" style="width:300px; height:200px;">
			</div><br>
		</c:if>
		<div class='cContainer'>
			<p id="title"><b>${list.title}</b></p>
			<div class='like' onclick="tlike()">
				<img id="like" class="icon likeImg" src="resources/myLib/image/like1.png">&nbsp;찜하기
			</div>
			<hr width=500px style="margin: 20px 0px; border:0.5px solid Gainsboro; background:Gainsboro; ">
			<p id="overview">${list.overview}</p><br>
			<p id='addr'>주소 : ${list.addr1}</p><br>
			<c:if test="${not empty list.homepage}">
				<p id="homepage">사이트 방문 &nbsp;${list.homepage}</p><br>
			</c:if>
		</div>
	</div><br>
	<hr style="width:1200px; border: 0.5px solid #eee;">
	<div class="vContainer">
	<p class="info">🟣 상세정보</p><br>
		<c:if test="${contentTypeId eq '12'}">
			<div class='rContainer'><p class='width'><b>• 체험안내</b></p><p>${info.expguide}</p></div>
			<div class='rContainer'><p class='width'><b>• 이용시간</b></p><p>${info.usetime}</p></div>
			<div class='rContainer'><p class='width'><b>• 휴무</b></p><p>${info.restdate}</p></div>
			<div class='rContainer'><p class='width'><b>• 주차가능 여부</b></p><p>${info.parking}</p></div>
			<div class='rContainer'><p class='width'><b>• 애견동반 가능 여부</b></p><p>${info.chkpet}</p></div>
			<div class='rContainer'><p class='width'><b>• 문의 및 안내</b></p><p>${info.infocenter}</p></div>
		</c:if>
		<c:if test="${contentTypeId eq '14'}">
			<div class='rContainer'><p class='width'><b>• 이용시간</b></p><p>${info.usetimeculture}</p></div>
			<div class='rContainer'><p class='width'><b>• 이용요금</b></p><p>${info.usefee}</p></div>
			<div class='rContainer'><p class='width'><b>• 휴무</b></p><p>${info.restdateculture}</p></div>
			<div class='rContainer'><p class='width'><b>• 주차 가능 여부</b></p><p>${info.parkingculture}</p></div>
			<div class='rContainer'><p class='width'><b>• 애견동반 가능 여부</b></p><p>${info.chkpetculture}</p></div>
			<div class='rContainer'><p class='width'><b>• 문의 및 안내</b></p><p>${info.infocenterculture}</p></div>
		</c:if>
		<c:if test="${contentTypeId eq '15'}">
			<div class='rContainer'><p class='width'><b>• 예매처</b></p><p>${info.bookingplace}</p></div>
			<div class='rContainer'><p class='width'><b>• 이용요금</b></p><p>${info.usetimefestival}</p></div>
			<div class='rContainer'><p class='width'><b>• 행사 시작일</b></p><p>${info.eventstartdate}</p></div>
			<div class='rContainer'><p class='width'><b>• 행사 종료일</b></p><p>${info.eventenddate}</p></div>
			<div class='rContainer'><p class='width'><b>• 공연시간</b></p><p>${info.playtime}</p></div>
			<div class='rContainer'><p class='width'><b>• 행사장 위치 안내</b></p><p>${info.placeinfo}</p></div>
			<div class='rContainer'><p class='width'><b>• 부대시설</b></p><p>${info.subevent}</p></div>
			<div class='rContainer'><p class='width'><b>• 주관사 정보</b></p><p>${info.sponsor2}</p></div>
		</c:if>
		<c:if test="${contentTypeId eq '25'}">
			<div class='rContainer'><p class='width'><b>• 코스 총거리</b></p><p>${info.distance}</p></div>
			<div class='rContainer'><p class='width'><b>• 코스 일정</b></p><p>${info.schedule}</p></div>
			<div class='rContainer'><p class='width'><b>• 총 소요시간</b></p><p>${info.taketime}</p></div>
			<div class='rContainer'><p class='width'><b>• 문의 및 안내</b></p><p>${info.infocentertourcourse}</p></div>
		</c:if>
		<c:if test="${contentTypeId eq '28'}">
			<div class='rContainer'><p class='width'><b>• 체험 가능 연령</b></p><p>${info.expagerangeleports}</p></div>
			<div class='rContainer'><p class='width'><b>• 이용요금</b></p><p>${info.usefeeleports}</p></div>
			<div class='rContainer'><p class='width'><b>• 휴무</b></p><p>${info.restdateleports}</p></div>
			<div class='rContainer'><p class='width'><b>• 주차 가능 여부</b></p><p>${info.parkingleports}</p></div>
			<div class='rContainer'><p class='width'><b>• 예약 안내</b></p><p>${info.reservation}</p></div>
			<div class='rContainer'><p class='width'><b>• 문의 및 안내</b></p><p>${info.infocenterleports}</p></div>
		</c:if>		
		<c:if test="${contentTypeId eq '32'}">
			<div class='rContainer'><p class='width'><b>• 입실 시간</b></p><p>${info.checkintime}</p></div>
			<div class='rContainer'><p class='width'><b>• 퇴실 시간</b></p><p>${info.checkouttime}</p></div>
			<div class='rContainer'><p class='width'><b>• 객실 유형</b></p><p>${info.roomtype}</p></div>
			<div class='rContainer'><p class='width'><b>• 주차 가능 여부</b></p><p>${info.parkinglodging}</p></div>
			<div class='rContainer'><p class='width'><b>• 픽업 서비스</b></p><p>${info.pickup}</p></div>
			<div class='rContainer'><p class='width'><b>• 바베큐장 여부</b></p><p>${info.barbecue}</p></div>
			<div class='rContainer'><p class='width'><b>• 부대시설 (기타)</b></p><p>${info.subfacility}</p></div>
			<div class='rContainer'><p class='width' style="color: red;"><b>• 환불 규정</b></p><p>${info.refundregulation}</p></div>
			<div class='rContainer'><p class='width'><b>• 예약 안내</b></p><p>${info.reservationlodging}</p></div>
			<div class='rContainer'><p class='width'><b>• 문의 및 안내</b></p><p>${info.infocenterlodging}</p></div>
		</c:if>		
		<c:if test="${contentTypeId eq '38'}">
			<div class='rContainer'><p class='width'><b>• 영업시간</b></p><p>${info.opentime}</p></div>
			<div class='rContainer'><p class='width'><b>• 휴무</b></p><p>${info.restdateshopping}</p></div>
			<div class='rContainer'><p class='width'><b>• 매장 안내</b></p><p>${info.shopguide}</p></div>
			<div class='rContainer'><p class='width'><b>• 애견동반 가능 여부</b></p><p>${info.chkpetshopping}</p></div>
			<div class='rContainer'><p class='width'><b>• 문의 및 안내</b></p><p>${info.infocentershopping}</p></div>
		</c:if>
		<c:if test="${contentTypeId eq '39'}">
			<div class='rContainer'><p class='width'><b>• 영업시간</b></p><p>${info.opentimefood}</p></div>
			<div class='rContainer'><p class='width'><b>• 휴무</b></p><p>${info.restdateshopping}</p></div>
			<div class='rContainer'><p class='width'><b>• 대표 메뉴</b></p><p>${info.firstmenu}</p></div>
			<div class='rContainer'><p class='width'><b>• 포장 가능 여부</b></p><p>${info.packing}</p></div>
			<div class='rContainer'><p class='width'><b>• 예약 안내</b></p><p>${info.restdatefood}</p></div>
			<div class='rContainer'><p class='width'><b>• 할인 정보</b></p><p>${info.discountinfofood}</p></div>
			<div class='rContainer'><p class='width'><b>• 문의 및 안내</b></p><p>${info.infocenterfood}</p></div>
		</c:if>
	</div><br>
	<hr style="width:1200px; border: 0.5px solid #eee;">
	<div class="vContainer">
		<div class="rContainer">
			<p class="info">🟣 방문 후기</p><div class='reviewW' id="modal-open">후기 남기기</div>
		</div><br>
	</div>
<div> 
  <div class="popup-wrap" id="popup">
    <div class="popup">
      <div class="popup-head">	
          <span class="head-title">REVIEW</span>
      </div>
      <div class="popup-body">	
        <div class="body-content">
          <div class="body-titlebox">
            <h2>${list.title}</h2>
          </div>
          <div class="body-contentbox">
            <input type="text"  id="review" name="review" placeholder="후기를 작성해주세요">
          </div>
        </div>
      </div>
      <div class="popup-foot">
        <span class="pop-btn confirm" id="confirm">확인</span>
        <span class="pop-btn close" id="close">창 닫기</span>
      </div>
    </div>
   </div>
   <c:if test="${not empty reList}">
   	   <div>
			<c:forEach var="item" items="${reList}">
		   <div class="rContainer height">
				<p id="wid">${item.id}</p>
				<c:if test="${item.id eq LoginId}">
					<p id="update">수정</p>
					<p id="delete" >삭제</p>
				</c:if>
		   </div>
		   <div class="rContainer height">
			   	<p id="content">${item.review}</p>
			   	<p id="date">${item.time}</p>
		   </div>
		   <hr style="width:1200px; border:0.5px solid #eee; margin: 10px 0px;">
		   </c:forEach>
	   </div>
   </c:if>
   <c:if test="${empty reList}">
		<div class="container">아직 등록된 후기가 없습니다.<br>새로운 후기를 작성해보세요.</div>
		<br><br>
   </c:if>
</div>
</div>
</body>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script> 
    AOS.init(); 
</script>
</html>