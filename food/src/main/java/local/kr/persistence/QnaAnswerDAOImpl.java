package local.kr.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import local.kr.domain.QnaAnswerVO;


@Repository
public class QnaAnswerDAOImpl implements QnaAnswerDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "local.kr.mapper.qnaAnswerMapper";

	// 답변 등록
	@Override
	public void insert(QnaAnswerVO vo) throws Exception {
		sql.insert(namespace + ".answerInsert", vo);
	}

	// 답변 목록
	@Override
	public List<QnaAnswerVO> getList(int qno) throws Exception {
		return sql.selectList(namespace + ".getAnswerList", qno);
	}

	// 아이디 체크
	public String idCheck(int qno) throws Exception{
		return sql.selectOne(namespace + ".answerUserIdCheck", qno);
	}

	// 답변 삭제
	public void delete(QnaAnswerVO vo) throws Exception{
		System.out.println("vo = " + vo);
		sql.delete(namespace + ".answerDelete", vo);
	}

}
