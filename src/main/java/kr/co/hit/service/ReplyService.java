package kr.co.hit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hit.dao.ReplyDao;
import kr.co.hit.dto.ReplyDto;

@Service
public class ReplyService {

	@Autowired
	private ReplyDao replyDao;
	
	public List<ReplyDto> getReplies(int board_no){
		return replyDao.selectByBoardNo(board_no);
	}
	
	public void saveReply(ReplyDto reply) {
		
		replyDao.insert(reply);
	}
	
	
}
