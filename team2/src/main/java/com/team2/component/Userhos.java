package com.team2.component;

import java.sql.Timestamp;

public class Userhos {
	private String id;
	private String nick;
	private String hosname;
	private String hosaddr;
	private Timestamp reg;
	
	public String getId() {return id;}
	public String getNick() {return nick;}
	public String getHosname() {return hosname;}
	public String getHosaddr() {return hosaddr;}
	public Timestamp getReg() {return reg;}
	
	public void setId(String id) {this.id = id;}
	public void setNick(String nick) {this.nick = nick;}
	public void setHosname(String hosname) {this.hosname = hosname;}
	public void setHosaddr(String hosaddr) {this.hosaddr = hosaddr;}
	public void setReg(Timestamp reg) {this.reg = reg;}
}
