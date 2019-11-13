package local.kr.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import local.kr.domain.CartListVO;
import local.kr.domain.CartVO;
import local.kr.domain.Criteria;
import local.kr.domain.MemberVO;
import local.kr.domain.OrderDetailVO;
import local.kr.domain.OrderListVO;
import local.kr.domain.OrderVO;
import local.kr.domain.PageMaker;
import local.kr.domain.ProductViewVO;
import local.kr.domain.ReviewListVO;
import local.kr.domain.ReviewVO;
import local.kr.service.ShopService;

@Controller
@RequestMapping("/shop/*")
public class ShopController {

	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);

	@Inject
	ShopService service;

	
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void getListCriteria(Model model, Criteria cri) throws Exception {
		logger.info("get list cri");

		List<ProductViewVO> list = service.listPage(cri);

		model.addAttribute("list", list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount());
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "/list1", method = RequestMethod.GET)
	public void getList1(Model model) throws Exception {
		logger.info("get list a");

		List<ProductViewVO> list = service.list();

		model.addAttribute("list", list);
	}

	// 상품 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(@RequestParam("c") int cateCode, @RequestParam("l") int level, Model model) throws Exception {
		logger.info("get list");

		List<ProductViewVO> list = null;
		list = service.list(cateCode, level);

		model.addAttribute("list", list);
	}

	@RequestMapping(value = "/list2", method = RequestMethod.GET)
	public void getList2(@RequestParam("c") int cateCode, @RequestParam("l") int level, Model model) throws Exception {
		logger.info("get list2");

		List<ProductViewVO> list = null;
		list = service.list(cateCode, level);

		model.addAttribute("list", list);
	}

	@RequestMapping(value = "/list3", method = RequestMethod.GET)
	public void getList3(@RequestParam("c") int cateCode, @RequestParam("l") int level, Model model) throws Exception {
		logger.info("get list3");

		List<ProductViewVO> list = null;
		list = service.list(cateCode, level);

		model.addAttribute("list", list);
	}

	// 상품조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("n") int pdNum, Model model) throws Exception {
		logger.info("get view");

		ProductViewVO view = service.productView(pdNum);
		model.addAttribute("view", view);

//		List<ReviewListVO> review = service.reviewList(pdNum);
//		model.addAttribute("review", review);
	}

	// 상품조회 댓글작성
	/*
	 * @RequestMapping(value = "/view", method = RequestMethod.POST) public String
	 * registerReview(ReviewVO review, HttpSession session) throws Exception{
	 * logger.info("register review");
	 * 
	 * MemberVO member = (MemberVO)session.getAttribute("member");
	 * review.setMid(member.getMid());
	 * 
	 * service.registerReview(review);
	 * 
	 * 
	 * return "redirect:/shop/view?n=" + review.getInum();
	 * 
	 * }
	 */
	@ResponseBody
	@RequestMapping(value = "/view/registerReview", method = RequestMethod.POST)
	public void registerReview(ReviewVO review, HttpSession session) throws Exception {
		logger.info("register review");

		MemberVO member = (MemberVO) session.getAttribute("member");
		review.setMid(member.getMid());

		service.registerReview(review);
	}

	// 상품댓글 목록
	@ResponseBody
	@RequestMapping(value = "/view/reviewList", method = RequestMethod.GET)
//			,produces = { MediaType.APPLICATION_XML_VALUE,
//					MediaType.APPLICATION_JSON_UTF8_VALUE })
	public List<ReviewListVO> getReviewList(@RequestParam("n") int pdNum,Criteria cri) throws Exception {
		logger.info("get review list");

		List<ReviewListVO> review = service.reviewList(pdNum);

		return review;

	}

	// 댓글삭제
	@ResponseBody
	@RequestMapping(value = "/view/deleteReview", method = RequestMethod.POST)
	public int getReviewList(ReviewVO review, HttpSession session) throws Exception {
		logger.info("post delete review");

		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("member");
		String mid = service.idCheck(review.getRevnum());

		if (member.getMid().equals(mid)) {
			review.setMid(member.getMid());
			service.deleteReview(review);

			result = 1;
		}

		return result;

	}

	// 댓글 수정
	@ResponseBody
	@RequestMapping(value = "/view/modifyReview", method = RequestMethod.POST)
	public int modifyReview(ReviewVO review, HttpSession session) throws Exception {
		logger.info("modify review");

		int result = 0;
		MemberVO member = (MemberVO) session.getAttribute("member");
		String mid = service.idCheck(review.getRevnum());

		if (member.getMid().equals(mid)) {

			review.setMid(member.getMid());
			service.modifyReview(review);

			result = 1;
		}

		return result;
	}
	
	//페이징
