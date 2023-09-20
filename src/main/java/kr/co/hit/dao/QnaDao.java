package kr.co.hit.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.hit.dto.CommunityDto;
import kr.co.hit.dto.QnaDto;

public interface QnaDao {
	// insert Qna
	public void InsertQna(QnaDto dto);

	// Qna detail
	public QnaDto getQnaDetail(int b_no);

	// update Qna
	public int updateQna(QnaDto dto);

	// select all with paging
	public List<QnaDto> QnaList(HashMap map);

	// count Qna list
	public int getQnaCount();

	// delete
	public int deleteQna(int b_no);

//		public int deleteCommunity(CommunityDto dto);



//		주어진 토픽 이름으로 토픽 번호를 조회하는 DAO 메서드
	public int getTopicNoByTopicName2(String topic_name);

	public List<QnaDto> getPostsByTopic2(HashMap map);

	public int getPostCountByTopic2(int topicNo);

	public List<QnaDto> searchByTitle2(String title);

}
