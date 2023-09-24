package kr.co.hit.dao;

import java.util.List;

import kr.co.hit.dto.MessageDto;

public interface MessageDao {

	public List<MessageDto> selectMessageList(String id);
	public int sendMessage(MessageDto dto);
	public List<MessageDto> selectSendList(String id);
	public int deleteMessage(List<Integer> checkArr);
	public MessageDto detailMessage(int m_no);
	
}
