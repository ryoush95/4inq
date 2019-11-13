package local.kr.persistence;

import java.util.List;

import local.kr.domain.QnaVO;

public interface QnaDAO {
	
	/*1:1문의 등록*/
	public void write(QnaVO vo) throws Exception;
	
	/*1:1리스트 출력(회원별)*/
	public List<QnaVO> list(QnaVO vo) throws Exception;
	
	/* 1:1문의 삭제 */
	public void delete(int qno) throws Exception;
	
	/* 1:1문의 조회 */
	public QnaVO read(int qno) throws Exception;
	
	// 1:1문의수정
	public void update(QnaVO vo) throws Exception;
		 
}
