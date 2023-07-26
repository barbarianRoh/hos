package com.team2.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.team2.component.ChooTestDTO;
import com.team2.mapper.ChooMapper;

@Service
public class ChooServiceImpl implements ChooService {

	@Autowired
	private ChooMapper mapper;
	
	@Override
	public List<ChooTestDTO> gradeList(String name, String addr, int startRow, int endRow){
		return mapper.gradeList(name, addr, startRow, endRow);
	}
	
	@Override
	public int hosCheck(String name, String addr) {
		return mapper.hosCheck(name, addr);
	}
	
	@Override
	public void insert(ChooTestDTO dto) {
		mapper.insert(dto);
	}
	
//	@Override
//	public ChooTestDTO gradeselect(String name, String addr) {
//		return mapper.gradeselect(name, addr);
//	}
	
	@Override
	public List<ChooTestDTO> gradeselect(String name, String addr) {
		return mapper.gradeselect(name, addr);
	}
	
	@Override
	public ChooTestDTO gradecon(int num, String addr) {
		return mapper.gradecon(num, addr);
	}
	
	@Override
	public int goodCheck(int num, String name, String addr, String id) {
		return mapper.goodCheck(num, name, addr, id);
	}
	
	@Override
	public void goodinsert(int num, String name, String addr, String id) {
		mapper.goodinsert(num, name, addr, id);
	}
	
	@Override
	public void goodupdate(int num, String name, String addr, String id) {
		mapper.goodupdate(num, name, addr, id);
	}
	
	@Override
	public int pwCheck(int num, String pw) {
		return mapper.pwCheck(num, pw);
	}
	
	@Override
	public void gradeUpdate(ChooTestDTO dto) {
		mapper.gradeUpdate(dto);
	}
	
	@Override
	public void gradedelect(int num, String addr) {
		mapper.gradedelect(num, addr);
	}
}