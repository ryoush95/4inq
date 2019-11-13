package local.kr.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import local.kr.domain.QnaVO;

@Repository
public class QnaDAOImpl implements QnaDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "local.kr.mappers.QnaMapper";
	
	/* 1:1문의 작성 */
	@Override
	public void write(QnaVO vo) throws Exception{
		sql.insert(namespace + ".qnaWrite", vo);
	}
	
	@Override
	/*1:1리스트 출력(회원별)*/
	public List<QnaVO> list(QnaVO vo) throws Exception{
		return sql.selectList(namespace + ".qnaList", vo);
	}
	
	/* 1:1 문의 삭제 */
	@Override
	public void delete(int qno) throws Exception{
		sql.delete(namespace + ".qnaDelete", qno);
	}
	
	/* 1:1문의 조회 */
	@Override
	public QnaVO read(int qno) throws Exception{
		return sql.selectOne(namespace + ".qnaRead", qno);
	}
	
	// 1:1문의수정
	@Override
	public void update(QnaVO vo) throws Exception{
		sql.update(namespace + ".qnaUpdate", vo);
	}
	
}
