package com.team2.component;

//import lombok.Data;


public class ChooTestDTO {
	private String armhocode; //암호화요양기호
	private String name; //요양기관명
	private int hoscode; //종별코드
	private String hostype; //종별코드명
	private int sidocode; //시도코드
	private String sidoname; //시도코드명
	private int siguncode; //시시군구코드
	private String sigunname; //시군구코드명
	private String address; //주소
	private String tel; //전화번호
	private String homepage; //병원홈페이지
	private double jwapyoX; //좌표X;
	private double jwapyoY; //좌표Y;
	public String getArmhocode() {
		return armhocode;
	}
	public void setArmhocode(String armhocode) {
		this.armhocode = armhocode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getHoscode() {
		return hoscode;
	}
	public void setHoscode(int hoscode) {
		this.hoscode = hoscode;
	}
	public String getHostype() {
		return hostype;
	}
	public void setHostype(String hostype) {
		this.hostype = hostype;
	}
	public int getSidocode() {
		return sidocode;
	}
	public void setSidocode(int sidocode) {
		this.sidocode = sidocode;
	}
	public String getSidoname() {
		return sidoname;
	}
	public void setSidoname(String sidoname) {
		this.sidoname = sidoname;
	}
	public int getSiguncode() {
		return siguncode;
	}
	public void setSiguncode(int siguncode) {
		this.siguncode = siguncode;
	}
	public String getSigunname() {
		return sigunname;
	}
	public void setSigunname(String sigunname) {
		this.sigunname = sigunname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public double getJwapyoX() {
		return jwapyoX;
	}
	public void setJwapyoX(double jwapyoX) {
		this.jwapyoX = jwapyoX;
	}
	public double getJwapyoY() {
		return jwapyoY;
	}
	public void setJwapyoY(double jwapyoY) {
		this.jwapyoY = jwapyoY;
	}
	
	
}
