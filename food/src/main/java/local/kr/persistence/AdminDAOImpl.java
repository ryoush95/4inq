package local.kr.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import local.kr.domain.CategoryVO;
import local.kr.domain.MemberVO;
import local.kr.domain.OrderListVO;
import local.kr.domain.OrderVO;
import local.kr.domain.ProductVO;
import local.kr.domain.ProductViewVO;
import local.kr.domain.ProducterVO;
import local.kr.domain.QnaVO;
import local.kr.domain.ReviewListVO;


@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession sql;
	
	// 매퍼 
	private static String namespace = "local.kr.mappers.adminMapper";

	// 카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		return sql.selectList(namespace + ".category");
	}

	// 상품등록
	@Override
	public void register(ProductVO vo) throws Exception {
		sql.insert(namespace + ".register", vo);
	}

	//상품목록
	@Override
	public List<ProductViewVO> productlist() throws Exception {
		return sql.selectList(namespace + ".productlist");
	}

	//상품조회
	@Override
	public ProductViewVO productView(int pdNum) throws Exception {
		return sql.selectOne(namespace + ".productView", pdNum);
	}

	@Override
	public void productModify(ProductVO vo) throws Exception {
		sql.update(namespace+".productModify",vo);
		
	}

	@Override
	public void productDelete(int pdNum) throws Exception {
		sql.delete(namespace+".productDelete",pdNum);
		
	}

	//주문 목록
	@Override
	public List<OrderVO> orderList() throws Exception {
		return sql.selectList(namespace + ".orderList");
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderView", order);
	}

	@Override
	public void delivery(OrderVO order) throws Exception {
		System.out.println(order);
		sql.update(namespace + ".delivery", order);
		
	}

	@Override
	public List<ReviewListVO> allReview() throws Exception {
		return sql.selectList(namespace + ".allReview");
	}

	@Override
	public void deleteReview(int revnum) throws Exception {
		sql.delete(namespace + ".deleteReview", revnum);
	}

	@Override
	public List<MemberVO> allMember() throws Exception {
		return sql.selectList(namespace+".allMember");
	}

	@Override
	public List<MemberVO> memberView(int mnum) throws Exception {
		return sql.selectList(namespace + ".memberView",mnum);
	}

	//생산자
	@Override
	public void pRegister(ProducterVO vo) throws Exception {
		sql.insert(namespace + ".pRegister",vo);
	}

	@Override
	public List<ProducterVO> producterlist() throws Exception {
		return sql.selectList(namespace + ".producterlist");
	}

	@Override
	public ProducterVO producterView(int pnum) throws Exception {
		return sql.selectOne(namespace + ".producterView", pnum);
	}

	@Override
	public void producterModify(ProducterVO vo) throws Exception {
		sql.update(namespace+ ".producterModify",vo);
	}

	@Override
	public void producterDelete(int pnum) throws Exception {
		sql.delete(namespace + ".producterDelete",pnum);
	}
	
	//1:1 문의내역 출력(어드민)
	@Override
	public List<QnaVO> qnaList() throws Exception{
		return sql.selectList(namespace + ".allQnaList");
	}

	//유저
	@Override
	public void idDelete(int mnum) throws Exception {
		sql.delete(namespace+".idDelete",mnum);
	}

	//유저수정
	@Override
	public void idModify(MemberVO vo) throws Exception {
		sql.update(namespace+ ".idModify",vo);	
	}

}