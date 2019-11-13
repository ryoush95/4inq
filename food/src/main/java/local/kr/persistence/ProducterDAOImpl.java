package local.kr.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import local.kr.domain.ProducterVO;

@Repository
public class ProducterDAOImpl implements ProducterDAO {

	@Inject
	private SqlSession sql;
	
	//mapper
	private static String namespace = "local.kr.mappers.producterMapper";
	
	
	@Override
	public List<ProducterVO> producterList() throws Exception {
		return sql.selectList(namespace + ".producterList");
	}


	@Override
	public ProducterVO producterView(int pnum) throws Exception {
		return sql.selectOne(namespace + ".producterView",pnum);
	}
	
	@Override
	public ProducterVO getPnum(int pnum) throws Exception{
		return sql.selectOne(namespace + ".getPnum", pnum);
	}

}
