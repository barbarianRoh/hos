package com.team2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team2.service.RohService;

@Controller
@RequestMapping("/roh/*")
public class RohController {
	
	@Autowired
	private RohService service;
	
	@RequestMapping("maptest")
	public String maptest() {
		return "/roh/maptest";
	}
	
	@RequestMapping("apitest")
	public String apitest() {
		return "/roh/apitest";
	}
	
	@RequestMapping("maptest2")
	public String maptest2() {
		return "/roh/maptest2";
	}
}
