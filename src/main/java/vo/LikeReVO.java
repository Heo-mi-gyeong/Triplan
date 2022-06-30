package vo;

import lombok.Data;

@Data
public class LikeReVO {
	private String id;
	private String contentTypeId;
	private String contentId;
	private String review;
	private String time;
}
