package vo;

import lombok.Data;

@Data
public class introduceVO {
	
	// 관광지변수
	String chkpet,expguide,infocenter,parking,restdate,usetime;

	//문화시설 변수
	String chkpetculture,
	infocenterculture,parkingculture,restdateculture,usefee,usetimeculture;

	//행사 공연 변수
	String bookingplace,eventenddate,eventstartdate,placeinfo,
	playtime,sponsor2,subevent,usetimefestival;
	
	//여행 코스 변수
	String distance,infocentertourcourse,schedule,taketime;
	
	//레포츠 변수
	String expagerangeleports,infocenterleports
	,parkingleports,reservation,restdateleports,usefeeleports;
	
	//숙박 변수
	String checkintime,checkouttime,
	infocenterlodging,parkinglodging,pickup,reservationlodging,
	roomtype,subfacility,barbecue,refundregulation;
	
	//쇼핑 변수
	String chkpetshopping,infocentershopping,opentime,restdateshopping,shopguide;
	
	//음식점 변수
	String discountinfofood,firstmenu,infocenterfood,opentimefood,packing,reservationfood,
	restdatefood;
	
}
