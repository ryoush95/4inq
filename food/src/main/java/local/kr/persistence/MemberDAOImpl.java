package local.kr.persistence;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import local.kr.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sql;

	// 매퍼
	private static String namespace = "local.kr.mappers.memberMapper";

	// 회원 가입
	@Override
	public void signup(MemberVO vo) throws Exception {
		sql.insert(namespace + ".signup", vo);
	}

	// 로그인
	@Override
	public MemberVO signin(MemberVO vo) throws Exception {
		return sql.selectOne(namespace + ".signin", vo);
	}

	// 아이디 확인
	@Override
	public MemberVO idCheck(String mid) throws Exception {
		return sql.selectOne(namespace + ".idCheck", mid);
	}

	// 마이페이지
	@Transactional
	@Override
	public void update_mypage(MemberVO member) throws Exception {
		System.out.println(member);
		sql.update(namespace + ".update_mypage", member);
	}

	// 아이디 찾기
	@Override
	public String find_id(HttpServletResponse response, String phone) throws Exception {
		/* System.out.println(phone); */

		return sql.selectOne(namespace + ".find_id", phone);

	}

	// 비밀번호 찾기
	@Transactional
	public int find_pw(MemberVO member) throws Exception {
		return sql.update(namespace + ".update_pw", member);
	}

	// 비밀번호 변경
	@Transactional
	public int update_pw(MemberVO member) throws Exception {
		System.out.println("asssssssssssss" + member);
		return sql.update(namespace + ".update_pw", member);
	}

	// 회원탈퇴
	@Override
	public void withdrawal(MemberVO vo) throws Exception {
//			return sql.delete("member.withdrawal", member);
		sql.delete(namespace + ".withdrawal", vo);
	}

	@Override
	public int check_id(String mid) throws Exception {
		return sql.selectOne(namespace + ".check_id", mid);
	}

	@Override
	public int alter_Key(String mid, String keyCode) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".alter_Key", mid);
	}

	// 이메일 확인
	@Override
	public MemberVO idCheck2(String email) throws Exception {

		return sql.selectOne(namespace + ".idCheck2", email);
	}

	@Override
	public MemberVO signin(String mid) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".signin", mid);
	}

	// 이메일 중복확인
	public int check_email(String email) throws Exception {
		return sql.selectOne(namespace + ".check_email", email);
	}

	// 탈퇴한 회원 db 등록(개인탈퇴)
	public void ban_member(String mid) throws Exception {
		sql.insert(namespace + ".secessionMember", mid);
	}

	// 탈퇴한 회원 아이디 가져오기
	public String getBanMember(String mid) throws Exception {
		return sql.selectOne(namespace + ".getSecessionMember", mid);
	}
}
