package kr.co.hit.dao;

import java.util.List;

import kr.co.hit.dto.MeetingDto;

public interface MeetingDao {
	
	public List<MeetingDto> selectMeetingList();
	public List<MeetingDto> selectMeetingCategoyList(String select);
	public List<MeetingDto> selectMeetingSearch(String search_target);
	public List<MeetingDto> selectMeetingPage(int start, int limit);
	public int getMeetingListCount();
	public void increaseView(int boardIdx);
	public MeetingDto selectMeetingRead(int boardIdx);
	public void insert(MeetingDto dto);
	public void insertMeeting(MeetingDto dto);
}
