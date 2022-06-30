package com.ncs.green;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.LikeReService;
import vo.HotVO;
import vo.LikeReVO;
import vo.PlaceVO;
import vo.introduceVO;

@Controller
public class PlaceController {
	@Autowired
	LikeReService service;

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView search(HttpServletResponse response, HttpServletRequest request,ModelAndView mv, String keyword,
			String contentTypeId,LikeReVO rvo) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		StringBuffer sb = new StringBuffer("http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?");
		
		sb.append(
				"ServiceKey=LRIaWeOB%2FVcYs1ZyirznQ7pRLRCriW6QZzTBZ0d4ypZUcttUjJAimDRgv8nZn%2BIR3R%2F0hNgf5qq1L8WCXuV3BA%3D%3D");
		sb.append("&contentTypeId="+contentTypeId);
		sb.append("&keyword="+URLEncoder.encode(keyword, "utf-8"));
		sb.append("&listYN=Y");
		sb.append("&arrange=A");
		sb.append("&MobileOS=ETC");
		sb.append("&MobileApp=AppTest");
		sb.append("&pageNo=1");
		sb.append("&numOfRows=20");

		URL url = new URL(sb.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestProperty("Content-Type", "application/xml");
		conn.connect();

		SAXBuilder builder = new SAXBuilder();
		org.jdom2.Document document = builder.build(conn.getInputStream());
		Element root = document.getRootElement();
		Element body = root.getChild("body");
		Element items = body.getChild("items");
		List<Element> item_list = items.getChildren("item");

		HttpSession session = request.getSession();
		session.setAttribute("keyword",keyword);
		
		PlaceVO[] ar = new PlaceVO[item_list.size()];

		int i = 0; int[] count = new int[20];
		for (Element item : item_list) {

			String title = item.getChildText("title");
			String contentid = item.getChildText("contentid");
			String addr1 = item.getChildText("addr1");
			String firstimage = item.getChildText("firstimage");
			String mapx = item.getChildText("mapx");
			String mapy = item.getChildText("mapy");

			PlaceVO vo = new PlaceVO();

			vo.setTitle(title);
			vo.setContentid(contentid);
			vo.setAddr1(addr1);
			vo.setFirstimage(firstimage);
			vo.setMapx(mapx);
			vo.setMapy(mapy);

			rvo.setContentId(contentid);
			count[i]=service.reviewCount(rvo);
			ar[i] = vo;
			i++;
		}
		mv.addObject("list", ar);
		mv.addObject("count", count);
		mv.addObject("contentTypeId", contentTypeId);
		mv.setViewName("trip/searchForm");
		return mv;
	}
	@RequestMapping(value = "/midOp", method = RequestMethod.GET)
	public ModelAndView midOp(HttpServletResponse response, ModelAndView mv, String cat1, String cat2,
			String contentTypeId) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		StringBuffer sb = new StringBuffer("http://api.visitkorea.or.kr/openapi/service/rest/KorService/categoryCode?");

		sb.append(
				"ServiceKey=LRIaWeOB%2FVcYs1ZyirznQ7pRLRCriW6QZzTBZ0d4ypZUcttUjJAimDRgv8nZn%2BIR3R%2F0hNgf5qq1L8WCXuV3BA%3D%3D");
		sb.append("&cat1=" + cat1);
		sb.append("&cat2=" + cat2);
		sb.append("&contentTypeId=" + contentTypeId);
		sb.append("&MobileOS=ETC");
		sb.append("&MobileApp=AppTest");
		sb.append("&pageNo=1");
		sb.append("&numOfRows=19");

		URL url = new URL(sb.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestProperty("Content-Type", "application/xml");
		conn.connect();

		SAXBuilder builder = new SAXBuilder();
		org.jdom2.Document document = builder.build(conn.getInputStream());
		Element root = document.getRootElement();
		// 루트의 자식!이니까 child를 얻어야한다!
		Element body = root.getChild("body");
		// body안에 있는 items라는 엘리먼트를 얻어야한다.
		Element items = body.getChild("items");
		// items안에있는 자식들을 가져오자 ! 여러개니까 리스트여야겠지 ? 타입은 엘리먼트 !!
		List<Element> item_list = items.getChildren("item");

		PlaceVO[] ar = new PlaceVO[item_list.size()];

		int i = 0;
		for (Element item : item_list) {

			String code = item.getChildText("code");
			String name = item.getChildText("name");

			PlaceVO vo = new PlaceVO();

			vo.setCode(code);
			vo.setName(name);

			ar[i++] = vo;
		}
		mv.addObject("list", ar);
		mv.setViewName("jsonView");
		return mv;
	}

