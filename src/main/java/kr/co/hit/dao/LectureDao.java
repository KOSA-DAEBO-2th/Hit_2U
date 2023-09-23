package kr.co.hit.dao;

import java.io.IOException;
import java.util.List;

import kr.co.hit.dto.FileDto;
import kr.co.hit.dto.LectureDto;

public interface LectureDao {
	
	public int getLectureListCount(String search_target, String topic);
	public List<LectureDto> selectLecturePage(String search_target, int start, int limit);	
	public List<LectureDto> selectLectureTopicList(String search_target, String topic, int start, int limit);
	public List<LectureDto> selectLectureList();
	
	public LectureDto selectLectureRead(int boardIdx);
	public void increaseView(int boardIdx);
	public List<LectureDto> selectEvalList(int boardIdx);
	
	public void insert(LectureDto dto);
	public void insertLecture(LectureDto dto);
	public void insertThumb(FileDto fileOne) throws IOException;
}
