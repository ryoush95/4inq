package local.kr.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import local.kr.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "local.kr.mapper.boardMapper";
	
	// 작성
	 @Override
	 public void write(BoardVO vo) throws Exception {
	  sql.insert(namespace + ".write", vo);
	 }
	 
	 // 조회
	 @Override
	 public BoardVO read(int fno) throws Exception {
	  return sql.selectOne(namespace + ".read", fno);
	 }

	 // 수정
	 @Override
	 public void update(BoardVO vo) throws Exception {
		 System.out.println("vo = " + vo);
	  sql.update(namespace + ".update", vo);
	 }

	 // 삭제
	 @Override
	 public void delete(int fno) throws Exception {
	  sql.delete(namespace + ".delete", fno);  
	 }
	 
	 // 리스트
	 @Override
	 public List<BoardVO> list(int start, int end, String searchOption, String keyword) throws Exception {
		 // 검색옵션, 키워드 맵에 저장
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("searchOption", searchOption);
		 map.put("keyword", keyword);
		 // between #{start}, #{end}에 입력될 값을 맵에
		 map.put("start", start);
		 map.put("end", end);
		 return sql.selectList(namespace + ".list", map);
	 }
	 
	 @Override
	 public int countArticle(String searchOption, String keyword) throws Exception {
		 // 검색옵션, 키워드 맵에 저장
		 Map<String, String> map = new HashMap<String, String>();
		 map.put("searchOption", searchOption);
		 map.put("keyword", keyword);
		 return sql.selectOne(namespace + ".countArticle", map);
	 }
	 
	 //게시글 조회수 증가
	 @Override
	 public void increaseViewcnt(int fno) throws Exception{
		 sql.update(namespace + ".increaseViewcnt", fno);
	 }
}
