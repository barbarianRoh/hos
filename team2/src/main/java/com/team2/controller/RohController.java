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
	
	@RequestMapping("test")
	public String test(Model model) {
		int count = service.countContent();
		model.addAttribute("count", count);
		return "/roh/test";
	}
}
