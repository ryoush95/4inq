package local.kr.service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import local.kr.domain.MemberVO;

public interface MemberService {

	// 회원 가입
	public void signup(MemberVO vo) throws Exception;

	// 로그인
	public MemberVO signin(MemberVO vo) throws Exception;

	// 로그아웃
	public void signout(HttpSession session) throws Exception;

	// 아이디 확인
	public MemberVO idCheck(String mid) throws Exception;

	// 마이페이지 수정
	public MemberVO update_mypage(MemberVO member) throws Exception;

	// 비밀번호 변경
	public MemberVO update_pw(MemberVO member, String old_pw, HttpServletResponse response) throws Exception;

	// 아이디 찾기
	public String find_id(HttpServletResponse response, String phone) throws Exception;

	// 회원탈퇴
	public void withdrawal(MemberVO member) throws Exception;

	/*
	 * // 비밀번호 찾기 public void find_pw(HttpServletResponse response, MemberVO member)
	 * throws Exception;
	 */

	public MemberVO idCheck2(String email) throws Exception;

	// 이메일 발송
	public void send_mail(MemberVO member, String pw) throws Exception;

	// 이메일 중복체크
	public int check_email(String email) throws Exception;

	// 탈퇴한 회원 db 등록(개인탈퇴)
	public void ban_member(String mid) throws Exception;

	// 탈퇴한 회원 아이디 가져오기
	public String getBanMember(String mid) throws Exception;
}