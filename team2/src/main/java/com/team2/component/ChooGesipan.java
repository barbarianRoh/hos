package com.team2.component;

import java.sql.Timestamp;

public class ChooGesipan {
	private int num;
	private String id;
	private String pw;
	private String title;
	private String con;
	private Timestamp reg;
	
	public int getNum() {return num;}
	public String getId() {return id;}
	public String getPw() {return pw;}
	public String getTitle() {return title;}
	public String getCon() {return con;}
	public Timestamp getReg() {return reg;}
	
	public void setNum(int num) {this.num = num;}
	public void setId(String id) {this.id = id;}
	public void setPw(String pw) {this.pw = pw;}
	public void setTitle(String title) {this.title = title;}
	public void setCon(String con) {this.con = con;}
	public void setReg(Timestamp reg) {this.reg = reg;}
}
