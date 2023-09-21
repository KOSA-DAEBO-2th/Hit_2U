package kr.co.hit.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hit.dao.MainDao;
import kr.co.hit.dto.MainDto;

@Service
public class MainService implements MainDao{

	@Autowired
	private SqlSession sqlsession;


	public List<MainDto> CommunityMainList(HashMap map) {
		
		MainDao dao = sqlsession.getMapper(MainDao.class);
		return dao.CommunityMainList(map);
	}

	public List<MainDto> QnaMainList(HashMap map) {
		
		MainDao dao = sqlsession.getMapper(MainDao.class);

		 return dao.QnaMainList(map);
	}

	public List<MainDto> MarketMainList(HashMap map) {
		
		MainDao dao = sqlsession.getMapper(MainDao.class);
		return dao.MarketMainList(map);
		  
	}

}
