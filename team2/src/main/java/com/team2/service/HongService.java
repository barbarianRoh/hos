package com.team2.service;

import java.util.List;

import org.springframework.ui.Model;

import com.team2.component.HongDTO;
import com.team2.controller.DataApiClient;

public interface HongService {
	public String Search(HongDTO dto);
	
	public String Medicine(HongDTO dto);
	
	public List<HongDTO> safe();
	
	public List<HongDTO> data();
	
}