package com.team2.service;

import java.util.List;
import com.team2.component.ChooTestDTO;

public interface ChooService {

	public List<ChooTestDTO> gradeList(String name, String addr, int startRow, int endRow);
	
	public int hosCheck(String name, String addr);
	
	public void insert(ChooTestDTO dto);
	
	// public ChooTestDTO gradeselect(String name, String addr);
	
	public List<ChooTestDTO> gradeselect(String name, String addr);
	
	public ChooTestDTO gradecon(int num, String addr);
	
	public int goodCheck(int num, String name, String addr, String id);
	
	public void goodinsert(int num, String name, String addr, String id);
	
	public void goodupdate(int num, String name, String addr, String id);
	
	public int pwCheck(int num, String pw);
	
	public void gradeUpdate(ChooTestDTO dto);
	
	public void gradedelect(int num, String addr);
}
