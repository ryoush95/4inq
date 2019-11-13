package local.kr.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import local.kr.domain.CartListVO;
import local.kr.domain.CartVO;
import local.kr.domain.Criteria;
import local.kr.domain.OrderDetailVO;
import local.kr.domain.OrderListVO;
import local.kr.domain.OrderVO;
import local.kr.domain.ProductViewVO;
import local.kr.domain.ReviewListVO;
import local.kr.domain.ReviewVO;

@Repository
public class ShopDAOImpl implements ShopDAO {
	
	@Inject
	private SqlSession sql;
	
	//mapper
	private static String namespace = "local.kr.mappers.shopMapper";

	
	@Override
	public List<ProductViewVO> list() throws Exception {
		return sql.selectList(namespace +".list");
	}
	
	//카테고리 상품리스트 1
	@Override
	public List<ProductViewVO> list(int cateCode, int cateCodeRef) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("cateCode", cateCode);
		map.put("cateCodeRef", cateCodeRef);
		
		return sql.selectList(namespace + ".list_1", cateCode);
	}

	//카테고리 상품리스트 2
	@Override
	public List<ProductViewVO> list(int cateCode) throws Exception {
		return sql.selectList(namespace + ".list_2", cateCode);
	}

	@Override
	public ProductViewVO productView(int pdNum) throws Exception {
		return sql.selectOne("local.kr.mappers.adminMapper" + ".productView", pdNum);
	}

	
	//댓글
	@Override
	public void registerReview(ReviewVO review) throws Exception {
			sql.insert(namespace + ".registerReview", review);
	}

	@Override
	public List<ReviewListVO> reviewList(int pdNum) throws Exception {
		return sql.selectList(namespace + ".reviewList", pdNum);
	}

	@Override
	public void deleteReview(ReviewVO review) throws Exception {
		sql.delete(namespace + ".deleteReview", review);
	}

	@Override
	public String idCheck(int revnum) throws Exception {
		return sql.selectOne(namespace+".reviewUserIdCheck",revnum);
	}

	@Override
	public void modifyReview(ReviewVO review) throws Exception {
		sql.update(namespace + ".modifyReview", review);
	}

	//카트
	@Override
	public void addCart(CartListVO cart) throws Exception {
		sql.insert(namespace + ".addCart",cart); 
	}

	@Override
	public List<CartListVO> cartList(String mid) throws Exception {
		return sql.selectList(namespace + ".cartList", mid);
	}

	@Override
	public void deleteCart(CartVO cart) throws Exception {
		sql.delete(namespace + ".deleteCart", cart);
	}

	//주문 정보
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		sql.insert(namespace +".orderInfo", order);
		
	}

	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		sql.insert(namespace+".orderInfo_Details",orderDetail);
	}

	@Override
	public void cartAllDelete(String mid) throws Exception {
		sql.delete(namespace +".cartAllDelete", mid);
	}

	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return sql.selectList(namespace +".orderList", order);
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return sql.selectList(namespace+".orderView",order);
	}

	//답글페이징
	@Override
	public List<ProductViewVO> listPage(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".listPage", cri);
	}

	@Override
	public int listCount() throws Exception {
		return sql.selectOne(namespace+".listCount");
	}

	


}
