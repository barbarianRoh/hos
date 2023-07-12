package com.team2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;

import com.team2.component.ChooDTO;
import com.team2.component.ChooTestDTO;
import com.team2.service.ChooService;
import com.team2.service.Choohosapi;
import com.team2.service.Choohosapi2;

@Controller
@RequestMapping("/choo/*")
public class ChooController {
	
	@Autowired
	private ChooService service;
	@Autowired
	private Choohosapi api1;
	@Autowired
	private Choohosapi2 api2;
	
	@RequestMapping("map")
	public String hosmap(ChooTestDTO dto, Model model) {
		return "/choo/hosselect";
	}
	
	@RequestMapping("hosinfo")
	public String hosinfo(Model model, HttpServletRequest request, String name) {
		int count = service.nameCheck(name);
		model.addAttribute("count",count);
	if(count == 1) {
		ChooTestDTO dto = service.hospitalselect(name);
		double x = (double)dto.getJwapyoX();
		double y = (double)dto.getJwapyoY();
		model.addAttribute("name",name);
		model.addAttribute("x", x);
		model.addAttribute("y", y);
	}
		return "/choo/hosinfo";
	}
	
	@RequestMapping("addressselect")
	public String addressselect() {		//시랑 구를 텍스트로 입력값을 넣는 페이지
		return "/choo/addressselect";
	}
	
	@RequestMapping("hosapi")			//시도군을 입력받아서 api를 이용해서 검색하는 곳
	public String hosapi(Model model, String Q0, String Q1, String QD) throws Exception{
		List<String> hpid = api1.hpidlist(Q0,Q1,QD);	 //첫번쪠 api를 써서 기관id를 가져오는 곳
		List<ChooDTO> hosresult = api2.hpidselect(hpid); //기관id를 입력해서 해당 병원에 정보를 가지고 오는 곳
		
		double a = hosresult.get(0).getWgs84Lat();
		double b = hosresult.get(0).getWgs84Lon();
		
		model.addAttribute("x", a);
		model.addAttribute("y", b);
		model.addAttribute("hos", hosresult);
		return "/choo/hosapiresult";
	}
	
	@RequestMapping("hosapiresult")
	public String hosapiresult(Model model) {
		return "/choo/hosapiresult";
	}
}
