package local.kr.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import local.kr.domain.BoardVO;
import local.kr.persistence.BoardDAO;

@Repository
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO dao;
	
	@Override
	public void write(BoardVO vo) throws Exception{
		dao.write(vo);
	}
	
	@Override
	public BoardVO read(int fno) throws Exception{
		return dao.read(fno);
	}
	
	@Override
	public void update(BoardVO vo) throws Exception{
		dao.update(vo);
	}
	
	@Override
	public void delete(int fno) throws Exception{
		dao.delete(fno);
	}
	
	@Override
	public List<BoardVO> list(int start, int end, String searchOption, String keyword) throws Exception {
	    return dao.list(start, end, searchOption, keyword);
	 }
	
	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
		return dao.countArticle(searchOption, keyword);
	}
	
	@Override
	public void increaseViewcnt(int fno, HttpSession session) throws Exception{
		long update_time = 0;
		
		if(session.getAttribute("update_time_"+fno) != null) {
			update_time = (Long)session.getAttribute("update_time_"+fno);
		}
		
		long current_time = System.currentTimeMillis();
		
		if(current_time - update_time > 5*1000) {
			dao.increaseViewcnt(fno);
			session.setAttribute("update_time_"+fno, current_time);
		} 
	}
}
