package com.team2.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team2.component.ChooGesipan;
import com.team2.component.ChooRecon;
import com.team2.component.ChooTestDTO;
import com.team2.component.RohDTO;
import com.team2.component.Userhos;

public interface ChooMapper {
	
	//각병원 게시판 글 있는지 없는지 확인하고 있으면 해당 글 정보를 가지고 오는 곳
	public List<ChooTestDTO> gradeList(@Param("name") String name, @Param("addr") String addr,@Param("startRow") int startRow, @Param("endRow") int endRow);
	
	//글이 몇개가 있는지 확인
	public int hosCheck(@Param("name")String name,@Param("addr") String addr);
	
	//각 병원 평가게시판 글작성
	public void insert(ChooTestDTO dto);
	
	//public List<ChooTestDTO> gradeselect(@Param("name")String name, @Param("addr")String addr);
	
	//병원 평가 게시글 내용 꺼내오는 곳
	public ChooTestDTO gradecon(@Param("num")int num,@Param("addr") String addr);
	
	//글수정 삭제할 때 비밀번호 체크
	public int pwCheck(@Param("num") int num, @Param("pw") String pw);
	
	//각 병원 게시글 수정하는 곳
	public void gradeUpdate(ChooTestDTO dto);
	
	//각 병원 게시글 삭제하는 곳
	public void gradedelect(@Param("num")int num,@Param("addr") String addr);
	
	//고객센터 의견보내기 게시판에 글이 몇개가 있는지 확인
	public int gesipancount();
	
	//고객센터 의견보내기에 글이 있으면 해당 글 전부를 가지고 와서 출력
	public List<ChooGesipan> gesipanList(@Param("startRow") int startRow, @Param("endRow") int endRow);
	
	//고객센터 의견보내기 게시글 작성
	public void gesipaninsert(ChooGesipan dto);
	
	//카카오로 로그인한 유저 정보를 가지고 오는 곳
	public RohDTO kakaomember(String kid);
	
	//카카오로 로그인한 유저 정보를 가지고 오는 곳
	public RohDTO kakaomember1(String id1);
	
	//의견보내기 게시글을 글번호로 검색해서 해당 글의 값을 가지고 옴
	public ChooGesipan gesipancon(int num);
	
	//게시글에 대한 답글 작성
	public void reconinsert(ChooRecon dto);
	
	//게시글에 대한 답글이 작성 된 게 있을 때 해당 글을 출력
	public List<ChooRecon> reconlist(int num);
	
	//관리자인지 유저인지 확인하기 위한 곳
	public RohDTO memtype(String id);
	
	//의견보내기 게시글 수정/삭제할 때 비밀번호를 확인
	public int pwcheck(@Param("num") int num, @Param("pw") String pw);
	
	//의견보내기 게시글 수정
	public void gesipanupdate(ChooGesipan dto);
	
	//의견보내기 게시글 삭제
	public void gesipandelect(int num);
	
	//고객센터 내가 쓴 글 확인
	public int conCheck(String id);
	
	//글이 있을 때 해당 글들을 가지고 옴
	public List<ChooGesipan> mycon(String id);
	
	public void userhos(Userhos hos);				//최근 찾은 병원 유저용
	
	public void kakaouserhos(Userhos hos);			//최근 찾은 병원 카카오 유저용
	
	public List<Userhos> userhosselect(String id);
}