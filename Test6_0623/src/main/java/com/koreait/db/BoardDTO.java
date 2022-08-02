package com.koreait.db;

public class BoardDTO {
	private int b_idx;
	private String b_userid;
	private String b_name;
	private String b_title;
	private String b_content;
	private int b_hit;
	private String b_regdate;
	
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	public String getB_userid() {
		return b_userid;
	}
	public void setB_userid(String b_userid) {
		this.b_userid = b_userid;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public int getB_hit() {
		return b_hit;
	}
	public void setB_hit(int b_hit) {
		this.b_hit = b_hit;
	}
	public String getB_regdate() {
		return b_regdate;
	}
	public void setB_regdate(String b_regdate) {
		this.b_regdate = b_regdate;
	}
	@Override
	public String toString() {
		return "BoardDTO [b_idx=" + b_idx + ", b_userid=" + b_userid + ", b_name=" + b_name + ", b_title=" + b_title
				+ ", b_content=" + b_content + ", b_hit=" + b_hit + ", b_regdate=" + b_regdate + "]";
	}
}
