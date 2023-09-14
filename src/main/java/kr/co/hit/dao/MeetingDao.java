package kr.co.hit.dao;

import java.util.List;

import kr.co.hit.dto.MeetingDto;

public interface MeetingDao {
	
	public List<MeetingDto> selectMeetingList();
	public MeetingDto selectMeetingRead(int boardIdx);
	public void insert(MeetingDto dto);
	public void insertMeeting(MeetingDto dto);
}
