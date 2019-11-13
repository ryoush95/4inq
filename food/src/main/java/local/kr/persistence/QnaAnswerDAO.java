package local.kr.persistence;

import java.util.List;

import local.kr.domain.QnaAnswerVO;

public interface QnaAnswerDAO {

	// 답변 등록
	public void insert(QnaAnswerVO vo) throws Exception;

	// 답변 목록
	public List<QnaAnswerVO> getList(int qno) throws Exception;

	// 아이디 체크
	public String idCheck(int qno) throws Exception;

	// 답변 삭제
	public void delete(QnaAnswerVO vo) throws Exception;
}
