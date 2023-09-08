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

	
	public MemberDto getUserInfo() {
		ProfileDao dao = sqlsession.getMapper(ProfileDao.class);
		MemberDto dto = dao.getUserInfo();
		return dto;
	}


	@Override
	public int updateInfo() {
		// TODO Auto-generated method stub
		return 0;
	}


	
}
