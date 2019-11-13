package local.kr.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QnaAnswerVO {
	private int qrno;
	private int qno;
	private String reply;
	private String replyer;
	private Date replydate;
	private Date updatedate;
}
