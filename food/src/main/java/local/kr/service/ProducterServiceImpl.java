package local.kr.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import local.kr.domain.ProducterVO;
import local.kr.persistence.ProducterDAO;

@Service
public class ProducterServiceImpl implements ProducterService {
	
	@Inject
	private ProducterDAO dao;

	@Override
	public List<ProducterVO> producterList() throws Exception {
		return dao.producterList();
	}

	@Override
	public ProducterVO producterView(int pnum) throws Exception {
		return dao.producterView(pnum);
	}
	
	/*생산자 번호 가져오기*/
	@Override
	public ProducterVO getPnum(int pnum) throws Exception{
		return dao.getPnum(pnum);
	}

}
