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
	
	@RequestMapping("/kim/chatbotArtineer")
    public String chatbotSend(@RequestParam("inputText") String inputText,Model model) {
        
        model.addAttribute("message",chatbotService.chatbotArtineer(inputText));
        return "kim/message"; 
    }
	
	@RequestMapping("/roh/chatbotArtineer1")
    public String chatbotSend2(@RequestParam("inputText") String inputText,Model model) {
        
        model.addAttribute("message",chatbotService.chatbotArtineer(inputText));
        return "kim/message"; 
    }
	
	
	

} 
