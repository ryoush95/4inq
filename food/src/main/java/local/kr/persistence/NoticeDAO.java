package local.kr.persistence;

import java.util.List;

import local.kr.domain.NoticeVO;

public interface NoticeDAO {
	
	// 공지사항 등록
	public void write(NoticeVO vo) throws Exception;
	
	// 리스트 출력 .. 검색옵션, 키워드 변수 추가
	public List<NoticeVO> list(int start, int end, String searchOption, String keyword) throws Exception;
	 
	// 공지사항 레코드 갯수
	public int countArticle(String searchOption, String keyword) throws Exception;
	 
	// 공지사항 조회수 증가
	public void increaseViewcnt(int nno) throws Exception;
	 
	// 공지사항 조회
	public NoticeVO read(int nno) throws Exception;
	
	// 공지사항 수정
	public void update(NoticeVO vo) throws Exception;
	
	// 공지사항 삭제
	public void delete(int nno) throws Exception;
}
