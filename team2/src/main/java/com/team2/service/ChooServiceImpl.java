package com.team2.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.mapper.ChooMapper;

@Service
public class ChooServiceImpl implements ChooService {

	@Autowired
	private ChooMapper mapper;
	
}