	@RequestMapping(value = "/codeOp", method = RequestMethod.GET)
	public ModelAndView codeOp(HttpServletResponse response, ModelAndView mv, String areaCode) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		StringBuffer sb = new StringBuffer("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?");

		sb.append(
				"ServiceKey=LRIaWeOB%2FVcYs1ZyirznQ7pRLRCriW6QZzTBZ0d4ypZUcttUjJAimDRgv8nZn%2BIR3R%2F0hNgf5qq1L8WCXuV3BA%3D%3D");
		sb.append("&areaCode=" + areaCode);
		sb.append("&MobileOS=ETC");
		sb.append("&MobileApp=AppTest");
		sb.append("&pageNo=1");
		sb.append("&numOfRows=10");

		URL url = new URL(sb.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestProperty("Content-Type", "application/xml");
		conn.connect();

		SAXBuilder builder = new SAXBuilder();
		org.jdom2.Document document = builder.build(conn.getInputStream());
		Element root = document.getRootElement();
		Element body = root.getChild("body");
		Element items = body.getChild("items");
		List<Element> item_list = items.getChildren("item");

		PlaceVO[] ar = new PlaceVO[item_list.size()];

		int i = 0;
		for (Element item : item_list) {

			String code = item.getChildText("code");
			String name = item.getChildText("name");

			PlaceVO vo = new PlaceVO();

			vo.setCode(code);
			vo.setName(name);

			ar[i++] = vo;
		}
		mv.addObject("list", ar);
		mv.setViewName("jsonView");
		return mv;
	}

	@RequestMapping(value = "/catSearch", method = RequestMethod.GET)
	public ModelAndView catSearch(HttpServletRequest request,ModelAndView mv, String contentTypeId, String areaCode, String sigunguCode,
			PlaceVO pvo, HotVO hvo,LikeReVO rvo) throws Exception {

		if(hvo.getSigunguCode()!=null) {
			if(service.hotSelect(hvo)==null) {
				service.hotInsert(hvo);
			}else {
				HotVO nhvo =  service.hotSelect(hvo);
				int count = nhvo.getCount();
				hvo.setCount(count+1);
				service.hotUpdate(hvo);
			}
		}
		
		HttpSession session = request.getSession();
		session.removeAttribute("areaCode");
		session.removeAttribute("sigunguCode");
		session.removeAttribute("areaName");
		session.removeAttribute("sigunguName");
		
		StringBuffer sb = new StringBuffer(
				"http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?");

		sb.append(
				"ServiceKey=LRIaWeOB%2FVcYs1ZyirznQ7pRLRCriW6QZzTBZ0d4ypZUcttUjJAimDRgv8nZn%2BIR3R%2F0hNgf5qq1L8WCXuV3BA%3D%3D");
		sb.append("&contentTypeId=" + contentTypeId);
		sb.append("&areaCode=" + areaCode);
		sb.append("&sigunguCode=" + sigunguCode);
		
		if(pvo.getCat1()!=null) {
			sb.append("&cat1=" + pvo.getCat1());
		}if(pvo.getCat2()!=null) {
			sb.append("&cat2=" + pvo.getCat2());
		}if(pvo.getCat3()!=null) {
			sb.append("&cat3=" + pvo.getCat3());
		}
		sb.append("&MobileOS=ETC");
		sb.append("&MobileApp=AppTest");
		sb.append("&pageNo=1");
		sb.append("&numOfRows=20");

		URL url = new URL(sb.toString());

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		conn.setRequestProperty("Content-Type", "application/xml");

		conn.connect();

		SAXBuilder builder = new SAXBuilder();

		org.jdom2.Document document = builder.build(conn.getInputStream());

		Element root = document.getRootElement();
		Element body = root.getChild("body");
		Element items = body.getChild("items");
		List<Element> item_list = items.getChildren("item");

		PlaceVO[] ar = new PlaceVO[item_list.size()];

		int i = 0;  int[] count = new int[20];
		for (Element item : item_list) {

			String title = item.getChildText("title");
			String contentid = item.getChildText("contentid");
			String addr1 = item.getChildText("addr1");
			String firstimage = item.getChildText("firstimage");
			String mapx = item.getChildText("mapx");
			String mapy = item.getChildText("mapy");
			String tel = item.getChildText("tel");

			PlaceVO vo = new PlaceVO();

			vo.setTitle(title);
			vo.setContentid(contentid);
			vo.setAddr1(addr1);
			vo.setFirstimage(firstimage);
			vo.setMapx(mapx);
			vo.setMapy(mapy);
			vo.setTel(tel);
			rvo.setContentId(contentid);
			count[i]=service.reviewCount(rvo);
			ar[i] = vo;
			i++;
		}
		mv.addObject("list", ar);
		mv.addObject("count", count);
		mv.addObject("areaName", hvo.getAreaName());
		mv.addObject("sigunguName", hvo.getSigunguName());
		mv.addObject("contentTypeId", contentTypeId);
		mv.setViewName("trip/selectForm");
		return mv;
	}

