package com.team2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.service.KimServiceImpl;


@Controller
public class KimRestController {

	@Autowired
	private KimServiceImpl chatbotService;
	
	@RequestMapping("/kim/chatbotSend")
    public String chatbotSend(@RequestParam("inputText") String inputText,Model model) {
        
        model.addAttribute("message",chatbotService.main(inputText));
        return "kim/message"; 
    }
	
	@RequestMapping("/kim/chatbotArtineer")
    public String chatbotArtineer(@RequestParam("inputText") String inputText,Model model) {
        
        model.addAttribute("message",chatbotService.main(inputText));
        return "kim/message"; 
    }
} 
