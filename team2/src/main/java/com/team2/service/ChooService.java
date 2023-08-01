package com.team2.service;

import java.util.List;

import com.team2.component.ChooGesipan;
import com.team2.component.ChooRecon;
import com.team2.component.ChooTestDTO;
import com.team2.component.RohDTO;
import com.team2.component.Userhos;

public interface ChooService {

	public List<ChooTestDTO> gradeList(String name, String addr, int startRow, int endRow);
	
	public int hosCheck(String name, String addr);
	
	public void insert(ChooTestDTO dto);
	
	// public ChooTestDTO gradeselect(String name, String addr);
	
	public List<ChooTestDTO> gradeselect(String name, String addr);
	
	public ChooTestDTO gradecon(int num, String addr);
	
	public int goodCheck(int num, String name, String addr, String id);
	
	public int badCheck(int num, String name, String addr, String id);
	
	public void goodinsert(int num, String name, String addr, String id);
	
	public void goodupdate(int num, String name, String addr, String id);
	
	public int pwCheck(int num, String pw);
	
	public void gradeUpdate(ChooTestDTO dto);
	
	public void gradedelect(int num, String addr);
	
	public int gesipancount();
	
	public List<ChooGesipan> gesipanList(int startRow, int endRow);
	
	public void gesipaninsert(ChooGesipan dto);
	
	public RohDTO kakaomember(String id);
	
	public RohDTO kakaomember1(String id1);
	
	public ChooGesipan gesipancon(int num);
	
	public void reconinsert(ChooRecon dto);
	
	public List<ChooRecon> reconlist(int num);
	
	public RohDTO memtype(String id);
	
	public int pwcheck(int num, String pw);
	
	public void gesipanupdate(ChooGesipan dto);
	
	public void gesipandelect(int num);
	
	public int conCheck(String id);
	
	public List<ChooGesipan> mycon(String id);
	
	public void userhos(Userhos hos);
	
	public void kakaouserhos(Userhos hos);
}
