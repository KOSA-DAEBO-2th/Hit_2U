package kr.co.hit.dao;

import java.util.List;

import kr.co.hit.dto.MeetingDto;

public interface MeetingDao {
	
	public List<MeetingDto> selectMeetingList();
	public List<MeetingDto> selectMeetingCategoyList(String select);
	public List<MeetingDto> selectMeetingSearch(String search_target);
	public List<MeetingDto> selectMeetingPage(String search_target, int start, int limit);
	public List<MeetingDto> selectMeetingTopicList(String search_target, String topic, int start, int limit);
	public int getMeetingListCount(String search_target, String topic);
	public int getMeetingBoardNumber();
	public void increaseView(int boardIdx);
	public MeetingDto selectMeetingRead(int boardIdx);
	public void insert(MeetingDto dto);
	public void insertMeeting(MeetingDto dto);
	
	public List<MeetingDto> selectMeetingMember(int boardIdx);
	public List<MeetingDto> selectRecommendList(int boardIdx, String field);
	public List<MeetingDto> selectReplyList(int boardIdx);
	public List<MeetingDto> selectApplyList(int boardIdx);
	
	public int insertMeetingMember(int boardIdx, int member_no, String meeting_position, int meeting_tmp, int meeting_leader);
}
