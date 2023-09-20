package kr.co.hit.dao;

import java.util.List;

import kr.co.hit.dto.LectureDto;
import kr.co.hit.dto.MeetingDto;

public interface LectureDao {
	
	public int getLectureListCount(String search_target, String topic);
	
	public List<LectureDto> selectLecturePage(String search_target, int start, int limit);
	
	public List<LectureDto> selectLectureTopicList(String search_target, String topic, int start, int limit);

	public List<LectureDto> selectLectureList();
	
	public LectureDto selectLectureRead(int boardIdx);
	public void increaseView(int boardIdx);
	
}
