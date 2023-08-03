package com.team2.component;

import lombok.Data;

public class HongDTO {
	private int num;
	private String pageno;	/*페이지숫자*/
	private String numofrows;	/*보여줄갯수*/
	private String entpname;	/*업체명*/
	private String itemname;	/*제품명*/
	private String efcyqesitm;	/*이 약의 효능은 무엇입니까?*/
	private String usemethodquesitm;	/*이 약은 어떻게 사용합니까?*/
	private String atpnwarnqesitm; /*이 약을 사용하기 전에 반드시 알아야 할 내용은 무엇입니까?*/
	private String atpnqesitm;	/*이 약의 사용상 주의사항은 무엇입니까?*/
	private String intrcqesitm;	/*이 약을 사용하는 동안 주의해야 할 약 또는 음식은 무엇입니까?*/
	private String seqesitm;	/*이 약은 어떤 이상반응이 나타날 수 있습니까?*/
	private String depositmethodqesitm;	/*이 약은 어떻게 보관해야 합니까?*/
	private String imgfile;	/* 이미지 */
	
	
	public int getNum() {
		return num;
	}
	
	public void setNum(int num) {
		this.num = num;
	}
	
	public String getPageno() {
		return pageno;
	}
	
	public void setPageno(String pageno) {
		this.pageno = pageno;
	}
	
	public String getNumofrows() {
		return numofrows;
	}
	
	public void setNumofrows(String numofrows) {
		this.numofrows = numofrows;
	}
	
	public String getEntpname() {
		return entpname;
	}
	
	public void setEntpname(String entpname) {
		this.entpname = entpname;
	}
	
	public String getItemname() {
		return itemname;
	}
	
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	
	public String getEfcyqesitm() {
		return efcyqesitm;
	}
	
	public void setEfcyqesitm(String efcyqesitm) {
		this.efcyqesitm = efcyqesitm;
	}
	
	public String getUsemethodquesitm() {
		return usemethodquesitm;
	}
	
	public void setUsemethodquesitm(String usemethodquesitm) {
		this.usemethodquesitm = usemethodquesitm;
	}
	
	public String getAtpnwarnqesitm() {
		return atpnwarnqesitm;
	}
	
	public void setAtpnwarnqesitm(String atpnwarnqesitm) {
		this.atpnwarnqesitm = atpnwarnqesitm;
	}
	
	public String getAtpnqesitm() {
		return atpnqesitm;
	}
	
	public void setAtpnqesitm(String atpnqesitm) {
		this.atpnqesitm = atpnqesitm;
	}
	
	public String getIntrcqesitm() {
		return intrcqesitm;
	}
	
	public void setIntrcqesitm(String intrcqesitm) {
		this.intrcqesitm = intrcqesitm;
	}
	
	public String getSeqesitm() {
		return seqesitm;
	}
	
	public void setSeqesitm(String seqesitm) {
		this.seqesitm = seqesitm;
	}
	
	public String getDepositmethodqesitm() {
		return depositmethodqesitm;
	}
	
	public void setDepositmethodqesitm(String depositmethodqesitm) {
		this.depositmethodqesitm = depositmethodqesitm;
	}
	
	public String getImgfile() {
		return imgfile;
	}
	
	public void setImgfile(String imgfile) {
		this.imgfile = imgfile;
	}
}