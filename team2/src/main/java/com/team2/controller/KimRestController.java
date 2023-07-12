package com.team2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.team2.service.KimServiceImpl;


@RestController
public class KimRestController {

	@Autowired
	private KimServiceImpl chatbotService;
	
	@RequestMapping("/kim/chatbotSend")
    public String chatbotSend(@RequestParam("inputText") String inputText) {
        String msg = "";
        msg = chatbotService.main(inputText);
        return msg;
    }
}
