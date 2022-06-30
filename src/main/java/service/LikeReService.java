package service;

import java.util.List;

import vo.HotVO;
import vo.LikeReVO;

public interface LikeReService {

		List<LikeReVO> likeSelect(LikeReVO vo);
		List<LikeReVO> likeList(LikeReVO vo);
		List<LikeReVO> reviewSelect(LikeReVO vo);
		List<HotVO> hotMax();
		LikeReVO reviewCheck(LikeReVO vo);
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
