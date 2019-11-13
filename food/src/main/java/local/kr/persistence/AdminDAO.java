package local.kr.persistence;

import java.util.List;

import local.kr.domain.CategoryVO;
import local.kr.domain.MemberVO;
import local.kr.domain.OrderListVO;
import local.kr.domain.OrderVO;
import local.kr.domain.ProductVO;
import local.kr.domain.ProductViewVO;
import local.kr.domain.ProducterVO;
import local.kr.domain.QnaVO;
import local.kr.domain.ReviewListVO;

public interface AdminDAO {

	// 카테고리
	public List<CategoryVO> category() throws Exception;

	// 상품등록
	public void register(ProductVO vo) throws Exception;

	// 상품목록
	public List<ProductViewVO> productlist() throws Exception;

	// 상품조회
	public ProductViewVO productView(int pdNum) throws Exception;

	// 상품수정
	public void productModify(ProductVO vo) throws Exception;

	// 상품삭제
	public void productDelete(int pdNum) throws Exception;

	// 주문 목록
	public List<OrderVO> orderList() throws Exception;

	// 특정 주문
	public List<OrderListVO> orderView(OrderVO order) throws Exception;

	// 배송상태
	public void delivery(OrderVO order) throws Exception;

	// 모든 후기
	public List<ReviewListVO> allReview() throws Exception;

	// 후기삭제
	public void deleteReview(int revnum) throws Exception;

	// 모든유저
	public List<MemberVO> allMember() throws Exception;

	// 특정유저
	public List<MemberVO> memberView(int mnum) throws Exception;

	// 생산자등록
	public void pRegister(ProducterVO vo) throws Exception;

	// 생산자목록
	public List<ProducterVO> producterlist() throws Exception;

	// 생산자조회
	public ProducterVO producterView(int pnum) throws Exception;

	// 생산자수정
	public void producterModify(ProducterVO vo) throws Exception;
	
	// 생산자 삭제
	public void producterDelete(int pnum) throws Exception;
	
	//1:1문의 내역 출력
	public List<QnaVO> qnaList() throws Exception;
	
	// id삭제
	public void idDelete(int mnum) throws Exception;
	
	//유저수정
	public void idModify(MemberVO vo) throws Exception;
}