//	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
//	public void listPage(Criteria cri, Model model) throws Exception{
//		logger.info("get list page");
//		
//		List<ReviewListVO> list = service.listPage(cri);
//		
//		model.addAttribute("list", list);
//	}

	@ResponseBody
	@RequestMapping(value = "/view/addCart", method = RequestMethod.POST)
	public int addCart(CartListVO cart, HttpSession session) throws Exception {

		int result = 0;
		MemberVO member = (MemberVO) session.getAttribute("member");
		if (member != null) {
			cart.setMid(member.getMid());
			service.addCart(cart);
			result = 1;
		}

		return result;
	}

	// 카트 리스트
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public String getCartList(HttpSession session, Model model) throws Exception {
		logger.info("get cart list");

		MemberVO member = (MemberVO) session.getAttribute("member");
		System.out.println(member);
		if (member == null) {

			return "redirect:/member/signin";

		} else {
			String mid = member.getMid();
			System.out.println(mid);
			List<CartListVO> cartList = service.cartList(mid);
			model.addAttribute("cartList", cartList);

			return "/shop/cartList";
		}

	}
	
	// 바로구매
		@RequestMapping(value = "/buynow", method = RequestMethod.GET)
		public String getButNow(HttpSession session, Model model) throws Exception {
			logger.info("get cart list");

			MemberVO member = (MemberVO) session.getAttribute("member");
			System.out.println(member);
			if (member == null) {

				return "redirect:/member/signin";

			} else {
				String mid = member.getMid();
				System.out.println(mid);
				List<CartListVO> cartList = service.cartList(mid);
				model.addAttribute("cartList", cartList);

				return "/shop/buynow";
			}

		}

	// 카트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST, produces = { MediaType.TEXT_PLAIN_VALUE })
	public String deleteCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart)
			throws Exception {
		logger.info("delete cart");

		MemberVO member = (MemberVO) session.getAttribute("member");
		String mid = member.getMid();

		String result = null;
		int cartnum = 0;

		if (member != null) {
			cart.setMid(mid);

			for (String i : chArr) {
				cartnum = Integer.parseInt(i);
				cart.setCartnum(cartnum);
				service.deleteCart(cart);
			}
			result = "1";
		}
		System.out.println(result);
		return result;

	}

	// 주문
	@RequestMapping(value = "/cartList", method = RequestMethod.POST)
	public String order(HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception {
		logger.info("order");

		MemberVO member = (MemberVO) session.getAttribute("member");
		String mid = member.getMid();

		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";

		for (int i = 1; i <= 6; i++) {
			subNum += (int) (Math.random() * 10);
		}

		String orderId = ymd + "_" + subNum;

		order.setOrderId(orderId);
		order.setMid(mid);

		service.orderInfo(order);

		orderDetail.setOrderId(orderId);
		orderDetail.setMid(mid);
		service.orderInfo_Details(orderDetail);

		service.cartAllDelete(mid);

		return "redirect:/shop/orderList";
	}

	// 주문 목록
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String getOrderList(HttpSession session, OrderVO order, Model model) throws Exception {
		logger.info("get order list");

		MemberVO member = (MemberVO) session.getAttribute("member");
		if (member == null) {

			return "redirect:/member/signin";

		} else {

			String mid = member.getMid();

			order.setMid(mid);

			List<OrderVO> orderList = service.orderList(order);

			model.addAttribute("orderList", orderList);

			return "/shop/orderList";
		}

	}

	// 특정 주문
	@RequestMapping(value = "/orderView", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, @RequestParam("n") String orderId, OrderVO order, Model model)
			throws Exception {
		logger.info("get order view");

		MemberVO member = (MemberVO) session.getAttribute("member");
		String mid = member.getMid();

		order.setMid(mid);
		order.setOrderId(orderId);

		List<OrderListVO> orderView = service.orderView(order);

		model.addAttribute("orderView", orderView);
	}

}
