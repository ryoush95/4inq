package local.kr.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import local.kr.domain.CategoryVO;
import local.kr.domain.MemberVO;
import local.kr.domain.OrderListVO;
import local.kr.domain.OrderVO;
import local.kr.domain.ProductVO;
import local.kr.domain.ProductViewVO;
import local.kr.domain.ProducterVO;
import local.kr.domain.QnaVO;
import local.kr.domain.ReviewListVO;
import local.kr.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;

	// 카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		return dao.category();
	}

	// 상품등록
	@Override
	public void register(ProductVO vo) throws Exception {
		dao.register(vo);		
	}

	// 상품목록
	@Override
	public List<ProductViewVO> productlist() throws Exception {
		return dao.productlist();
	}
	
	

	// 상품조회
	@Override
	public ProductViewVO productView(int pdNum) throws Exception {
		return dao.productView(pdNum);
	}

	@Override
	public void productModify(ProductVO vo) throws Exception {
		dao.productModify(vo);
	}

	@Override
	public void productDelete(int pdNum) throws Exception {
		dao.productDelete(pdNum);
		
	}

	//상품 조회
	@Override
	public List<OrderVO> orderList() throws Exception {
		return dao.orderList();
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return dao.orderView(order);
	}

	@Override
	public void delivery(OrderVO order) throws Exception {
		dao.delivery(order);
	}

	@Override
	public List<ReviewListVO> allReview() throws Exception {
		return dao.allReview();
	}

	@Override
	public void deleteReview(int revnum) throws Exception {
		dao.deleteReview(revnum);
	}

	@Override
	public List<MemberVO> allMember() throws Exception {
		return dao.allMember();
	}

	@Override
	public List<MemberVO> memberView(int mnum) throws Exception {
		return dao.memberView(mnum);
	}

	//생산자 등록
	@Override
	public void pRegister(ProducterVO vo) throws Exception {
		dao.pRegister(vo);
	}

	//생산자 목록
	@Override
	public List<ProducterVO> producterlist() throws Exception {
		return dao.producterlist();
	}

	@Override
	public ProducterVO producterView(int pnum) throws Exception {
		return dao.producterView(pnum);
	}

	@Override
	public void producterModify(ProducterVO vo) throws Exception {
		dao.producterModify(vo);
	}

	@Override
	public void producterDelete(int pnum) throws Exception {
		dao.producterDelete(pnum);
	}

	// 1:1 문의내역 출력
	public List<QnaVO> qnaList() throws Exception{
		return dao.qnaList();
	}

	//유저 삭제
	@Override
	public void idDelete(int mnum) throws Exception {
		dao.idDelete(mnum);
	}

	//유저 수정
	@Override
	public void idModify(MemberVO vo) throws Exception {
		dao.idModify(vo);
	}


} 