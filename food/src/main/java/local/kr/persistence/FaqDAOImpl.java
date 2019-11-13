package local.kr.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import local.kr.domain.FaqVO;

@Repository
public class FaqDAOImpl implements FaqDAO {

	@Inject
	private SqlSession sql;
	private static String namespace = "local.kr.mapper.faqMapper";
	
	@Override
	public List<FaqVO> list() throws Exception {
		return sql.selectList(namespace + ".getList");
	}
	
	@Override
	public void insert(FaqVO vo) throws Exception{
		sql.insert(namespace + ".faqInsert", vo);
	}

}
