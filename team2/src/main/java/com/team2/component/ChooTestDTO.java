package com.team2.component;

import java.sql.Timestamp;

//import lombok.Data;

public class ChooTestDTO {
	private int num;
	private String name;
	private String addr;
	private String title;
	private String con;
	private String id;
	private String pw;
	private int good;
	private int bad;
	private int total;
	private Timestamp reg;
	
	public int getNum() {return num;}
	public String getName() {return name;}
	public String getAddr() {return addr;}
	public String getTitle() {return title;}
	public String getCon() {return con;}
	public String getId() {return id;}
	public String getPw() {return pw;}
	public int getGood() {return good;}
	public int getBad() {return bad;}
	public int getTotal() {return total;}
	public Timestamp getReg() {return reg;}
	
	public void setNum(int num) {this.num = num;}
	public void setName(String name) {this.name= name;}
	public void setAddr(String addr) {this.addr = addr;}
	public void setTitle(String title) {this.title = title;}
	public void setCon(String con) {this.con = con;}
	public void setId(String id) {this.id = id;}
	public void setPw(String pw) {this.pw = pw;}
	public void setGood(int good) {this.good = good;}
	public void setBad(int bad) {this.bad = bad;}
	public void setTotal(int total) {this.total = total;}
	public void setReg(Timestamp reg) {this.reg = reg;}
}
