package local.kr.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import local.kr.domain.ReplyVO;
import local.kr.persistence.ReplyDAO;

@Repository
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO dao;

	@Override
	public void register(ReplyVO vo) throws Exception {
		dao.insert(vo);		
	}

	@Override
	public String idCheck(int rno) throws Exception {
		return dao.idCheck(rno);
	}

	@Override
	public void remove(ReplyVO vo) throws Exception {
		dao.delete(vo);
		
	}

	@Override
	public void modify(ReplyVO reply) throws Exception {
		dao.update(reply);
		
	}

	@Override
	public List<ReplyVO> getList(int fno) throws Exception {
		
		return dao.getList(fno);
	}
	

}

