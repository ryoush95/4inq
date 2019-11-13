package local.kr.domain;

import java.util.Date;

public class NoticeVO {
	private int nno;
	private String notice_title;
	private String notice_writer;
	private String notice_content;
	private Date notice_regdate;
	private Date notice_updatedate;
	private int notice_viewcnt;
	
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_writer() {
		return notice_writer;
	}
	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Date getNotice_regdate() {
		return notice_regdate;
	}
	public void setNotice_regdate(Date notice_regdate) {
		this.notice_regdate = notice_regdate;
	}
	public Date getNotice_updatedate() {
		return notice_updatedate;
	}
	public void setNotice_updatedate(Date notice_updatedate) {
		this.notice_updatedate = notice_updatedate;
	}
	public int getNotice_viewcnt() {
		return notice_viewcnt;
	}
	public void setNotice_viewcnt(int notice_viewcnt) {
		this.notice_viewcnt = notice_viewcnt;
	}
	@Override
	public String toString() {
		return "NoticeVO [nno=" + nno + ", notice_title=" + notice_title + ", notice_writer=" + notice_writer
				+ ", notice_content=" + notice_content + ", notice_regdate=" + notice_regdate + ", notice_updatedate="
				+ notice_updatedate + ", notice_viewcnt=" + notice_viewcnt + "]";
	}


}
