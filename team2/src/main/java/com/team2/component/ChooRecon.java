package com.team2.component;

import java.sql.Timestamp;

//고객센터 게시글 답글 DTO
public class ChooRecon {
	private int num;
	private int renum;
	private String id;
	private String con;
	private Timestamp reg;
	
	public int getNum() {return num;}
	public int getRenum() {return renum;}
	public String getId() {return id;}
	public String getCon() {return con;}
	public Timestamp getReg() {return reg;}
	
	public void setNum(int num) {this.num = num;}
	public void setRenum(int renum) {this.renum = renum;}
	public void setId(String id) {this.id = id;}
	public void setCon(String con) {this.con = con;}
	public void setReg(Timestamp reg) {this.reg = reg;}
}
