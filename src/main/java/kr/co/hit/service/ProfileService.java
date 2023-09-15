package kr.co.hit.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hit.dao.MemberDao;
import kr.co.hit.dao.ProfileDao;
import kr.co.hit.dto.MemberDto;

@Service
public class ProfileService implements ProfileDao{
	
	@Autowired
	private SqlSession sqlsession;

	
	public MemberDto getUserInfo(String id) {
		ProfileDao dao = sqlsession.getMapper(ProfileDao.class);
		MemberDto dto = dao.getUserInfo(id);
		return dto;
	}


	@Override
	public int updateInfo(MemberDto dto) {
		ProfileDao dao = sqlsession.getMapper(ProfileDao.class);
		dao.updateInfo(dto);
		return 0;
	}


	
}
