package kr.co.hit.dao;

import java.util.List;

import kr.co.hit.dto.MessageDto;

public interface MessageDao {

	public List<MessageDto> selectMessageList();
	public int sendMessage(MessageDto dto);
	public List<MessageDto> selectSendList();
	
	
}
