package com.team2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team2.service.KimService;


@Controller
@RequestMapping("/kim/*")
public class KimController {
	
	@Autowired
	private KimService service;
	
	@RequestMapping("/symptom")
	public String symptom() {
		return "kim/symptom";
	}
	
	@RequestMapping("/chatForm")
	public String chatForm() {
		return "kim/chatForm";
	}
	
	@RequestMapping("/newbutton")
	public String loadNewButton(Model model) {
		return "kim/newbutton";
	}

	
}
