package kr.co.hit.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hit.dao.CommunityDao;
import kr.co.hit.dao.ReplyDao;
import kr.co.hit.dto.ReplyDto;

@Service
public class ReplyService {

	@Autowired
	private SqlSession sqlSession;

	public List<ReplyDto> getReplies(int boardNo) {
		ReplyDao dao = sqlSession.getMapper(ReplyDao.class);
		return dao.getReplies(boardNo);
	}

	public void addReply(ReplyDto reply) {
		ReplyDao dao = sqlSession.getMapper(ReplyDao.class);
		dao.addReply(reply);
	}

	public void updateBreply(int b_no) {
		ReplyDao dao = sqlSession.getMapper(ReplyDao.class);
		dao.updateBreply(b_no);
		System.out.println("업데이트확인");
	}
}