package kr.co.hit.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hit.dao.MemberDao;
import kr.co.hit.dto.MemberDto;

@Service
public class JoinService {
	
	@Autowired
	private SqlSession sqlsession;

	public int insertMember(MemberDto dto) {
		int result =0;
		MemberDao memberDao = sqlsession.getMapper(MemberDao.class);
		result = memberDao.insertMember(dto);
		return result;
	}

	public int checkId(String id) {
		int result =0;
		MemberDao memberDao = sqlsession.getMapper(MemberDao.class);
		result = memberDao.checkId(id);
		return result;
	}

	public MemberDto naverChk(String newId) {
		MemberDto dto = new MemberDto();
		MemberDao memberDao = sqlsession.getMapper(MemberDao.class);
		dto = memberDao.getMember(newId);
		return dto;
	}
	
}
