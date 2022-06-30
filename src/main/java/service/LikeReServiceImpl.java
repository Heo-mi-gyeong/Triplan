package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapperInterface.LikeReMapper;
import vo.HotVO;
import vo.LikeReVO;

@Service
public class LikeReServiceImpl implements LikeReService{
	@Autowired
	LikeReMapper mapper;
	
	@Override
	public List<HotVO> hotMax() {
		return mapper.hotMax();
	}
	
	@Override
	public HotVO hotSelect(HotVO vo) {
		return mapper.hotSelect(vo);
	}
	
	@Override
	public int hotInsert(HotVO vo) {
		return mapper.hotInsert(vo);
	}
	
	@Override
	public int hotUpdate(HotVO vo) {
		return mapper.hotUpdate(vo);
	}
	
	@Override
	public List<LikeReVO> likeSelect(LikeReVO vo){
			return mapper.likeSelect(vo);
	}
	
	@Override
	public List<LikeReVO> likeList(LikeReVO vo){
			return mapper.likeList(vo);
	}
	
	@Override
	public List<LikeReVO> reviewSelect(LikeReVO vo){
			return mapper.reviewSelect(vo);
	}
	
	@Override
	public int reviewCount(LikeReVO vo) {
		return mapper.reviewCount(vo);
	}
	
	@Override
	public LikeReVO reviewCheck(LikeReVO vo) {
		return mapper.reviewCheck(vo);
	}

	@Override
	public int reviewUpdate(LikeReVO vo) {
		return mapper.reviewUpdate(vo);
	}
	@Override
	public int reviewDelete(LikeReVO vo) {
		return mapper.reviewDelete(vo);
	}
	
	@Override
	public int reviewInsert(LikeReVO vo) {
		return mapper.reviewInsert(vo);
	}
	
	@Override
	public int likeInsert(LikeReVO vo) {
		return mapper.likeInsert(vo);
	}
	
	@Override
	public int likeDelete(LikeReVO vo) {
		return mapper.likeDelete(vo);
	}
}
