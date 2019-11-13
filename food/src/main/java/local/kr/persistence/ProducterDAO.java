package local.kr.persistence;

import java.util.List;
import local.kr.domain.ProducterVO;

public interface ProducterDAO {

	// 생산자 리스트
	public List<ProducterVO> producterList() throws Exception;

	// 상품조회
	public ProducterVO producterView(int pnum) throws Exception;

	// 생산자 번호 가져오기
	public ProducterVO getPnum(int pnum) throws Exception;
}
