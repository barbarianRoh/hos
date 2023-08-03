package com.team2.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.mapper.KimMapper;

@Service
public class SympotyServiceImpl implements SympotyService{
	
	@Autowired
	private KimMapper mapper;
	
	@Override
	public void updateSymptomCount(String symptomName) {
		mapper.updateSymptomCount(symptomName);
	}

}
