package local.kr.service;

import java.util.List;

import local.kr.domain.QnaVO;

public interface QnaService {
	
	/* 1:1문의 등록 */
	public void write(QnaVO vo) throws Exception;
	
	/* 1:1문의 목록출력(회원별) */
	public List<QnaVO> list(QnaVO vo) throws Exception;
	
	/* 1:1문의 삭제 */
	public void delete(int qno) throws Exception;
	
	/* 1:1문의 조회 */
	public QnaVO read(int qno) throws Exception;
	
	// 1:1문의 수정
	public void update(QnaVO vo) throws Exception;
}
