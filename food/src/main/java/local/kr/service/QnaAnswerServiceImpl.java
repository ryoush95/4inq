package local.kr.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import local.kr.domain.QnaAnswerVO;
import local.kr.persistence.QnaAnswerDAO;

@Repository
public class QnaAnswerServiceImpl implements QnaAnswerService {

	@Inject
	private QnaAnswerDAO dao;

	// 답변 등록
	public void register(QnaAnswerVO vo) throws Exception {
		dao.insert(vo);
	}

	// 답변 목록
	public List<QnaAnswerVO> getList(int qno) throws Exception {
		return dao.getList(qno);
	}

	// 아이디체크
	public String idCheck(int qno) throws Exception{
		return dao.idCheck(qno);
	}

	// 댓글 삭제
	public void remove(QnaAnswerVO vo) throws Exception{

		dao.delete(vo);
	}
}
