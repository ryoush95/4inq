package local.kr.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import local.kr.domain.BoardVO;
import local.kr.domain.FaqVO;
import local.kr.domain.MemberVO;
import local.kr.domain.NoticeVO;
import local.kr.domain.QnaAnswerVO;
import local.kr.domain.QnaVO;
import local.kr.domain.ReplyVO;
import local.kr.service.BoardPager;
import local.kr.service.BoardService;
import local.kr.service.FaqService;
import local.kr.service.NoticeService;
import local.kr.service.QnaAnswerService;
import local.kr.service.QnaService;
import local.kr.service.ReplyService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Inject
	BoardService service;

	@Inject
	ReplyService RepService;

	@Inject
	NoticeService noticeService;

	@Inject
	FaqService faqService;

	@Inject
	QnaService qnaService;

	@Inject
	QnaAnswerService qaService;
	
	

	// 글 작성 get
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String getWrite(HttpSession session, HttpServletResponse response) throws Exception {
		MemberVO login = (MemberVO) session.getAttribute("member");
		if (login != null) {
			return "/board/write";
		}  else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter(); 
			
			out.println("<script>alert('로그인이 필요합니다'); location.href='/member/signin';</script>"); 
			out.flush(); 
			out.close();
			return "redirect:/member/signin";
		}
	}

	// 글 작성 post
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(@ModelAttribute BoardVO vo, HttpSession session) throws Exception {
		// session에 저장된 mid를 writer에 저장
		String writer = (String) session.getAttribute("name");
		// vo에 writer 세팅
		vo.setWriter(writer);
		service.write(vo);

		return "redirect:/board/list";
	}

	// 글 목록
	@RequestMapping(value = "/list")
	public ModelAndView list(@RequestParam(defaultValue = "title") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage,
			HttpSession session) throws Exception {

		// 레코드 갯수 계산
		int count = service.countArticle(searchOption, keyword);

		// 페이지 나누기 처리
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();

		List<BoardVO> list = service.list(start, end, searchOption, keyword);

		String name = (String) session.getAttribute("name");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("boardPager", boardPager);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/list");
		mav.addObject("map", map);
		mav.addObject("name", name);

		return mav;
	}

	// 글 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public ModelAndView getView(@RequestParam int fno, @RequestParam int curPage, @RequestParam String searchOption,
			@RequestParam String keyword, HttpSession session) throws Exception {

		session.setAttribute("fno", fno);

		service.increaseViewcnt(fno, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/view");
		mav.addObject("view", service.read(fno));
		mav.addObject("curPage", curPage);
		mav.addObject("searchOption", searchOption);
		mav.addObject("keyword", keyword);
		return mav;
	}

	// 글 수정 (GET)
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify() throws Exception {

	}

	// 글 수정(POST)
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(@ModelAttribute BoardVO vo, HttpSession session) throws Exception {
		int fno = (int) session.getAttribute("fno");
		vo.setFno(fno);
		service.update(vo);

		return "redirect:/board/list";
	}

	// 글 삭제
	@RequestMapping("/delete")
	public String delete(@RequestParam int fno) throws Exception {

		service.delete(fno);
		return "redirect:/";
	}

	// 댓글 입력
	@ResponseBody
	@RequestMapping(value = "/replyInsert", method = RequestMethod.POST)
	public void replyInsert(ReplyVO vo, HttpSession session) throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("member");
		vo.setReplyer(member.getMid());
		RepService.register(vo);
	}

	// 댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/replyDelete", method = RequestMethod.POST)
	public int replyDelete(ReplyVO vo, HttpSession session) throws Exception {
		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("member");
		String replyer = RepService.idCheck(vo.getRno());

		if (member.getMid().equals(replyer)) {
			vo.setReplyer(member.getMid());
			RepService.remove(vo);
			result = 1;
		}
		return result;
	}

	// 댓글 목록
	@ResponseBody
	@RequestMapping(value = "/replyList", method = RequestMethod.GET)
	public List<ReplyVO> getReviewList(@RequestParam("fno") int fno) throws Exception {

		List<ReplyVO> reply = RepService.getList(fno);
		return reply;
	}

	// 댓글 수정
	@ResponseBody
	@RequestMapping(value = "/replyModify", method = RequestMethod.POST)
	public int modifyReview(ReplyVO reply, HttpSession session) throws Exception {

		int result = 0;
		MemberVO member = (MemberVO) session.getAttribute("member");
		String replyer = RepService.idCheck(reply.getRno());

		if (member.getMid().equals(replyer)) {
			reply.setReplyer(member.getMid());
			RepService.modify(reply);
			result = 1;
		}
		return result;
	}

	// 공지사항 목록
	@RequestMapping(value = "/noticeList")
	public ModelAndView noticeList(@RequestParam(defaultValue = "notice_title") String searchOption,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int curPage) throws Exception {

		// 레코드 갯수 계산
		int count = noticeService.countArticle(searchOption, keyword);
		// 페이지 나누기 처리
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();

		List<NoticeVO> nList = noticeService.list(start, end, searchOption, keyword);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", nList);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("boardPager", boardPager);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/service/noticeList");
		mav.addObject("map", map);

		return mav;
	}

	// 공지사항 조회
	@RequestMapping(value = "/noticeView", method = RequestMethod.GET)
	public ModelAndView getNoticeView(@RequestParam int nno, HttpSession session) throws Exception {

		session.setAttribute("nno", nno);
		String name = (String) session.getAttribute("mid");

		noticeService.increaseViewcnt(nno, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/noticeView");
		mav.addObject("noticeView", noticeService.read(nno));
		mav.addObject("adminName", name);
		return mav;
	}
	
	/*@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public void getFaq() throws Exception{
		
	}*/

	// faq 목록
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public ModelAndView getFaq() throws Exception {

		List<FaqVO> fList = faqService.list();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/faq");
		mav.addObject("list", fList);

		return mav;
	}

	// 1:1문의 등록(get)
	@RequestMapping(value = "/qnaRegister", method = RequestMethod.GET)
	public void getQnaRegister() throws Exception {

	}

	// 1:1문의 등록(post)
	@RequestMapping(value = "/qnaRegister", method = RequestMethod.POST)
	public String postQnaRegister(HttpSession session, QnaVO vo) throws Exception {
		String writer = (String) session.getAttribute("name");
		String mid = (String) session.getAttribute("mid");

		vo.setMid(mid);
		vo.setQna_writer(writer);

		qnaService.write(vo);

		return "redirect:/board/qnaList";
	}

	// 1:1문의 목록출력
	@RequestMapping(value = "/qnaList", method = RequestMethod.GET)
	public ModelAndView getQnaList(HttpSession session, QnaVO vo, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		MemberVO login = (MemberVO) session.getAttribute("member");
		if (login != null) {
		String mid = (String) session.getAttribute("mid");
		vo.setMid(mid);

		List<QnaVO> qList = qnaService.list(vo);

		mav.setViewName("board/qnaList");
		mav.addObject("qList", qList);

		return mav;
		}else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter(); 
			
			out.println("<script>alert('로그인이 필요합니다'); location.href='/member/signin';</script>"); 
			out.flush(); 
			out.close();
			mav.setViewName("member/signin");
			return mav;
		}	
	}

	// 1:1문의 삭제
	@RequestMapping(value = "/qnaDelete", method = RequestMethod.POST)
	public String qnaDelete(@RequestParam int qno) throws Exception {
		qnaService.delete(qno);
		return "redirect:/";
	}

	// 1:1문의 조회
	@RequestMapping(value = "/qnaView", method = RequestMethod.GET)
	public ModelAndView qnaView(@RequestParam int qno, HttpSession session) throws Exception {

		session.setAttribute("qno", qno);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/qnaView");
		mav.addObject("qnaView", qnaService.read(qno));
		return mav;
	}

	// 1:1문의 수정 (GET)
	@RequestMapping(value = "/qnaModify", method = RequestMethod.GET)
	public void getQnaModify() throws Exception {

	}

	// 1:1문의 수정(POST)
	@RequestMapping(value = "/qnaModify", method = RequestMethod.POST)
	public String postQnaModify(@ModelAttribute QnaVO vo, HttpSession session) throws Exception {
		int qno = (int) session.getAttribute("qno");
		vo.setQno(qno);
		qnaService.update(vo);

		return "redirect:/board/qnaView?qno=" + qno;
	}

	// 1:1문의 답변 목록
	@ResponseBody
	@RequestMapping(value = "/answerList", method = RequestMethod.GET)
	public List<QnaAnswerVO> getAnswerList(@RequestParam("qno") int qno) throws Exception {

		List<QnaAnswerVO> answer = qaService.getList(qno);
		return answer;
	}
}

