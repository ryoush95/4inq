package local.kr.persistence;

import java.util.List;


import local.kr.domain.ReplyVO;

public interface ReplyDAO {
	
	//댓글 입력
	public void insert(ReplyVO vo) throws Exception;
	
	//아이디 체크
	public String idCheck(int rno) throws Exception;
	
	//댓글 삭제
	public void delete(ReplyVO vo) throws Exception;
	
	//댓글 수정
	public void update(ReplyVO reply) throws Exception;
	
	//댓글 리스트
	public List<ReplyVO> getList(int fno) throws Exception;

}