	@RequestMapping(value = "/contentTypeId", method = RequestMethod.GET)
	public ModelAndView contentTypeId(HttpSession session,HttpServletRequest request,ModelAndView mv, String contentTypeId, LikeReVO rvo,HotVO hvo) throws Exception {
		StringBuffer sb = new StringBuffer(
				"http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?");

		sb.append(
				"ServiceKey=LRIaWeOB%2FVcYs1ZyirznQ7pRLRCriW6QZzTBZ0d4ypZUcttUjJAimDRgv8nZn%2BIR3R%2F0hNgf5qq1L8WCXuV3BA%3D%3D");
		
		if(session.getAttribute("areaCode")==null) {
			session.setAttribute("areaCode",hvo.getAreaCode());
			session.setAttribute("sigunguCode",hvo.getSigunguCode());
			session.setAttribute("areaName",hvo.getAreaName());
			session.setAttribute("sigunguName",hvo.getSigunguName());
		}
		
		if(session.getAttribute("areaCode")!=null) {
			sb.append("&areaCode=" + session.getAttribute("areaCode"));
			sb.append("&sigunguCode=" + session.getAttribute("sigunguCode"));
			mv.addObject("areaName", session.getAttribute("areaName"));
			mv.addObject("sigunguName", session.getAttribute("sigunguName"));
		}
		sb.append("&contentTypeId=" + contentTypeId);
		sb.append("&MobileOS=ETC");
		sb.append("&MobileApp=AppTest");
		sb.append("&pageNo=1");
		sb.append("&numOfRows=20");

		URL url = new URL(sb.toString());

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		conn.setRequestProperty("Content-Type", "application/xml");

		conn.connect();

		SAXBuilder builder = new SAXBuilder();

		org.jdom2.Document document = builder.build(conn.getInputStream());

		Element root = document.getRootElement();
		Element body = root.getChild("body");
		Element items = body.getChild("items");
		List<Element> item_list = items.getChildren("item");

		PlaceVO[] ar = new PlaceVO[item_list.size()];

		int i = 0; int[] count = new int[20];
		for (Element item : item_list) {

			String title = item.getChildText("title");
			String contentid = item.getChildText("contentid");
			String addr1 = item.getChildText("addr1");
			String firstimage = item.getChildText("firstimage");
			String mapx = item.getChildText("mapx");
			String mapy = item.getChildText("mapy");
			String tel = item.getChildText("tel");

			PlaceVO vo = new PlaceVO();

			vo.setTitle(title);
			vo.setContentid(contentid);
			vo.setAddr1(addr1);
			vo.setFirstimage(firstimage);
			vo.setMapx(mapx);
			vo.setMapy(mapy);
			vo.setTel(tel);
			rvo.setContentId(contentid);
			count[i]=service.reviewCount(rvo);
			ar[i] = vo;
			i++;
		}
		mv.addObject("list", ar);
		mv.addObject("count", count);
		mv.addObject("areaName", hvo.getAreaName());
		mv.addObject("sigunguName", hvo.getSigunguName());
		mv.addObject("contentTypeId", contentTypeId);
		mv.setViewName("trip/selectForm");
		return mv;
	}

