package com.team2.service;

import java.util.List;

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
	
	@Override
	public RohDTO findMyId(RohDTO dto) {
		return mapper.findMyId(dto);
	}
	
	@Override
	public RohDTO findMyPw(RohDTO dto) {
		return mapper.findMyPw(dto);
	}
	
	@Override
	public int kSignup(String kId, String kNick, String kGender, String kAge) {
		return mapper.kSignup(kId, kNick, kGender, kAge);
	}
	
	@Override
	public int kSignin(String kId) {
		return mapper.kSignin(kId);
	}
	
	@Override
	public RohDTO kMyinfo(String kId) {
		return mapper.kMyinfo(kId);
	}
	
	@Override
	public int findTest(RohDTO dto) {
		return mapper.findTest(dto);
	}
	
	@Override
	public List<RohDTO> memberList(int startRow, int endRow) {
		return mapper.memberList(startRow, endRow);
	}
	
	@Override
	public int memberCount() {
		return mapper.memberCount();
	}
}