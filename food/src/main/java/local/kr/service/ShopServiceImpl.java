package local.kr.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import local.kr.domain.CartListVO;
import local.kr.domain.CartVO;
import local.kr.domain.Criteria;
import local.kr.domain.OrderDetailVO;
import local.kr.domain.OrderListVO;
import local.kr.domain.OrderVO;
import local.kr.domain.ProductViewVO;
import local.kr.domain.ReviewListVO;
import local.kr.domain.ReviewVO;
import local.kr.persistence.ShopDAO;

@Service
public class ShopServiceImpl implements ShopService {

	@Inject
	private ShopDAO dao;

	// 전체 상품
	@Override
	public List<ProductViewVO> list() throws Exception {
		return dao.list();
	}

	// 카테고리별 상품리스트
	@Override
	public List<ProductViewVO> list(int cateCode, int level) throws Exception {

		int cateCodeRef = 0;

		if (level == 1) {
			cateCodeRef = cateCode;

			return dao.list(cateCodeRef, cateCode);

		} else {

			return dao.list(cateCode);
		}

	}

	@Override
	public ProductViewVO productView(int pdNum) throws Exception {
		return dao.productView(pdNum);
	}

	@Override
	public void registerReview(ReviewVO review) throws Exception {
		dao.registerReview(review);
	}

	@Override
	public List<ReviewListVO> reviewList(int pdNum) throws Exception {
		return dao.reviewList(pdNum);
	}

	@Override
	public void deleteReview(ReviewVO review) throws Exception {
		dao.deleteReview(review);
	}

	@Override
	public String idCheck(int revnum) throws Exception {
		return dao.idCheck(revnum);
	}

	@Override
	public void modifyReview(ReviewVO review) throws Exception {
		dao.modifyReview(review);

	}

	@Override
	public void addCart(CartListVO cart) throws Exception {
		dao.addCart(cart);
	}

	@Override
	public List<CartListVO> cartList(String mid) throws Exception {

		return dao.cartList(mid);
	}

	@Override
	public void deleteCart(CartVO cart) throws Exception {
		dao.deleteCart(cart);
	}

	@Override
	public void orderInfo(OrderVO order) throws Exception {
		dao.orderInfo(order);

	}

	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		dao.orderInfo_Details(orderDetail);
	}

	@Override
	public void cartAllDelete(String mid) throws Exception {
		dao.cartAllDelete(mid);
	}

	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return dao.orderList(order);
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return dao.orderView(order);
	}

	
	//댓글페이징
	@Override
	public List<ProductViewVO> listPage(Criteria cri) throws Exception {
		return dao.listPage(cri);
	}

	@Override
	public int listCount() throws Exception {
		return dao.listCount();
	}

}
