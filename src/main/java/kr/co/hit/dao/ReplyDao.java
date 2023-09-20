package kr.co.hit.dao;

import java.util.List;

import kr.co.hit.dto.ReplyDto;

public interface ReplyDao {
	
	List<ReplyDto> getReplies(int b_no);

	void addReply(ReplyDto reply);
	
	void updateBreply(int b_no);
}
