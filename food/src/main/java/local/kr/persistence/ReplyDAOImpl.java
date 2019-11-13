package local.kr.persistence;

import java.util.List;


import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import local.kr.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "local.kr.mapper.replyMapper";

	@Override
	public void insert(ReplyVO vo) throws Exception {
		sql.insert(namespace + ".replyInsert", vo);
	}

	@Override
	public String idCheck(int rno) throws Exception {
		return sql.selectOne(namespace + ".replyUserIdCheck", rno);
	}

	@Override
	public void delete(ReplyVO vo) throws Exception {	
		sql.delete(namespace + ".replyDelete", vo);
	}

	@Override
	public void update(ReplyVO reply) throws Exception {
		sql.update(namespace + ".replyUpdate", reply);
	}

	@Override
	public List<ReplyVO> getList(int fno) throws Exception {
		
		return sql.selectList(namespace + ".getReplyList", fno);
	}

}
