package local.kr.domain;

import lombok.Data;

@Data
public class MemberVO {

	private int mnum;
	private String mid;
	private String mpw;
	private String name;
	private String phone;
	private String address1;
	private String address2;
	private String address3;
	private int auth;
	private String email;
	
	
	
}