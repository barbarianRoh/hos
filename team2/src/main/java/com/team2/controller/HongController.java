package com.team2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team2.service.HongService;

@Controller
@RequestMapping("/roh/*")
public class HongController {
	
	@Autowired
	private HongService service;
	
}
