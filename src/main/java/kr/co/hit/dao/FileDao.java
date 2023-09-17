package kr.co.hit.dao;

public interface FileDao {
	// b_no에 해당하는 프로필 이미지 존재하는지 검색
	public String searchName(int b_no);

	// DB에 기록된 이미지 삭제
	public void deleteImage(String Name);
}
