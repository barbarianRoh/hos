package com.team2.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team2.component.RohDTO;

public interface RohMapper {
	
	public int signup(RohDTO dto);
	public int signin(RohDTO dto);
	public int withdrawal(RohDTO dto);
	public RohDTO myinfo(RohDTO dto);
	public void myinfoUpdate(RohDTO dto);
	public RohDTO findMyId(RohDTO dto);
	public RohDTO findMyPw(RohDTO dto);
	public int kSignup(@Param("kId")String kId, @Param("kNick")String kNick, @Param("kGender")String kGender, @Param("kAge")String kAge);
	public int kSignin(@Param("kId")String kId);
	public RohDTO kMyinfo(@Param("kId")String kId);
	public int findTest(RohDTO dto);
	public List<RohDTO> memberList(@Param("startRow")int startRow, @Param("endRow")int endRow);
	public int memberCount();
	public void memberEnabled(RohDTO dto);
	public void memberDisabled(RohDTO dto);
}