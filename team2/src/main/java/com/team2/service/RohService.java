package com.team2.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team2.component.RohDTO;

public interface RohService {
	
	public int signup(RohDTO dto);
	public int signin(RohDTO dto);
	public int withdrawal(RohDTO dto);
	public RohDTO myinfo(RohDTO dto);
	public void myinfoUpdate(RohDTO dto);
	public RohDTO findMyId(RohDTO dto);
	public RohDTO findMyPw(RohDTO dto);
	public int kSignup(String kId, String kNick, String kGender, String kAge);
	public int kSignin(String kId);
	public RohDTO kMyinfo(String kId);
	public int findTest(RohDTO dto);
	public List<RohDTO> memberList(int startRow, int endRow);
	public int memberCount();
}