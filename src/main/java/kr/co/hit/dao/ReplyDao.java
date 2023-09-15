package kr.co.hit.dao;

import java.util.List;

import kr.co.hit.dto.ReplyDto;

public interface ReplyDao {
	
	List<ReplyDto> selectByBoardNo(int board_no);

	void insert(ReplyDto reply);
	
}
