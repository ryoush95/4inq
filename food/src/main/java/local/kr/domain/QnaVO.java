package local.kr.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {
	private int qno;
	private String mid;
	private String qna_title;
	private String qna_writer;
	private String qna_content;
	private Date qna_regdate;
	private int qna_answer;
	
}
