package com.team2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.mapper.KimMapper;
import com.team2.service.SympotyService;


@Controller
@RequestMapping("/kim/*")
public class KimController {
	
	
	@Autowired
	private SympotyService service;
	
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
	
    @RequestMapping("/updateSymptomCount")
    public String updateSymptomCount(@RequestParam("symptomName") String symptomName) {
        service.updateSymptomCount(symptomName);
        return "redirect:/symptom";
    }

	
}
