package local.kr.service;

import java.util.List;

import local.kr.domain.QnaAnswerVO;

public interface QnaAnswerService {

	// 답변 등록
	public void register(QnaAnswerVO vo) throws Exception;

	// 답변 목록
	public List<QnaAnswerVO> getList(int qno) throws Exception;

	// 아이디체크
	public String idCheck(int qno) throws Exception;

	// 답변 삭제
	public void remove(QnaAnswerVO vo) throws Exception;
}
