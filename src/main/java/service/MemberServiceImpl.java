package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapperInterface.MemberMapper;
import vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberMapper mapper;

	@Override
	public List<MemberVO> selectList() {
		return mapper.selectList();
	}
	@Override
	public MemberVO selectOne(MemberVO vo) {
		return mapper.selectOne(vo);
	}
	
	@Override
	public MemberVO selectni(MemberVO vo) {
		return mapper.selectni(vo);
	}
	@Override
	public int insert(MemberVO vo) {
		return mapper.insert(vo);
	}
	@Override
	public int update(MemberVO vo) {
		return mapper.update(vo);
	}
	@Override
	public int delete(MemberVO vo) {
		return mapper.delete(vo);
	}	
	
} //class
