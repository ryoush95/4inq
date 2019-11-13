package local.kr.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewListVO {

	private int inum;
	private String mid;
	private int revnum;
	private String revcon;
	private Date revdate;
	
	private String name;
}
