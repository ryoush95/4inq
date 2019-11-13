package local.kr.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import local.kr.domain.CategoryVO;
import local.kr.domain.FaqVO;
import local.kr.domain.MemberVO;
import local.kr.domain.NoticeVO;
import local.kr.domain.OrderListVO;
import local.kr.domain.OrderVO;
import local.kr.domain.ProductVO;
import local.kr.domain.ProductViewVO;
import local.kr.domain.ProducterVO;
import local.kr.domain.QnaAnswerVO;
import local.kr.domain.QnaVO;
import local.kr.domain.ReviewListVO;
import local.kr.domain.ReviewVO;
import local.kr.service.AdminService;
import local.kr.service.BoardPager;
import local.kr.service.FaqService;
import local.kr.service.NoticeService;
import local.kr.service.ProducterService;
import local.kr.service.QnaAnswerService;
import local.kr.service.QnaService;
import local.kr.utils.UploadFileUtils;
import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	AdminService adminService;

	@Inject
	NoticeService noticeService;

	@Inject
	QnaService qnaService;

	@Inject
	QnaAnswerService qaService;
	
	@Inject
	FaqService fService;
	
	@Inject
	ProducterService pService;

	@Autowired
	BCryptPasswordEncoder passEncoder;

	@Resource(name = "uploadPath")
	private String uploadPath;

	// 관리자화면
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void getIndex() throws Exception {
		logger.info("get index");
	}

	// 상품 등록
	@RequestMapping(value = "/product/register", method = RequestMethod.GET)
	public void getProductRegister(Model model) throws Exception {
		logger.info("get product register");

		List<CategoryVO> category = null;
		category = adminService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
	}

	// 상품 등록
	// 상품 등록
		@RequestMapping(value = "/product/register", method = RequestMethod.POST)
		public String postProductRegister(ProductVO vo, MultipartFile file, HttpServletResponse response) throws Exception {

			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = null;
			int pNum = vo.getPnum();
			
			ProducterVO getPnum = pService.getPnum(pNum);
			
			if (getPnum == null) {
				
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter(); 
				
				out.println("<script>alert('등록된 생산자가 아닙니다.'); location.href='/admin/product/register';</script>"); 
				out.flush(); 
				out.close();
				
			}else {
			
			if (file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
				// if(file != null) {
				// 파일 인풋박스에 첨부된 내용이 없다면
				fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

				vo.setIpicture(File.separator + "imgUpload" + ymdPath + File.separator + fileName);

				vo.setIthumbimg(
						File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			} else {
				// 첨부파일이없으면
				fileName = File.separator + "images" + File.separator + "none.jpg";
				// none파일 출력

				vo.setIpicture(fileName);
				vo.setIthumbimg(fileName);
			}
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter(); 
			
			out.println("<script>alert('상품등록이 완료되었습니다.'); location.href='/admin/index';</script>"); 
			out.flush(); 
			out.close();
			}

			adminService.register(vo);

			return "redirect:/admin/index";
		}

	// 상품 목록
	@RequestMapping(value = "/product/list", method = RequestMethod.GET)
	public void getProductList(Model model) throws Exception {
		logger.info("get product list");

		List<ProductViewVO> list = adminService.productlist();

		model.addAttribute("list", list);
	}

	// 상품 조회
	@RequestMapping(value = "/product/view", method = RequestMethod.GET)
	public void getProductview(@RequestParam("n") int pdNum, Model model) throws Exception {
		logger.info("get product view");

		ProductViewVO product = adminService.productView(pdNum);

		model.addAttribute("product", product);
	}

	// 상품수정
	@RequestMapping(value = "/product/modify", method = RequestMethod.GET)
	public void getProductModify(@RequestParam("n") int pdNum, Model model) throws Exception {
		logger.info("get item modify");

		ProductViewVO product = adminService.productView(pdNum);
		model.addAttribute("product", product);

		List<CategoryVO> category = null;
		category = adminService.category();
		model.addAttribute("category", JSONArray.fromObject(category));

	}

	// 상품 수정
	@RequestMapping(value = "/product/modify", method = RequestMethod.POST)
	public String postProductModify(ProductVO vo, MultipartFile file, HttpServletRequest req) throws Exception {
		logger.info("post product modify");

		if (file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
			// 기존파일 삭제
			if (req.getParameter("ipicture").equals("\\images\\none.jpg")) {
				String imgUploadPath = uploadPath + File.separator + "imgUpload";
				String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
				String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),
						ymdPath);

				vo.setIpicture(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
				vo.setIthumbimg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_"
						+ fileName);
			} else {
				new File(uploadPath + req.getParameter("ipicture")).delete();
				new File(uploadPath + req.getParameter("ithumbimg")).delete();

				String imgUploadPath = uploadPath + File.separator + "imgUpload";
				String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
				String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),
						ymdPath);

				vo.setIpicture(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
				vo.setIthumbimg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_"
						+ fileName);
			}
		} else {
			vo.setIpicture(req.getParameter("ipicture"));
			vo.setIthumbimg(req.getParameter("ithumbimg"));
		}

		adminService.productModify(vo);

		return "redirect:/admin/index";
	}

	// 상품 삭제
	@RequestMapping(value = "/product/delete", method = RequestMethod.POST)
	public String postProductDelete(@RequestParam("n") int pdNum, HttpServletRequest req) throws Exception {
		logger.info("post product delete");

		new File(uploadPath + req.getParameter("ipicture")).delete();
		new File(uploadPath + req.getParameter("ithumbimg")).delete();

		adminService.productDelete(pdNum);

		return "redirect:/admin/index";
	}

	// 주문 목록
	@RequestMapping(value = "/shop/orderList", method = RequestMethod.GET)
	public void getOrderList(Model model) throws Exception {
		logger.info("get order list");

		List<OrderVO> orderList = adminService.orderList();

		model.addAttribute("orderList", orderList);

	}

	// 특정 주문
	@RequestMapping(value = "/shop/orderView", method = RequestMethod.GET)
	public void getOrderList(@RequestParam("n") String orderId, OrderVO order, Model model) throws Exception {
		logger.info("get order view");

		order.setOrderId(orderId);
		List<OrderListVO> orderView = adminService.orderView(order);

		model.addAttribute("orderView", orderView);
	}

	// 주문상태
	@RequestMapping(value = "/shop/orderView", method = RequestMethod.POST)
	public String delivery(OrderVO order) throws Exception {
		logger.info("post order view");
		adminService.delivery(order);
		return "redirect:/admin/shop/orderView?n=" + order.getOrderId();
	}

	// 모든 후기
	@RequestMapping(value = "/shop/allReview", method = RequestMethod.GET)
	public void getAllReview(Model model) throws Exception {
		logger.info("get all review");

		List<ReviewListVO> review = adminService.allReview();

		model.addAttribute("review", review);
	}

	// 모든 후기
	@RequestMapping(value = "/shop/allReview", method = RequestMethod.POST)
	public String postAllReview(ReviewVO review) throws Exception {
		logger.info("post all review");

		adminService.deleteReview(review.getRevnum());

		return "redirect:/admin/shop/allReview";
	}

	// 유저 관리
	@RequestMapping(value = "/member/allMember", method = RequestMethod.GET)
	public void getAllMember(Model model) throws Exception {
		logger.info("get all member");

		List<MemberVO> member = adminService.allMember();

		model.addAttribute("member", member);
	}

	// 유저 상세정보
	@RequestMapping(value = "/member/view", method = RequestMethod.GET)
	public void getMemberView(@RequestParam("n") int mnum, Model model) throws Exception {
		logger.info("get admember view");
		List<MemberVO> member = adminService.memberView(mnum);

		model.addAttribute("member", member);

	}

	// 유저 삭제
	@RequestMapping(value = "/member/delete", method = RequestMethod.POST)
	public String postIdDelete(@RequestParam("n") int mnum, HttpServletRequest req) throws Exception {
		logger.info("post product delete");

		adminService.idDelete(mnum);

		return "redirect:/admin/index";
	}

	// 유저 수정
