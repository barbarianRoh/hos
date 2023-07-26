package com.team2.service;

import com.team2.component.RohDTO;

public interface RohService {
	
	public int signup(RohDTO dto);
	public int signin(RohDTO dto);
	public int withdrawal(RohDTO dto);
	public RohDTO myinfo(RohDTO dto);
	public void myinfoUpdate(RohDTO dto);
}