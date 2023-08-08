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
import org.springframework.dao.DataIntegrityViolationException;
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
	public String home() {
		return "/roh/home";
	}
	@RequestMapping("test")
	public String test() {
		return "/roh/test";
	}
	
	// 카카오맵 API+약국
	@RequestMapping("pharmacyMap")
	public String pharmacyMap() {
		return "/roh/pharmacyMap";
	}
	
	// 부트스트랩 테스트 
	@RequestMapping("components")
	public String contactPage() {
		return "/roh/components";
	}
	// 부트스트랩 테스트2
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
		String message = "";
		try {
			int result = service.signup(dto);
			if(result == 1) {
				message = "ok";
			} else {
				message = "failed";
			}
		} catch(DataIntegrityViolationException e) {
			message = "failed2";
		}
		
		return message;
	}
	
	// 로그인 프로
	@RequestMapping("signinPro")
	public String signinPro(RohDTO dto, Model model, HttpSession session) {
		
		int result = service.signin(dto);
		if(result == 1) {
			dto = service.myinfo(dto);
			session.setAttribute("sid", dto.getId());
			session.setAttribute("sname", dto.getName());
			session.setAttribute("sbirth", dto.getBirth());
			session.setAttribute("smembertype", dto.getMemberType());
			session.setAttribute("senabled", dto.getEnabled());
			System.out.println(dto.getEnabled());
			if(dto.getEnabled().equals("0")) {
				model.addAttribute("enabledFailed", true);
				session.invalidate();
			}
		} else { 
			model.addAttribute("loginFailed", true);
		}
		return "/roh/home";
	}
	
	//로그아웃
	@RequestMapping("signout")
	public String signout(HttpSession session, Model model) {
		session.invalidate();
		model.addAttribute("logout", true);
		return "/roh/home";
	}
	
	// 회원탈퇴 폼
	@RequestMapping("withdrawalForm")
	public String withdrawalForm(HttpSession session) {
		session.getAttribute("sid");
		return "/roh/withdrawalForm";
	}
	
	// 회원탈퇴 프로
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
	
	// 내정보 폼
	@RequestMapping("myProfileForm")
	public String myProfile() {
		return "roh/myProfileForm";
	}
	
	// 내정보 프로
	@RequestMapping("myProfilePro")
	public String myProfilePro(RohDTO dto, Model model, HttpSession session) {
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
	
	// 아이디 찾기 폼
	@RequestMapping("findMyIdForm")
	public String findMyIdForm() {
		return "roh/findMyIdForm";
	}
	
	// 아이디찾기 프로
	@RequestMapping("findMyIdPro")
	public String findMyIdPro(RohDTO dto, Model model) {
		int result = 0;
		result = service.findTest(dto);
		
		if(result == 1) {
			RohDTO resultId = service.findMyId(dto);
			
			if(resultId.getId() != null) {
				model.addAttribute("findMyId", resultId.getId());
			}
		}
		return "roh/findMyIdForm";
	}
	
	// 비밀번호 찾기 폼
	@RequestMapping("findMyPwForm")
	public String findMyPwForm() {
		return "roh/findMyPwForm";
	}
	
	// 비밀번호 찾기 프로
	@RequestMapping("findMyPwPro")
	public String findMyPwPro(RohDTO dto, Model model) {
		int result = 0;
		result = service.findTest(dto);
		
		if(result == 1) {
			RohDTO resultId = service.findMyId(dto);
			
			if(resultId.getId() != null) {
				model.addAttribute("findMyPw", resultId.getPw());
			}
		}
		return "roh/findMyPwForm";
	}
	
	// 카카오 로그인 폼(테스트용)
	@RequestMapping("kakaoSigninForm")
	public String kakaoSigninForm() {
		return "roh/kakaoSigninForm";
	}
	
	// 카카오 로그인 프로
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
	
	@RequestMapping("adminForm")
	public String adminForm(Model model, String pageNum) {
		int pageSize = 10;
		if(pageNum == null || pageNum.isEmpty()) {pageNum = "1";}
		int currentPage = Integer.parseInt(pageNum);
		
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		List<RohDTO> list = service.memberList(startRow, endRow);
		
		int count = service.memberCount();
		
		if(count > 0) {
			int pageCount = count / pageSize + (count % pageSize == 0? 0:1);
			int pageBlock = 10;
			int startPage = (int)(currentPage / 10) * 10 + 1;
			int endPage = startPage + pageBlock -1;
			
			if(endPage > pageCount) {endPage = pageCount;}
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("startPage", startPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageNum", pageNum);
		}
		
		model.addAttribute("list", list);
		return "roh/adminForm";
	}
	
	@RequestMapping("memberEnabled")
	public String memberEnabled(RohDTO dto, HttpServletRequest rq) {
		String pageNum = rq.getParameter("pageNum");
		if(pageNum == null || pageNum.isEmpty()) {pageNum = "1";}
		service.memberEnabled(dto);
		return "redirect:/roh/adminForm?pageNum=" + pageNum;
	}
	
	@RequestMapping("memberDisabled")
	public String memberDisabled(RohDTO dto, HttpServletRequest rq) {
		String pageNum = rq.getParameter("pageNum");
		if(pageNum == null || pageNum.isEmpty()) {pageNum = "1";}
		service.memberDisabled(dto);
		return "redirect:/roh/adminForm?pageNum=" + pageNum;
	}
	
}