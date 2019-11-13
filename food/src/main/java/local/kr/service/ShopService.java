package local.kr.service;

import java.util.List;

import local.kr.domain.CartListVO;
import local.kr.domain.CartVO;
import local.kr.domain.Criteria;
import local.kr.domain.OrderDetailVO;
import local.kr.domain.OrderListVO;
import local.kr.domain.OrderVO;
import local.kr.domain.ProductViewVO;
import local.kr.domain.ReviewListVO;
import local.kr.domain.ReviewVO;

public interface ShopService {

	//상품 전체
	public List<ProductViewVO> list() throws Exception;
	
	// 카테고리별 상품리스트
	public List<ProductViewVO> list(int cateCode, int level) throws Exception;

	// 상품조회
	public ProductViewVO productView(int pdNum) throws Exception;

	// 상품 댓글
	public void registerReview(ReviewVO review) throws Exception;

	// 상품 댓글 리스트
	public List<ReviewListVO> reviewList(int pdNum) throws Exception;

	// 댓글 삭제
	public void deleteReview(ReviewVO review) throws Exception;

	// 아이디체크
	public String idCheck(int revnum) throws Exception;

	// 댓글 수정
	public void modifyReview(ReviewVO review) throws Exception;

	// 카트담기
	public void addCart(CartListVO cart) throws Exception;

	// 카트리스트
	public List<CartListVO> cartList(String mid) throws Exception;

	// 카트삭제
	public void deleteCart(CartVO cart) throws Exception;

	// 주문정보
	public void orderInfo(OrderVO order) throws Exception;

	// 주문 상세
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;

	// 카트 비우기
	public void cartAllDelete(String mid) throws Exception;

	//주문 목록
	public List<OrderVO> orderList(OrderVO order) throws Exception;
	
	//특정주문
	public List<OrderListVO> orderView(OrderVO order) throws Exception; 
	
	//댓글페이징
	public List<ProductViewVO> listPage(Criteria cri) throws Exception;
	public int listCount() throws Exception;

}