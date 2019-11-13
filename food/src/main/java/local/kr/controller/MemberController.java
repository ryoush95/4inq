package local.kr.controller;

import java.io.PrintWriter;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import local.kr.domain.MemberVO;
import local.kr.persistence.MemberDAO;
import local.kr.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberService service;
	
	@Inject
	MemberDAO dao;

	@Autowired
	BCryptPasswordEncoder passEncoder;

	// 회원 가입 get
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public void getSignup(HttpServletRequest request) throws Exception {
		logger.info("get signup");
		HttpSession session = request.getSession();

		session.invalidate();

	}

	// 회원 가입 post
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String postSignup(MemberVO vo, HttpServletResponse response) throws Exception {
		int result = 0;
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String email = vo.getEmail();
		String mid = vo.getMid();
		result = service.check_email(email);
		
		if(result == 0) { 
		
		String inputPass = vo.getMpw();
		System.out.println(inputPass);
		String pass = passEncoder.encode(inputPass);
		vo.setMpw(pass);
		service.deleteBanMember(mid);
		service.signup(vo);

		out.println("<script>alert('회원가입이 완료되었습니다.'); location.href='/';</script>");
		out.flush();
		out.close();
		return "redirect:/";
		}else {
			out.println("<script>alert('중복된 이메일입니다.'); location.href='/member/signup';</script>");
			out.flush();
			out.close();
			return "redirect:/";
		}
	}

	// 로그인 get
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void getSignin() throws Exception {
		logger.info("get signin");
	}

	// 로그인 post
	   @RequestMapping(value = "/signin", method = RequestMethod.POST)
	   public String postSignin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr, HttpServletResponse response, Model model)
	         throws Exception {
	      MemberVO login = service.signin(vo);
	      HttpSession session = req.getSession();
	      String mid = vo.getMid();

	      MemberVO checkId = service.idCheck(mid);
	      String banMember = service.getBanMember(mid);
	      
	      if (banMember != null) {
	         response.setContentType("text/html; charset=utf-8");
	         PrintWriter out = response.getWriter();
	         out.println("<script>alert('탈퇴된 회원입니다.'); location.href='/member/signin';</script>");
	         out.flush();
	         out.close();
	      }else {
	      
	         if (checkId != null) {

	            boolean passMatch = passEncoder.matches(vo.getMpw(), login.getMpw());

	            if (login != null && passMatch) {
	               session.setAttribute("member", login);
	               session.setAttribute("name", login.getName());
	               session.setAttribute("mid", login.getMid());
	               
	            } else {
	               session.setAttribute("member", null);
	               rttr.addFlashAttribute("msg", false);
	               return "redirect:/member/signin";
	            }

	         } else {
	            response.setContentType("text/html; charset=utf-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('존재하지 않는 아이디입니다.'); location.href='/member/signin';</script>");
	            out.flush();
	            out.close();
	         }
	       } 
	      return "redirect:/";
	   }

	// 로그아웃
	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public String signout(HttpSession session) throws Exception {
		logger.info("get logout");

		service.signout(session);

		return "redirect:/";
	}

	// 마이페이지 홈
	@RequestMapping(value = "/mypage_home", method = RequestMethod.GET)
	public String mypagehome() throws Exception {
		logger.info("get mypage home");
		return "/member/mypage_home";
	}

	// 마이페이지 이동
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage() throws Exception {
		System.out.println("마이페이지CON");
		return "/member/mypage";
	}

	// mypage 수정
	@RequestMapping(value = "/update_mypage", method = RequestMethod.POST)
	public String update_mypage(@ModelAttribute MemberVO member, HttpSession session, RedirectAttributes rttr)
			throws Exception {

		String inputPass = member.getMpw();
		String pass = passEncoder.encode(inputPass);
		member.setMpw(pass);
		session.setAttribute("member", service.update_mypage(member));
		rttr.addFlashAttribute("msg", "회원정보 수정 완료");
		return "redirect:/";
	}

	// 아이디 찾기 폼
	@RequestMapping(value = "/find_id_form", method = RequestMethod.GET)
	public String find_id_form() throws Exception {
		System.out.println("아이디찾기폼");
		return "/member/find_id_form";
	}

	// 아이디 찾기
	@RequestMapping(value = "/find_id", method = RequestMethod.POST)
	public ModelAndView find_id(HttpServletResponse response, @RequestParam("phone") String phone,
			RedirectAttributes rttr) throws Exception {

		rttr.addAttribute("mid", service.find_id(response, phone));
		String mid = service.find_id(response, phone);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/find_id");
		mav.addObject("name", mid);
		return mav;
	}

	// 비밀번호 찾기 폼
	@RequestMapping(value = "/find_pw_form", method = RequestMethod.GET)
	public String find_pw_form() throws Exception {
		return "/member/find_pw_form";
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "/find_pw", method = RequestMethod.POST)
	public void find_pw(@ModelAttribute MemberVO member, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 아이디가 없으면
		if (dao.check_id(member.getMid()) == 0) {
			out.print("아이디가 없습니다.");
			out.close();
		}
		// 가입에 사용한 이메일이 아니면
		else if (!member.getEmail().equals(dao.signin(member.getMid()).getEmail())) {
			out.print("잘못된 이메일 입니다.");
			out.close();
		} else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			service.send_mail(member, pw);
			String pass = passEncoder.encode(pw);
			member.setMpw(pass);
			// 비밀번호 변경
			dao.update_pw(member);
			// 비밀번호 변경 메일 발송

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}

	// 마이페이지 삭제폼
	@RequestMapping(value = "/withdrawal", method = RequestMethod.GET)
	public void mypage_del() throws Exception {
		System.out.println("회원탈퇴폼");
	}

	// 회원탈퇴
	   @RequestMapping(value = "/withdrawal", method = RequestMethod.POST)
	   public String withdrawal_form(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
	      logger.info("post 회탈");

	      MemberVO member = (MemberVO) session.getAttribute("member");
	      String mid = (String) session.getAttribute("mid");
	      String oldPass = member.getMpw();
	      String newPass = vo.getMpw();

	      if (!passEncoder.matches(newPass, oldPass)) {
	         rttr.addFlashAttribute("msg", false);
	         return "redirect:/member/withdrawal";
	      }
	      service.withdrawal(vo);
	      service.ban_member(mid);
	      return "redirect:/member/signout";
	   }

	// 회원 확인
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int postIdCheck(HttpServletRequest req) throws Exception {
		logger.info("post idCheck");

		String mid = req.getParameter("mid");
		MemberVO idCheck = service.idCheck(mid);

		int result = 0;

		if (idCheck != null) {
			result = 1;
		}

		return result;
	}
	
	//이메일 중복확인
	@ResponseBody
	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
	public int postEmailCheck(HttpServletRequest req) throws Exception {
		int result = 0;
		
		String email = req.getParameter("email");
		result = service.check_email(email);


		if (result > 0) {
			result = 1;
		}

		return result;
	}
	
	


}
