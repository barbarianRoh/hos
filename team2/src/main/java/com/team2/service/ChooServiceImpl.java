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
	public ChooTestDTO hospitalselect(String name) {
		return mapper.hospitalselect(name);
	}
	
	@Override
	public int nameCheck(String name) {
		return mapper.nameCheck(name);
	}
	
	
}