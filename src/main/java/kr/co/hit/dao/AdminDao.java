package kr.co.hit.dao;

import java.util.List;

import kr.co.hit.dto.AdminDto;

public interface AdminDao {
	
	public List<AdminDto> searchBoard(String search_key);
	public List<AdminDto> searchMember(String search_key);
	
	public List<AdminDto> cntWeekBoard();
	public List<AdminDto> cntWeekReply();
	
	public void delBoard(List<Integer> checkArr);
	public void delMember(List<Integer> checkArr);
	
	public List<AdminDto> memberChart();
	
	public List<AdminDto> reportList();
	
}
