package local.kr.domain;

import java.util.Date;

public class BoardVO {
	
	private int fno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int viewcnt;
	private String name;
	private int replycnt;
	
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getReplycnt() {
		return replycnt;
	}
	
	public void set(int replycnt) {
		this.replycnt = replycnt;
	}
	
	@Override
	public String toString() {
		return "BoardVO [fno=" + fno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate="
				+ regdate + ", viewcnt=" + viewcnt + ", name=" + name + ", replycnt=" + replycnt + "]";
	}
	
}
