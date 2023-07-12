package com.team2.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team2.controller.DataApiClient;
import com.team2.mapper.HongMapper;

@Service
public class HongServiceImpl implements HongService {

	@Autowired
	private HongMapper mapper;
	
}