package com.team2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team2.component.HongDTO;
import com.team2.controller.DataApiClient;
import com.team2.mapper.HongMapper;

@Service
public class HongServiceImpl implements HongService {

	@Autowired
	private HongMapper mapper;
	
	@Autowired
	private HongService service;

	@Override
	public String Search(HongDTO dto) {
		return null;
	}

	@Override
	public String Medicine(HongDTO dto) {
		return null;
	}

	@Override
	public List<HongDTO> safe() {
		return mapper.safe();
	}

	@Override
	public List<HongDTO> data() {
		return mapper.data();
	}

	@Override
	public HongDTO getcontent(HongDTO dto) {
		return mapper.getcontent(dto);
	}
}