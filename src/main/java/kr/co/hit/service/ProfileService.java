package kr.co.hit.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hit.dao.ProfileDao;
import kr.co.hit.dto.MemberDto;
import kr.co.hit.dto.ProfileDto;

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


	@Override
	public List<ProfileDto> getWriteList(String id) {
		ProfileDao dao = sqlsession.getMapper(ProfileDao.class);
		List<ProfileDto> list = dao.getWriteList(id);
		return list;
	}


	@Override
	public List<ProfileDto> getReplyList(String id) {
		ProfileDao dao = sqlsession.getMapper(ProfileDao.class);
		List<ProfileDto> list = dao.getReplyList(id);
		return list;
	}


	@Override
	public List<ProfileDto> getCountWrite(String id) {
		ProfileDao dao = sqlsession.getMapper(ProfileDao.class);
		List<ProfileDto> dto = dao.getCountWrite(id);
		return dto;
	}


	@Override
	public List<ProfileDto> getCountReply(String id) {
		ProfileDao dao = sqlsession.getMapper(ProfileDao.class);
		List<ProfileDto> dto = dao.getCountReply(id);
		return dto;
	}


	
}
