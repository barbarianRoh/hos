package com.team2.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team2.component.KimDTO;
import com.team2.mapper.KimMapper;
import com.team2.service.RohService;
import com.team2.service.SympotyService;


@Controller
@RequestMapping("/kim/*")
public class KimController {
	
	
	@Autowired
	private SympotyService service;
	
	@Autowired
	private RohService service2;
	
	@RequestMapping("/symptom")
	public String symptom() {
		return "kim/symptom";
	}
	@RequestMapping("/main")
	public String main() {
		return "kim/main";
	}
	@RequestMapping("/symptomtest")
	public String symptomtest() {
		return "kim/symptomtest";
	}
	
	@RequestMapping("/buttonex")
	public String buttonex() {
		return "kim/buttonex";
	}
	
	@RequestMapping("/buttonex2")
	public String buttonex2() {
		return "kim/buttonex2";
	}
	
	@RequestMapping("/chatForm")
	public String chatForm() {
		return "kim/chatForm";
	}
	
	@RequestMapping("/newbutton")
	public String loadNewButton(Model model) {
		return "kim/newbutton";
	}
	
    @RequestMapping("/increaseCount")
    @ResponseBody
    public void updateSymptomCount(@RequestParam("symptomName") String symptomName) {
        KimDTO kimDTO = new KimDTO();
        kimDTO.setSymptom_name(symptomName);
        service.updateSymptomCount(kimDTO);
    }
    
    
 	@RequestMapping("kakaoSigninPro")
 	public String kakaoSigninPro(HttpSession session,
 			@RequestParam String id,
 			@RequestParam String nick,
 			@RequestParam String gender,
 			@RequestParam String age_range) {
 		
 		String kId = id; 
 		String kNick = nick;
 		String kGender = gender;
 		String kAge = age_range;
 	      
 		int count = service.kSignin(kId);
 	      
 		if(count == 0) {
 			service.kSignup(kId, kNick, kGender, kAge);
 		}
 		session.setAttribute("kid", kId);
 		session.setAttribute("knick", kNick);
 		session.setAttribute("kgender", kGender);
 		session.setAttribute("kage", kAge);
 		
 		return "roh/home";
 	}

	
}