	@RequestMapping(value = "/likeList", method = RequestMethod.GET)
	public ModelAndView likeList(ModelAndView mv, String contentTypeId, LikeReVO rvo) throws Exception {

		int j = 0;  int[] count = new int[service.likeList(rvo).size()];
		PlaceVO[] ar = new PlaceVO[service.likeList(rvo).size()];
		for (LikeReVO i : service.likeList(rvo)) {
			StringBuffer sb = new StringBuffer("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?");
			
			sb.append(
					"ServiceKey=LRIaWeOB%2FVcYs1ZyirznQ7pRLRCriW6QZzTBZ0d4ypZUcttUjJAimDRgv8nZn%2BIR3R%2F0hNgf5qq1L8WCXuV3BA%3D%3D");
			//sb.append("&contentTypeId="+i.getContentTypeId());
			sb.append("&contentId="+i.getContentId());
			sb.append("&pageNo=1");
			sb.append("&numOfRows=1");
			sb.append("&defaultYN=Y");
			sb.append("&firstImageYN=Y");
			sb.append("&addrinfoYN=Y");
			sb.append("&MobileOS=ETC");
			sb.append("&MobileApp=AppTest");
			
			URL url = new URL(sb.toString());

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestProperty("Content-Type", "application/xml");

			conn.connect();

			SAXBuilder builder = new SAXBuilder();

			org.jdom2.Document document = builder.build(conn.getInputStream());

			Element root = document.getRootElement();
			Element body = root.getChild("body");
			Element items = body.getChild("items");
			Element item_list = items.getChild("item");

		    String title = item_list.getChildText("title"); 
		    String contentid = item_list.getChildText("contentid");
		    String addr1 =item_list.getChildText("addr1");
		    String firstimage =item_list.getChildText("firstimage"); 

		    PlaceVO vo = new PlaceVO();
		  
		    vo.setTitle(title); 
		    vo.setAddr1(addr1); 
		    vo.setContentid(contentid);
		    vo.setFirstimage(firstimage);
		  
		    rvo.setContentId(contentid);
		    count[j]=service.reviewCount(rvo);
		    ar[j] = vo;
		    j++;
		}
		mv.addObject("list", ar); 
		mv.addObject("count", count);
		mv.addObject("contentTypeId", contentTypeId);
		mv.setViewName("trip/LikeForm");
		return mv;
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView detail(ModelAndView mv, HttpServletRequest request, String contentId, String contentTypeId,
			LikeReVO rvo) throws Exception {
		StringBuffer sb = new StringBuffer("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?");

		sb.append(
				"ServiceKey=LRIaWeOB%2FVcYs1ZyirznQ7pRLRCriW6QZzTBZ0d4ypZUcttUjJAimDRgv8nZn%2BIR3R%2F0hNgf5qq1L8WCXuV3BA%3D%3D");
		sb.append("&contentId=" + contentId);
		sb.append("&defaultYN=Y");
		sb.append("&firstImageYN=Y");
		sb.append("&addrinfoYN=Y");
		sb.append("&mapinfoYN=Y");
		sb.append("&overviewYN=Y");
		sb.append("&MobileOS=ETC");
		sb.append("&MobileApp=AppTest");
		sb.append("&pageNo=1");
		sb.append("&numOfRows=1");

		URL url = new URL(sb.toString());

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		conn.setRequestProperty("Content-Type", "application/xml");

		conn.connect();

		SAXBuilder builder = new SAXBuilder();

		org.jdom2.Document document = builder.build(conn.getInputStream());

		Element root = document.getRootElement();
		Element body = root.getChild("body");
		Element items = body.getChild("items");
		List<Element> item_list = items.getChildren("item");

		PlaceVO[] ar = new PlaceVO[item_list.size()];

		for (Element item : item_list) {

			String title = item.getChildText("title");
			String addr1 = item.getChildText("addr1");
			String firstimage = item.getChildText("firstimage");
			String overview = item.getChildText("overview");
			String homepage = item.getChildText("homepage");

			PlaceVO vo = new PlaceVO();

			vo.setTitle(title);
			vo.setAddr1(addr1);
			vo.setFirstimage(firstimage);
			vo.setOverview(overview);
			vo.setHomepage(homepage);
			ar[0] = vo;
		}
		mv.addObject("list", ar[0]);

		StringBuffer sb2 = new StringBuffer("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?");

		sb2.append(
				"ServiceKey=LRIaWeOB%2FVcYs1ZyirznQ7pRLRCriW6QZzTBZ0d4ypZUcttUjJAimDRgv8nZn%2BIR3R%2F0hNgf5qq1L8WCXuV3BA%3D%3D");
		sb2.append("&contentId=" + contentId);
		sb2.append("&contentTypeId=" + contentTypeId);
		sb2.append("&MobileOS=ETC");
		sb2.append("&MobileApp=AppTest");
		sb2.append("&pageNo=1");
		sb2.append("&numOfRows=1");

		URL url2 = new URL(sb2.toString());

		HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();

		conn2.setRequestProperty("Content-Type", "application/xml");

		conn2.connect();

		SAXBuilder builder2 = new SAXBuilder();

		org.jdom2.Document document2 = builder2.build(conn2.getInputStream());

		Element root2 = document2.getRootElement();
		Element body2 = root2.getChild("body");
		Element items2 = body2.getChild("items");
		List<Element> item_list2 = items2.getChildren("item");

		introduceVO[] ar2 = new introduceVO[item_list2.size()];

		for (Element item : item_list2) {
			if (contentTypeId.equals("12")) {
				String chkpet = item.getChildText("chkpet");
				String expguide = item.getChildText("expguide");
				String infocenter = item.getChildText("infocenter");
				String parking = item.getChildText("parking");
				String restdate = item.getChildText("restdate");
				String usetime = item.getChildText("usetime");

				introduceVO vo2 = new introduceVO();

				vo2.setChkpet(chkpet);
				vo2.setExpguide(expguide);
				vo2.setInfocenter(infocenter);
				vo2.setParking(parking);
				vo2.setRestdate(restdate);
				vo2.setUsetime(usetime);

				ar2[0] = vo2;
			} else if (contentTypeId.equals("14")) {
				String chkpetculture = item.getChildText("chkpetculture");
				String infocenterculture = item.getChildText("infocenterculture");
				String parkingculture = item.getChildText("parkingculture");
				String restdateculture = item.getChildText("restdateculture");
				String usefee = item.getChildText("usefee");
				String usetimeculture = item.getChildText("usetimeculture");

				introduceVO vo2 = new introduceVO();

				vo2.setChkpetculture(chkpetculture);
				vo2.setInfocenterculture(infocenterculture);
				vo2.setParkingculture(parkingculture);
				vo2.setRestdateculture(restdateculture);
				vo2.setUsefee(usefee);
				vo2.setUsetimeculture(usetimeculture);

				ar2[0] = vo2;
			} else if (contentTypeId.equals("15")) {
				String bookingplace = item.getChildText("bookingplace");
				String eventenddate = item.getChildText("eventenddate");
				String eventstartdate = item.getChildText("eventstartdate");
				String placeinfo = item.getChildText("placeinfo");
				String playtime = item.getChildText("playtime");
				String sponsor2 = item.getChildText("sponsor2");
				String subevent = item.getChildText("subevent");
				String usetimefestival = item.getChildText("usetimefestival");

				introduceVO vo2 = new introduceVO();

				vo2.setBookingplace(bookingplace);
				vo2.setEventenddate(eventenddate);
				vo2.setEventstartdate(eventstartdate);
				vo2.setPlaceinfo(placeinfo);
				vo2.setPlaytime(playtime);
				vo2.setSponsor2(sponsor2);
				vo2.setSubevent(subevent);
				vo2.setUsetimefestival(usetimefestival);

				ar2[0] = vo2;
			} else if (contentTypeId.equals("25")) {
				String distance = item.getChildText("distance");
				String infocentertourcourse = item.getChildText("infocentertourcourse");
				String schedule = item.getChildText("schedule");
				String taketime = item.getChildText("taketime");

				introduceVO vo2 = new introduceVO();

				vo2.setDistance(distance);
				vo2.setInfocentertourcourse(infocentertourcourse);
				vo2.setSchedule(schedule);
				vo2.setTaketime(taketime);

				ar2[0] = vo2;
			} else if (contentTypeId.equals("28")) {
				String parkingleports = item.getChildText("parkingleports");
				String reservation = item.getChildText("reservation");
				String restdateleports = item.getChildText("restdateleports");
				String usefeeleports = item.getChildText("usefeeleports");
				String expagerangeleports = item.getChildText("expagerangeleports");
				String infocenterleports = item.getChildText("infocenterleports");

				introduceVO vo2 = new introduceVO();

				vo2.setParkingleports(parkingleports);
				vo2.setReservation(reservation);
				vo2.setRestdateleports(restdateleports);
				vo2.setUsefeeleports(usefeeleports);
				vo2.setExpagerangeleports(expagerangeleports);
				vo2.setInfocenterleports(infocenterleports);

				ar2[0] = vo2;
			} else if (contentTypeId.equals("32")) {
				String checkintime = item.getChildText("checkintime");
				String checkouttime = item.getChildText("checkouttime");
				String infocenterlodging = item.getChildText("infocenterlodging");
				String parkinglodging = item.getChildText("parkinglodging");
				String pickup = item.getChildText("pickup");
				String reservationlodging = item.getChildText("reservationlodging");
				String roomtype = item.getChildText("roomtype");
				String subfacility = item.getChildText("subfacility");
				String barbecue = item.getChildText("barbecue");
				String refundregulation = item.getChildText("refundregulation");

				introduceVO vo2 = new introduceVO();

				vo2.setCheckintime(checkintime);
				vo2.setCheckouttime(checkouttime);
				vo2.setInfocenterlodging(infocenterlodging);
				vo2.setParkinglodging(parkinglodging);
				vo2.setPickup(pickup);
				vo2.setReservationlodging(reservationlodging);
				vo2.setRoomtype(roomtype);
				vo2.setSubfacility(subfacility);
				vo2.setBarbecue(barbecue);
				vo2.setRefundregulation(refundregulation);

				ar2[0] = vo2;
			} else if (contentTypeId.equals("38")) {
				String chkpetshopping = item.getChildText("chkpetshopping");
				String infocentershopping = item.getChildText("infocentershopping");
				String opentime = item.getChildText("opentime");
				String restdateshopping = item.getChildText("restdateshopping");
				String shopguide = item.getChildText("shopguide");

				introduceVO vo2 = new introduceVO();

				vo2.setChkpetshopping(chkpetshopping);
				vo2.setInfocentershopping(infocentershopping);
				vo2.setOpentime(opentime);
				vo2.setRestdateshopping(restdateshopping);
				vo2.setShopguide(shopguide);

				ar2[0] = vo2;
			} else if (contentTypeId.equals("39")) {
				String discountinfofood = item.getChildText("discountinfofood");
				String firstmenu = item.getChildText("firstmenu");
				String infocenterfood = item.getChildText("infocenterfood");
				String opentimefood = item.getChildText("opentimefood");
				String packing = item.getChildText("packing");
				String reservationfood = item.getChildText("reservationfood");
				String restdatefood = item.getChildText("restdatefood");

				introduceVO vo2 = new introduceVO();

				vo2.setDiscountinfofood(discountinfofood);
				vo2.setFirstmenu(firstmenu);
				vo2.setInfocenterfood(infocenterfood);
				vo2.setOpentimefood(opentimefood);
				vo2.setPacking(packing);
				vo2.setReservationfood(reservationfood);
				vo2.setRestdatefood(restdatefood);

				ar2[0] = vo2;
			}
			mv.addObject("info", ar2[0]);
		}
		mv.addObject("reList", service.reviewSelect(rvo));
		mv.addObject("contentId", contentId);
		mv.addObject("contentTypeId", contentTypeId);
		mv.setViewName("trip/detail");
		return mv;
	}
}
