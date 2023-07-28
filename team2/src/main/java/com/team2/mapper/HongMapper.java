package com.team2.mapper;

import java.util.List;

import com.team2.component.HongDTO;

public interface HongMapper {
	public String Search(HongDTO dto);
	
	public String Medicine(HongDTO dto);
	
	public List<HongDTO> safe();
	
	public List<HongDTO> data();
		
	}
	