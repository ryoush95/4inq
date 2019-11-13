package local.kr.service;

import java.util.List;

import local.kr.domain.ProducterVO;

public interface ProducterService {

	// 생산자리스트
	public List<ProducterVO> producterList() throws Exception;

	// 생산자 뷰
	public ProducterVO producterView(int pnum) throws Exception;

	// 생산자 번호 가져오기
	public ProducterVO getPnum(int pnum) throws Exception;
}
