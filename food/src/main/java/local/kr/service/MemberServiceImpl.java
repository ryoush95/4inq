package local.kr.service;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;

import local.kr.domain.MemberVO;
import local.kr.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;

	// 회원 가입
	@Override
	public void signup(MemberVO vo) throws Exception {
		dao.signup(vo);
	}

	// 로그인
	@Override
	public MemberVO signin(MemberVO vo) throws Exception {
		return dao.signin(vo);
	}

	// 로그아웃
	@Override
	public void signout(HttpSession session) throws Exception {
		session.invalidate();
	}

	// 아이디 확인
	@Override
	public MemberVO idCheck(String mid) throws Exception {
		return dao.idCheck(mid);
	}

	// 이메일 확인
	@Override
	public MemberVO idCheck2(String email) throws Exception {
		return dao.idCheck2(email);
	}

	// 회원정보 수정
	@Override
	public MemberVO update_mypage(MemberVO member) throws Exception {
		dao.update_mypage(member);
		return dao.signin(member);
	}

	// 이메일 발송(비밀번호찾기)
	@Override
	public void send_mail(MemberVO member, String pw) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "rnfkqhf@naver.com";
		String hostSMTPpwd = "whdals12";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "rnfkqhf@naver.com";
		String fromName = "PJM";
		String subject = "";
		String msg = "";

		// 회원가입 메일 내용
		subject = "파밍존 임시 비밀번호입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue'>";
		msg += member.getMid() + "님의 임시 비밀번호입니다. 비밀번호를 변경하여 사용하세요.</h3>";
		msg += "<p>임시 비밀번호 : ";
		msg += pw + "</p></div>";

		// 받는 사람 E-Mail 주소
		String mail = member.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	// 아이디 찾기
	@Override
	public String find_id(HttpServletResponse response, String phone) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String mid = dao.find_id(response, phone);

		if (mid == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return mid;
		}
	}

	// 회원탈퇴
	@Override
	public void withdrawal(MemberVO vo) throws Exception {
		dao.withdrawal(vo);
	}

	@Override
	public MemberVO update_pw(MemberVO member, String old_pw, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	// 이메일 중복확인
	@Override
	public int check_email(String email) throws Exception {
		return dao.check_email(email);
	}

	// 탈퇴한 회원 db 등록(개인탈퇴)
	public void ban_member(String mid) throws Exception {
		dao.ban_member(mid);
	}

	// 탈퇴한 회원 아이디 가져오기
	public String getBanMember(String mid) throws Exception {
		return dao.getBanMember(mid);
	}

	// 탈퇴회원 아이디 삭제
	public void deleteBanMember(String mid) throws Exception{
		dao.deleteBanMember(mid);
	}

}
