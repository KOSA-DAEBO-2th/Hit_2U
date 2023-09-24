package kr.co.hit.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hit.dao.MessageDao;
import kr.co.hit.dto.MessageDto;

@Service
public class MessageService implements MessageDao{
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<MessageDto> selectMessageList(String id) {
		MessageDao dao = sqlsession.getMapper(MessageDao.class);
		List<MessageDto> list = new ArrayList<MessageDto>();
		list = dao.selectMessageList(id);
		return list;
	}

	@Override
	public int sendMessage(MessageDto dto) {
		int res = 0;
		MessageDao dao = sqlsession.getMapper(MessageDao.class);
		res = dao.sendMessage(dto);
		return res;
	}

	@Override
	public List<MessageDto> selectSendList(String id) {
		MessageDao dao = sqlsession.getMapper(MessageDao.class);
		List<MessageDto> list = new ArrayList<MessageDto>();
		list = dao.selectSendList(id);
		return list;
	}

	@Override
	public int deleteMessage(List<Integer> checkArr) {
		MessageDao dao = sqlsession.getMapper(MessageDao.class);
		System.out.println("========dao============");
		for(int i=0; i<checkArr.size(); i++) {
			System.out.println(checkArr.get(i));
		}
		int res = dao.deleteMessage(checkArr);
		return res;
	}

	@Override
	public MessageDto detailMessage(int m_no) {
		MessageDao dao = sqlsession.getMapper(MessageDao.class);
		MessageDto dto = dao.detailMessage(m_no);
		return dto;
	}
	
	

}
