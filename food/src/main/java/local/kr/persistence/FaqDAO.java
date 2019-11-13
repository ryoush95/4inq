package local.kr.persistence;

import java.util.List;

import local.kr.domain.FaqVO;

public interface FaqDAO {
	
	//faq 목록 가져오기
	public List<FaqVO> list() throws Exception;
	
	//faq 등록
	public void insert(FaqVO vo) throws Exception;
}
