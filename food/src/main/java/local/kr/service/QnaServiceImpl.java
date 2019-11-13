package local.kr.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import local.kr.domain.QnaVO;
import local.kr.persistence.QnaDAO;

@Repository
public class QnaServiceImpl implements QnaService {
	
	@Inject
	private QnaDAO dao;
	
	/* 1:1 문의 등록 */
	public void write(QnaVO vo) throws Exception{
		dao.write(vo);
	}
	
	/* 1:1문의 목록출력(회원별) */
	public List<QnaVO> list(QnaVO vo) throws Exception{
		return dao.list(vo);
	}
	
	public void delete(int qno) throws Exception{
		dao.delete(qno);
	}
	
	/* 1:1문의 조회 */
	public QnaVO read(int qno) throws Exception{
		return dao.read(qno);
	}
	
	// 1:1문의 수정
	public void update(QnaVO vo) throws Exception{
		dao.update(vo);
	}
}
