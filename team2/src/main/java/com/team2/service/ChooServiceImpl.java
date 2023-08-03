package com.team2.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.component.ChooGesipan;
import com.team2.component.ChooRecon;
import com.team2.component.ChooTestDTO;
import com.team2.component.RohDTO;
import com.team2.component.Userhos;
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
	
	/*
	 * @Override public List<ChooTestDTO> gradeselect(String name, String addr) {
	 * return mapper.gradeselect(name, addr); }
	 */
	
	@Override
	public ChooTestDTO gradecon(int num, String addr) {
		return mapper.gradecon(num, addr);
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
	
	@Override
	public int gesipancount() {
		return mapper.gesipancount();
	}
	
	@Override
	public List<ChooGesipan> gesipanList(int startRow, int endRow){
		return mapper.gesipanList(startRow, endRow);
	}
	
	@Override
	public void gesipaninsert(ChooGesipan dto) {
		mapper.gesipaninsert(dto);
	}
	
	@Override
	public ChooGesipan gesipancon(int num) {
		return mapper.gesipancon(num);
	}
	
	@Override
	public RohDTO kakaomember(String kid) {
		return mapper.kakaomember(kid);
	}
	
	@Override
	public RohDTO kakaomember1(String id1) {
		return mapper.kakaomember(id1);
	}
	
	@Override
	public void reconinsert(ChooRecon dto) {
		mapper.reconinsert(dto);
	}
	
	@Override
	public List<ChooRecon> reconlist(int num){
		return mapper.reconlist(num);
	}
	
	@Override
	public RohDTO memtype(String id) {
		return mapper.memtype(id);
	}
	
	@Override
	public int pwcheck(int num, String pw) {
		return mapper.pwcheck(num, pw);
	}
	
	@Override
	public void gesipanupdate(ChooGesipan dto) {
		mapper.gesipanupdate(dto);
	}
	
	@Override
	public void gesipandelect(int num) {
		mapper.gesipandelect(num);
	}
	
	@Override
	public int conCheck(String id) {
		return mapper.conCheck(id);
	}
	
	@Override
	public List<ChooGesipan> mycon(String id){
		return mapper.mycon(id);
	}
	
	@Override
	public void userhos(Userhos hos) {
		mapper.userhos(hos);
	}
	
	@Override
	public void kakaouserhos(Userhos hos) {
		mapper.kakaouserhos(hos);
	}
	
	@Override
	public List<Userhos> userhosselect(String id){
		return mapper.userhosselect(id);
	}
}