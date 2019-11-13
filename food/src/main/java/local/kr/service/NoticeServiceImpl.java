package local.kr.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import local.kr.domain.NoticeVO;
import local.kr.persistence.NoticeDAO;

@Repository
public class NoticeServiceImpl implements NoticeService {
	
	@Inject 
	private NoticeDAO dao;
	
	//공지사항 등록
	@Override
	public void write(NoticeVO vo) throws Exception{
		dao.write(vo);
	}
	
	//공지사항 리스트 
	@Override
	public List<NoticeVO> list(int start, int end, String searchOption, String keyword) throws Exception {
	    return dao.list(start, end, searchOption, keyword);
	 }
	
	//공지사항 게시물 수
	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
		return dao.countArticle(searchOption, keyword);
	}
	
	//공지사항 조회수증가
	@Override
	public void increaseViewcnt(int nno, HttpSession session) throws Exception{
		long update_time = 0;
		
		if(session.getAttribute("update_time_"+nno) != null) {
			update_time = (Long)session.getAttribute("update_time_"+nno);
		}
		
		long current_time = System.currentTimeMillis();
		
		if(current_time - update_time > 5*1000) {
			dao.increaseViewcnt(nno);
			session.setAttribute("update_time_"+nno, current_time);
		} 
	}
	
	//공지사항 조회
	@Override
	public NoticeVO read(int nno) throws Exception{
		return dao.read(nno);
	}
	
	//공지사항 수정
	@Override
	public void update(NoticeVO vo) throws Exception{
		dao.update(vo);
	}
	
	//공지사항 삭제
	@Override
	public void delete(int nno) throws Exception{
		dao.delete(nno);
	}
}
