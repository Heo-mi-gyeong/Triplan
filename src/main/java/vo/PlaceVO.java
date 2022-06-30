package vo;

import lombok.Data;

@Data
public class PlaceVO {
	private String title, tel, addr1, firstimage, overview, homepage,
	 createdtime, mapx, mapy;
	
	private String code;
	private String name;
	
	private String cat1;
	private String cat2;
	private String cat3;
	
	private String contentid;
}
