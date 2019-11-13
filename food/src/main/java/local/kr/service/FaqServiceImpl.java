package local.kr.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import local.kr.domain.FaqVO;
import local.kr.persistence.FaqDAO;

@Repository
public class FaqServiceImpl implements FaqService {
	
	@Inject
	private FaqDAO dao;
	
	//faq 목록
	@Override
	public List<FaqVO> list() throws Exception{
		return dao.list();
	}
	
	//faq 등록
	@Override
	public void insert(FaqVO vo) throws Exception{
		dao.insert(vo);
	}
}
