package com.team2.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.component.RohDTO;
import com.team2.mapper.RohMapper;

@Service
public class RohServiceImpl implements RohService {

	@Autowired
	private RohMapper mapper;

	@Override
	public int signup(RohDTO dto) {
		return mapper.signup(dto);
	}
	
	@Override
	public int signin(RohDTO dto) {
		return mapper.signin(dto);
	}
	
	@Override
	public int withdrawal(RohDTO dto) {
		return mapper.withdrawal(dto);
	}
	
	@Override
	public RohDTO myinfo(RohDTO dto) {
		return mapper.myinfo(dto);
	}
	
	@Override
	public void myinfoUpdate(RohDTO dto) {
		mapper.myinfoUpdate(dto);
	}
}