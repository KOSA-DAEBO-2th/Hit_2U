package kr.co.hit.dao;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import kr.co.hit.dto.QnaDto;
import kr.co.hit.dto.QnaSearchDto;
import kr.co.hit.dto.FileDto;

public interface QnaDao {

	// select
	public List<QnaDto> selectQnaList();

	public int selectQnaListCount();

	public QnaDto selectQnaDetail(int boardIdx);

	// search

	public List<QnaDto> selectReplyList(int boardIdx);
	public List<QnaDto> searchQnaImgList(int boardIdx);
	
	
	public int searchQnaListCount(QnaSearchDto dto);
	
	

	
	public void increaseView(int boardIdx);

	
	// insert
	
	public int insertBoard(QnaDto dto);
	public int insertQna(QnaDto dto);





	public List<QnaDto> searchQnaList(QnaSearchDto dto);

	public int InsertQna(QnaDto dto);

	public void updateView(int b_no);

	public QnaDto getQnaDetail(int b_no);

	public int updateBoard(QnaDto dto);

	public int updateQna(QnaDto dto);

	public int deleteFile(int boardIdx);

	public int deleteQna(int boardIdx);

//	public int deleteBoard(int boardIdx);

	public void updateSummerNote(FileDto fileOne) throws IOException;


	public int insertReply(QnaDto dto);

	public void increaseReply(int b_no);

	public List<QnaDto> QnaList(HashMap map);

	int getQnaCount();

	public int deleteReplyBno(int boardIdx);




}