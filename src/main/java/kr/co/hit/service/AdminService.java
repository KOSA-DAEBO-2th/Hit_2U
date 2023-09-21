package kr.co.hit.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hit.dao.AdminDao;
import kr.co.hit.dto.AdminDto;

@Service
public class AdminService implements AdminDao {
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<AdminDto> searchBoard(String search_key) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<AdminDto> list = dao.searchBoard(search_key);
		return list;
	}

	@Override
	public List<AdminDto> searchMember(String search_key) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<AdminDto> list = dao.searchMember(search_key);
		return list;
	}

	@Override
	public List<AdminDto> cntWeekBoard() {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<AdminDto> cnt = dao.cntWeekBoard();
		return cnt;
	}

	@Override
	public List<AdminDto> cntWeekReply() {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<AdminDto> cnt = dao.cntWeekReply();
		return cnt;
	}

	@Override
	public void delBoard(List<Integer> checkArr) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		dao.delBoard(checkArr);
	}

	@Override
	public void delMember(List<Integer> checkArr) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		dao.delMember(checkArr);
	}

	@Override
	public List<AdminDto> memberChart() {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<AdminDto> list = dao.memberChart();
		return list;
	}

	@Override
	public List<AdminDto> reportList() {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<AdminDto> list = dao.reportList();
		return list;
	}

	@Override
	public int changeRole(AdminDto dto) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		int res = dao.changeRole(dto);
		return res;
	}

}
