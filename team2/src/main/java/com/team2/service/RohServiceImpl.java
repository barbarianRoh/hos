package com.team2.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.mapper.RohMapper;

@Service
public class RohServiceImpl implements RohService {

	@Autowired
	private RohMapper mapper;

	@Override
	public int countContent() {
		return mapper.countContent();
	}
}