package com.team2.component;

import lombok.Data;

//국립중앙의료원_국립중앙의료원_전국 병·의원 찾기 서비스
//병‧의원 목록정보 조회 -> 병‧의원 정보를 시도/시군구/진료요일/기관별/진료과목별로 조회하고 난 뒤에 결과를 받을 곳
//@Data
public class ChooDTO {
	private int rnum;				//일련번호
	private String dutyAddr;		//주소
	private String dutyDiv;			//병원분류
	private String dutyDivNam;		//병원분류명
	private String dgidIdName;		//진료과목록
	private String dutyName;		//기관명
	private String dutyTel1;		//대표전화
	private String dutyTime1c; 		//진료시간(월요일)C
	private String dutyTime2c;  	//진료시간(화요일)C
	private String dutyTime3c;		//진료시간(수요일)C
	private String dutyTime4c; 		//진료시간(목요일)C
	private String dutyTime5c; 		//진료시간(금요일)C
	private String dutyTime6c; 		//진료시간(토요일)C
	private String dutyTime7c; 		//진료시간(일요일)C
	private String dutyTime8c; 		//진료시간(공휴일)C
	private String dutyTime1s; 		//진료시간(월요일)S
	private String dutyTime2s; 		//진료시간(화요일)S
	private String dutyTime3s; 		//진료시간(수요일)S
	private String dutyTime4s; 		//진료시간(목요일)S
	private String dutyTime5s; 		//진료시간(금요일)S
	private String dutyTime6s; 		//진료시간(토요일)S
	private String dutyTime7s; 		//진료시간(일요일)S
	private String dutyTime8s; 		//진료시간(공휴일)S
	private String hpid;			//기관ID
	private double wgs84Lon;		//병원경도	여기가 100으로 시작하는 곳 X
	private double wgs84Lat;		//병원위도 Y
	
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getDgidIdName() {return dgidIdName;}
	public void setDgidIdName(String dgidIdName) {this.dgidIdName = dgidIdName;}
	public String getDutyAddr() {
		return dutyAddr;
	}
	public void setDutyAddr(String dutyAddr) {
		this.dutyAddr = dutyAddr;
	}
	public String getDutyDiv() {
		return dutyDiv;
	}
	public void setDutyDiv(String dutyDiv) {
		this.dutyDiv = dutyDiv;
	}
	public String getDutyDivNam() {
		return dutyDivNam;
	}
	public void setDutyDivNam(String dutyDivNam) {
		this.dutyDivNam = dutyDivNam;
	}
	public String getDutyName() {
		return dutyName;
	}
	public void setDutyName(String dutyName) {
		this.dutyName = dutyName;
	}
	public String getDutyTel1() {
		return dutyTel1;
	}
	public void setDutyTel1(String dutyTel1) {
		this.dutyTel1 = dutyTel1;
	}
	public String getDutyTime1c() {
		return dutyTime1c;
	}
	public void setDutyTime1c(String dutyTime1c) {
		this.dutyTime1c = dutyTime1c;
	}
	public String getDutyTime2c() {
		return dutyTime2c;
	}
	public void setDutyTime2c(String dutyTime2c) {
		this.dutyTime2c = dutyTime2c;
	}
	public String getDutyTime3c() {
		return dutyTime3c;
	}
	public void setDutyTime3c(String dutyTime3c) {
		this.dutyTime3c = dutyTime3c;
	}
	public String getDutyTime4c() {
		return dutyTime4c;
	}
	public void setDutyTime4c(String dutyTime4c) {
		this.dutyTime4c = dutyTime4c;
	}
	public String getDutyTime5c() {
		return dutyTime5c;
	}
	public void setDutyTime5c(String dutyTime5c) {
		this.dutyTime5c = dutyTime5c;
	}
	public String getDutyTime6c() {
		return dutyTime6c;
	}
	public void setDutyTime6c(String dutyTime6c) {
		this.dutyTime6c = dutyTime6c;
	}
	public String getDutyTime7c() {
		return dutyTime7c;
	}
	public void setDutyTime7c(String dutyTime7c) {
		this.dutyTime7c = dutyTime7c;
	}
	public String getDutyTime8c() {
		return dutyTime8c;
	}
	public void setDutyTime8c(String dutyTime8c) {
		this.dutyTime8c = dutyTime8c;
	}
	public String getDutyTime1s() {
		return dutyTime1s;
	}
	public void setDutyTime1s(String dutyTime1s) {
		this.dutyTime1s = dutyTime1s;
	}
	public String getDutyTime2s() {
		return dutyTime2s;
	}
	public void setDutyTime2s(String dutyTime2s) {
		this.dutyTime2s = dutyTime2s;
	}
	public String getDutyTime3s() {
		return dutyTime3s;
	}
	public void setDutyTime3s(String dutyTime3s) {
		this.dutyTime3s = dutyTime3s;
	}
	public String getDutyTime4s() {
		return dutyTime4s;
	}
	public void setDutyTime4s(String dutyTime4s) {
		this.dutyTime4s = dutyTime4s;
	}
	public String getDutyTime5s() {
		return dutyTime5s;
	}
	public void setDutyTime5s(String dutyTime5s) {
		this.dutyTime5s = dutyTime5s;
	}
	public String getDutyTime6s() {
		return dutyTime6s;
	}
	public void setDutyTime6s(String dutyTime6s) {
		this.dutyTime6s = dutyTime6s;
	}
	public String getDutyTime7s() {
		return dutyTime7s;
	}
	public void setDutyTime7s(String dutyTime7s) {
		this.dutyTime7s = dutyTime7s;
	}
	public String getDutyTime8s() {
		return dutyTime8s;
	}
	public void setDutyTime8s(String dutyTime8s) {
		this.dutyTime8s = dutyTime8s;
	}
	public String getHpid() {
		return hpid;
	}
	public void setHpid(String hpid) {
		this.hpid = hpid;
	}
	public double getWgs84Lon() {
		return wgs84Lon;
	}
	public void setWgs84Lon(double wgs84Lon) {
		this.wgs84Lon = wgs84Lon;
	}
	public double getWgs84Lat() {
		return wgs84Lat;
	}
	public void setWgs84Lat(double wgs84Lat) {
		this.wgs84Lat = wgs84Lat;
	}
	
	
}
