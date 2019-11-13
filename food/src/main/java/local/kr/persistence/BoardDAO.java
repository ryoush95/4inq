package local.kr.persistence;

import java.util.List;

import local.kr.domain.BoardVO;

public interface BoardDAO {
	
	 // 작성
	 public void write(BoardVO vo) throws Exception;
	 
	 // 조회
	 public BoardVO read(int fno) throws Exception;
	 
	 // 수정
	 public void update(BoardVO vo) throws Exception;
	 
	 // 삭제
	 public void delete(int fno) throws Exception;
	 
	 // 리스트 출력 .. 검색옵션, 키워드 변수 추가
	 public List<BoardVO> list(int start, int end, String searchOption, String keyword) throws Exception;
	 
	 // 게시글 레코드 갯수
	 public int countArticle(String searchOption, String keyword) throws Exception;
	 
	 // 게시글 조회 증가
	 public void increaseViewcnt(int fno) throws Exception;
}
