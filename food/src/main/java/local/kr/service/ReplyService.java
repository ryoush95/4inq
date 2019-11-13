package local.kr.service;

import java.util.List;


import local.kr.domain.ReplyVO;


public interface ReplyService {
	
	//댓글 입력
	public void register(ReplyVO vo) throws Exception;
	
	//아이디체크
	public String idCheck(int rno) throws Exception;
	
	//댓글 삭제
	public void remove(ReplyVO vo) throws Exception;
	
	//댓글 수정
	public void modify(ReplyVO reply) throws Exception;
	
	//댓글 목록
	public List<ReplyVO> getList(int fno) throws Exception;
}
 

