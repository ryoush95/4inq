package local.kr.service;

import java.util.List;

import local.kr.domain.FaqVO;

public interface FaqService {
	
	//faq 목록
	public List<FaqVO> list() throws Exception;
	
	//faq 등록
	public void insert(FaqVO vo) throws Exception;
}
