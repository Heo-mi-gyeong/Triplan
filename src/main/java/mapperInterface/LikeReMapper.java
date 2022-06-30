package mapperInterface;

import java.util.List;

import vo.HotVO;
import vo.LikeReVO;

public interface LikeReMapper {
	List<LikeReVO> likeSelect(LikeReVO vo);
	List<LikeReVO> reviewSelect(LikeReVO vo);
	List<LikeReVO> likeList(LikeReVO vo);
	LikeReVO reviewCheck(LikeReVO vo);
	List<HotVO> hotMax();
	HotVO hotSelect(HotVO vo);
	int hotInsert(HotVO vo);
	int hotUpdate(HotVO vo);
	int reviewUpdate(LikeReVO vo);
	int reviewDelete(LikeReVO vo);
	int reviewInsert(LikeReVO vo);
	int reviewCount(LikeReVO vo);
	int likeInsert(LikeReVO vo);
	int likeDelete(LikeReVO vo);
}
