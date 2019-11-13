package local.kr.persistence;

import javax.servlet.http.HttpServletResponse;

import local.kr.domain.MemberVO;

public interface MemberDAO {

	// 회원 가입
	public void signup(MemberVO vo) throws Exception;

	// 로그인
	public MemberVO signin(MemberVO vo) throws Exception;

	// 아이디 확인
	public MemberVO idCheck(String mid) throws Exception;

	// 이메일 확인
	public MemberVO idCheck2(String email) throws Exception;

	// 마이페이지
	public void update_mypage(MemberVO member) throws Exception;

	// 비밀번호 변경
	public int update_pw(MemberVO member) throws Exception;

	// 비밀번호 찾기
	public int find_pw(MemberVO member) throws Exception;

	// 아이디 찾기
	public String find_id(HttpServletResponse response, String phone) throws Exception;

	// 회원탈퇴

	public void withdrawal(MemberVO vo) throws Exception;

	public int check_id(String mid) throws Exception;

	public int alter_Key(String mid, String keyCode) throws Exception;

	public MemberVO signin(String mid) throws Exception;

	// 이메일 중복확인
	public int check_email(String email) throws Exception;

	// 탈퇴한 회원 db 등록(개인탈퇴)
	public void ban_member(String mid) throws Exception;

	// 탈퇴한 회원 아이디 가져오기
	public String getBanMember(String mid) throws Exception;

}