//	@RequestMapping(value = "/member/modify", method = RequestMethod.GET)
//	public void getMemberModify(@RequestParam("n") int mnum, Model model,HttpServletRequest req) throws Exception {
//		logger.info("get member modify");
//
//		MemberVO member = adminService.memberView(mnum);
//		
//		model.addAttribute("member", member);
//
//
//	}

	// 생산자 등록
	@RequestMapping(value = "/producter/pRegister", method = RequestMethod.GET)
	public void getProducterRegister(Model model) throws Exception {
		logger.info("get producter register");

	}

	@RequestMapping(value = "/producter/pRegister", method = RequestMethod.POST)
	public String postProducterRegister(ProducterVO vo, MultipartFile file) throws Exception {

		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if (file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
			// if(file != null) {
			// 파일 인풋박스에 첨부된 내용이 없다면
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

			vo.setPpicture(File.separator + "imgUpload" + ymdPath + File.separator + fileName);

			vo.setPthumbimg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		} else {
			// 첨부파일이없으면
			fileName = File.separator + "images" + File.separator + "none.jpg";
			// none파일 출력

			vo.setPpicture(fileName);
			vo.setPthumbimg(fileName);
		}

		adminService.pRegister(vo);

		return "redirect:/admin/index";
	}

	@RequestMapping(value = "/producter/plist", method = RequestMethod.GET)
	public void getProducterList(Model model) throws Exception {
		logger.info("get producter list");

		List<ProducterVO> list = adminService.producterlist();

		model.addAttribute("list", list);
	}

	// 생산자 상세
	@RequestMapping(value = "/producter/pview", method = RequestMethod.GET)
	public void getProducterview(@RequestParam("n") int pnum, Model model) throws Exception {
		logger.info("get producter view");

		ProducterVO producter = adminService.producterView(pnum);

		model.addAttribute("producter", producter);
	}

	// 생산자 삭제
	@RequestMapping(value = "/producter/pdelete", method = RequestMethod.POST)
	public String postProducterDelete(@RequestParam("n") int pnum, HttpServletRequest req) throws Exception {
		logger.info("post producter delete");

		new File(uploadPath + req.getParameter("ppicture")).delete();
		new File(uploadPath + req.getParameter("pthumbimg")).delete();

		adminService.producterDelete(pnum);

		return "redirect:/admin/index";
	}

	// 생산자 수정
	@RequestMapping(value = "/producter/pmodify", method = RequestMethod.GET)
	public void getProducterModify(@RequestParam("n") int pnum, Model model) throws Exception {
		logger.info("get producter modify");

		ProducterVO producter = adminService.producterView(pnum);
		model.addAttribute("producter", producter);

	}

	// 생산자 수정
	@RequestMapping(value = "/producter/pmodify", method = RequestMethod.POST)
	public String postProducterModify(ProducterVO vo, MultipartFile file, HttpServletRequest req) throws Exception {
		logger.info("post producter modify");

		if (file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
			// 기존파일 삭제
			if (req.getParameter("ppicture").equals("\\images\\none.jpg")) {
				String imgUploadPath = uploadPath + File.separator + "imgUpload";
				String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
				String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),
						ymdPath);

				vo.setPpicture(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
				vo.setPthumbimg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_"
						+ fileName);
			} else {
				new File(uploadPath + req.getParameter("ppicture")).delete();
				new File(uploadPath + req.getParameter("pthumbimg")).delete();

				String imgUploadPath = uploadPath + File.separator + "imgUpload";
				String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
				String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),
						ymdPath);

				vo.setPpicture(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
				vo.setPthumbimg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_"
						+ fileName);
			}
		} else {
			vo.setPpicture(req.getParameter("ppicture"));
			vo.setPthumbimg(req.getParameter("pthumbimg"));
		}

		adminService.producterModify(vo);

		return "redirect:/admin/index";
	}

	// 공지사항 등록 get
	@RequestMapping(value = "/service/noticeRegister", method = RequestMethod.GET)
	public void getNoticeRegister() throws Exception {

	}

	// 공지사항 등록 post
	@RequestMapping(value = "/service/noticeRegister", method = RequestMethod.POST)
	public String postNoticeRegiser(@ModelAttribute NoticeVO vo, HttpSession session) throws Exception {
		String writer = (String) session.getAttribute("mid");
		vo.setNotice_writer(writer);
		noticeService.write(vo);

		return "redirect:/admin/adminNoticeList";
	}

	// 공지사항 수정 get
	@RequestMapping(value = "/service/noticeModify", method = RequestMethod.GET)
	public void getNoticeModify() throws Exception {

	}

	// 공지사항 수정 post
	@RequestMapping(value = "/service/noticeModify", method = RequestMethod.POST)
	public String postNoticeModify(@ModelAttribute NoticeVO vo, HttpSession session) throws Exception {
		int nno = (int) session.getAttribute("nno");
		vo.setNno(nno);
		noticeService.update(vo);

		return "redirect:/admin/index";
	}

	// 공지사항 목록(어드민)
	@RequestMapping(value = "/adminNoticeList")
	public ModelAndView adminNoticeList(@RequestParam(defaultValue = "notice_title") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
			throws Exception {

		// 레코드 갯수 계산
		int count = noticeService.countArticle(searchOption, keyword);

		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();

		List<NoticeVO> nList = noticeService.list(start, end, searchOption, keyword);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeList", nList);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("boardPager", boardPager);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/service/adminNoticeList");
		mav.addObject("map", map);

		return mav;
	}

	// 공지사항 조회(어드민)
	@RequestMapping(value = "/adminNoticeView", method = RequestMethod.GET)
	public ModelAndView getNoticeView(@RequestParam int nno, HttpSession session) throws Exception {

		session.setAttribute("nno", nno);

		noticeService.increaseViewcnt(nno, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/service/adminNoticeView");
		mav.addObject("noticeView", noticeService.read(nno));
		return mav;
	}

	// 공지사항 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(@ModelAttribute NoticeVO vo, HttpSession session) throws Exception {
		int nno = (int) session.getAttribute("nno");
		vo.setNno(nno);
		noticeService.update(vo);

		return "redirect:/admin/adminNoticeList";
	}

	// 공지사항 삭제
	@RequestMapping("/delete")
	public String delete(@RequestParam int nno) throws Exception {
		noticeService.delete(nno);
		return "redirect:/admin/adminNoticeList";
	}

	// 1:1문의 내역 출력
	@RequestMapping(value = "/service/adminQnaList", method = RequestMethod.GET)
	public ModelAndView getQnaList() throws Exception {

		List<QnaVO> qList = adminService.qnaList();

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/service/adminQnaList");
		mav.addObject("qList", qList);

		return mav;
	}

	// 1:1문의 조회
	@RequestMapping(value = "/qnaView", method = RequestMethod.GET)
	public ModelAndView qnaView(@RequestParam int qno, HttpSession session) throws Exception {

		session.setAttribute("qno", qno);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/service/adminQnaView");
		mav.addObject("qnaView", qnaService.read(qno));
		return mav;
	}

	// 1:1문의 답변등록
	@ResponseBody
	@RequestMapping(value = "/answerInsert", method = RequestMethod.POST)
	public void answerInsert(QnaAnswerVO vo, HttpSession session) throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("member");
		vo.setReplyer(member.getMid());
		qaService.register(vo);
	}

	// 1:1문의 답변 목록
	@ResponseBody
	@RequestMapping(value = "/answerList", method = RequestMethod.GET)
	public List<QnaAnswerVO> getAnswerList(@RequestParam("qno") int qno, HttpSession session) throws Exception {
		session.setAttribute("qno", qno);
		List<QnaAnswerVO> answer = qaService.getList(qno);
		return answer;
	}

	// 1:1문의 답변 삭제
	@ResponseBody
	@RequestMapping(value = "/answerDelete", method = RequestMethod.POST)
	public int answerDelete(QnaAnswerVO vo, HttpSession session) throws Exception {
		int result = 0;
		int qno = (int) session.getAttribute("qno");
		MemberVO member = (MemberVO) session.getAttribute("member");
		String replyer = qaService.idCheck(qno);
		if (member.getMid().equals(replyer)) {
			vo.setReplyer(member.getMid());
			vo.setQno(qno);
			qaService.remove(vo);
			result = 1;
		}
		return result;
	}

	// faq 등록 get
	@RequestMapping(value = "/service/faqRegister", method = RequestMethod.GET)
	public void getfaqRegister() throws Exception {

	}

	// faq 등록 post
	@RequestMapping(value = "/service/faqRegister", method = RequestMethod.POST)
	public String postFaqRegiser(@ModelAttribute FaqVO vo) throws Exception {
		fService.insert(vo);

		return "redirect:/admin/index";
	}
}
