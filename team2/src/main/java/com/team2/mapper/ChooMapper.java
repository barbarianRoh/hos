package com.team2.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team2.component.ChooTestDTO;

public interface ChooMapper {
	
	public List<ChooTestDTO> gradeList(@Param("name") String name, @Param("addr") String addr,@Param("startRow") int startRow, @Param("endRow") int endRow);
	
	public int hosCheck(@Param("name")String name,@Param("addr") String addr);
	
	public void insert(ChooTestDTO dto);
	
	//public ChooTestDTO gradeselect(@Param("name")String name, @Param("addr")String addr);
	
	public List<ChooTestDTO> gradeselect(@Param("name")String name, @Param("addr")String addr);
	
	public ChooTestDTO gradecon(@Param("num")int num,@Param("addr") String addr);
	
	public int goodCheck(@Param("num") int num, @Param("name") String name, @Param("addr") String addr, @Param("id") String id);
	
	public int badCheck(@Param("num") int num, @Param("name") String name, @Param("addr") String addr, @Param("id") String id);
	
	public void goodinsert(@Param("num") int num, @Param("name") String name, @Param("addr") String addr, @Param("id") String id);
	
	public void goodupdate(@Param("num") int num, @Param("name") String name, @Param("addr") String addr, @Param("id") String id);
	
	public int pwCheck(@Param("num") int num, @Param("pw") String pw);
	
	public void gradeUpdate(ChooTestDTO dto);
	
	public void gradedelect(@Param("num")int num,@Param("addr") String addr);
}