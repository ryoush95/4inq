package local.kr.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import local.kr.domain.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Inject
	private SqlSession sql;
	
	// 매퍼 
	private static String namespace = "local.kr.mappers.noticeMapper";
	
	// 공지사항 등록
	@Override
	public void write(NoticeVO vo) throws Exception{
		System.out.println(vo);
		sql.insert(namespace + ".noticeWrite", vo);
	}
	
	 // 공지사항 리스트
	 @Override
	 public List<NoticeVO> list(int start, int end, String searchOption, String keyword) throws Exception {
		 // 검색옵션, 키워드 맵에 저장
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("searchOption", searchOption);
		 map.put("keyword", keyword);
		 map.put("start", start);
		 map.put("end", end);
		 return sql.selectList(namespace + ".noticeList", map);
	 }
	 
	 @Override
	 public int countArticle(String searchOption, String keyword) throws Exception {
		 System.out.println("serchOption = " + searchOption);
		 System.out.println("keyword = " + keyword);
		 // 검색옵션, 키워드 맵에 저장
		 Map<String, String> map = new HashMap<String, String>();
		 map.put("searchOption", searchOption);
		 map.put("keyword", keyword);
		 return sql.selectOne(namespace + ".noticeCountArticle", map);
	 }
	 
	 //공지사항 조회수 증가
	 @Override
	 public void increaseViewcnt(int nno) throws Exception{
		 sql.update(namespace + ".noticeIncreaseViewcnt", nno);
	 }
	 
	 //공지사항 조회
	 @Override
	 public NoticeVO read(int nno) throws Exception{
		 return sql.selectOne(namespace + ".noticeRead", nno);
	 }
	 
	 //공지사항 수정
	 public void update(NoticeVO vo) throws Exception{
		 System.out.println("vo = " + vo);
		 sql.update(namespace + ".noticeUpdate", vo);
	 }
	 
	 //공지사항 삭제
	 public void delete(int nno) throws Exception{
		 sql.delete(namespace + ".noticeDelete", nno);
	 }
}
