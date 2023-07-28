package com.team2.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.team2.component.RohDTO;
import com.team2.service.RohService;

@Controller
@RequestMapping("/roh/*")
public class RohController {
	
	@Autowired
	private RohService service;
	
	// 홈페이지
	@RequestMapping("/")
	public String home(HttpSession session, Model model) {
		String sid = (String)session.getAttribute("id");
		model.addAttribute("sid", sid);
		return "/roh/home";
	}
	
	// 카카오맵 API+약국
	@RequestMapping("kakaophar")
	public String kakaophar(Model model) {
		return "/roh/kakao-phar";
	}
	
	// 부트스트랩 테스트 
	@RequestMapping("components")
	public String contactPage() {
		return "/roh/components";
	}
	
	@RequestMapping("index")
	public String index() {
		return "/roh/index";
	}
	
	// 회원가입 폼
	@RequestMapping("signupForm")
	public String signupForm() {
		return "/roh/signupForm";
	}
	
	// 회원가입 프로
	@RequestMapping("signupPro")
	@ResponseBody
	public String signupPro(RohDTO dto, Model model) {
		int result = service.signup(dto);
		String message = "";
		
		if(result == 1) {
    		message = "ok";
    	} else {
    		message = "실패";
    	}
		
		return message;
	}
	
	@RequestMapping("signinPro")
	public String signinPro(RohDTO dto, Model model, HttpSession session) {
		System.out.println(dto);
		
		int result = service.signin(dto);
		if(result == 1) {
			dto = service.myinfo(dto);
			session.setAttribute("sid", dto.getId());
		} else { 
			model.addAttribute("loginFailed", true);
		}
		return "/roh/home";
	}
	
	@RequestMapping("signout")
	public String signout(HttpSession session, Model model) {
		session.invalidate();
		model.addAttribute("logout", true);
		return "/roh/home";
	}
	
	@RequestMapping("withdrawalForm")
	public String withdrawalForm(HttpSession session) {
		session.getAttribute("sid");
		return "/roh/withdrawalForm";
	}
	
	@RequestMapping("withdrawalPro")
	public String withdrawalPro(HttpSession session, RohDTO dto, Model model) {
		String formPw = dto.getPw();
		dto = service.myinfo(dto);
		String dtoPw = dto.getPw();
		
		if(formPw == null || !formPw.equals(dtoPw)) {
			model.addAttribute("pwError", true);
		} else {
			int result = service.withdrawal(dto);
			if(result == 1) {
				model.addAttribute("withdrawalSuccess", true);
				session.invalidate();
			} else {
				model.addAttribute("withdrawalError", true);
			}
		}
		return "roh/withdrawalForm";
	}
	
	@RequestMapping("myProfileForm")
	public String myProfile(RohDTO dto, Model model, HttpSession session) {
		String sid = (String)session.getAttribute("sid");
		String spw = (String)session.getAttribute("spw");
		dto.setId(sid);
		dto.setPw(spw);
		dto = service.myinfo(dto);
		model.addAttribute("dto", dto);
		
		return "roh/myProfileForm";
	}
	
	@RequestMapping("myProfilePro")
	public String myProfilePro(RohDTO dto, Model model, HttpSession session) {
		String id = dto.getId();
		String formPw = (String)dto.getPw(); // 폼에서 입력한 기존 비밀번호
		String pw2 = (String)dto.getPw2(); // 바꿀 비밀번호
		String pw3 = (String)dto.getPw3(); // 확인
		
		if (pw2 == null && pw3 == null) {
	        model.addAttribute("nullError", true);
	        return "roh/myProfileForm";
	    }
		
		RohDTO dto2 = service.myinfo(dto);
		String dtoPw = dto2.getPw();
		
		if(dtoPw.equals(formPw)) {
			if(pw2.equals(pw3)) {
				service.myinfoUpdate(dto);
				model.addAttribute("infoUpdate", true);
			} else {
				model.addAttribute("pwError2", true);
			}
		} else {
			model.addAttribute("pwError", true);
		}
		return "roh/myProfileForm";
	}
	
	@RequestMapping("findMyIdForm")
	public String findMyIdForm() {
		return "roh/findMyIdForm";
	}
	
	@RequestMapping("findMyIdPro")
	public String findMyIdPro(RohDTO dto, Model model) {
		if(dto != null) {
			RohDTO resultId = service.findMyId(dto);
			
			if(resultId.getId() != null) {
				model.addAttribute("findMyId", resultId.getId());
			}
		}
		return "roh/findMyIdForm";
	}
	
	@RequestMapping("findMyPwForm")
	public String findMyPwForm() {
		return "roh/findMyPwForm";
	}
	
	@RequestMapping("findMyPwPro")
	public String findMyPwPro(RohDTO dto, Model model) {
		if(dto != null) {
			RohDTO resultId = service.findMyId(dto);
			
			if(resultId.getPw() != null) {
				model.addAttribute("findMyPw", resultId.getPw());
			}
		}
		return "roh/findMyPwForm";
	}
	
	@RequestMapping("kakaoSignin")
	public String kakaoSignin() {
		return "roh/kakaoSignin";
	}
	
	@RequestMapping("kakaoSigninPro")
	   public String kakaoSigninPro(HttpSession session, @RequestParam("id") String id, @RequestParam("nick") String nick, @RequestParam("email") String email, @RequestParam("gender") String gender, @RequestParam("age_range") String age_range) {
	      String k_id = id; 
	      String k_nick = nick;
	      String k_email = email;
	      String k_gender = gender;
	      String k_range = age_range;
	      int count = kakaoservice.countkakao(k_id);
	      if(count==0) {
	         kakaoservice.kakaoLogin(k_id, k_nick, k_email, k_gender, k_range);
	      }
	      session.setAttribute("kakaoid", k_nick);
	      session.setAttribute("kakaonick", k_id);
	      return "/member/member_login";
	   }
	
}