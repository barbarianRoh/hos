package com.team2.mapper;

import com.team2.component.RohDTO;

public interface RohMapper {
	
	public int signup(RohDTO dto);
	public int signin(RohDTO dto);
	public int withdrawal(RohDTO dto);
	public RohDTO myinfo(RohDTO dto);
	public void myinfoUpdate(RohDTO dto);
	public RohDTO findMyId(RohDTO dto);
	public RohDTO findMyPw(RohDTO dto);
}