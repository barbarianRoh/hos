package com.team2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
import com.team2.service.ChooGPShos;
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
	@Autowired
	private ChooGPShos api3;
	
	@RequestMapping("hosselect")
	public String hosselect(ChooTestDTO dto, Model model) {
		return "/choo/hosselect";
	}
	
	@RequestMapping("hosinfo")
	public String hosinfo(Model model, String QN) {
		try {
			ChooDTO dto = api1.hpidlist(QN);
			ChooDTO dto1 = api2.hpidselect1(dto);
			
			model.addAttribute("dto", dto1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/choo/hosinfo";
	}
	
	@RequestMapping("addressselect")
	public String addressselect(Model model) {		//시랑 구를 텍스트로 입력값을 넣는 페이지
		try {
			String Q0 = "";
			String Q1 = "";
			
			List<String> hpid1 = api1.hpidlist(Q0,Q1);
			List<ChooDTO> hosresult1 = api2.hpidselect1(hpid1);
			
			model.addAttribute("hos",hosresult1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/choo/addressselect";
	}
	
	@RequestMapping("hosapiresult")			//시도군과 진료과를 입력받아서 api를 이용해서 검색하는 곳
	public String hosapiresult(Model model, String Q0, String Q1, String QD) throws Exception{
		try {
			List<String> hpid = api1.hpidlist(Q0,Q1,QD);	 //첫번쪠 api를 써서 기관id를 가져오는 곳
			List<ChooDTO> hosresult = api2.hpidselect(hpid); //기관id를 입력해서 해당 병원에 정보를 가지고 오는 곳
		
			double a = hosresult.get(0).getWgs84Lat();
			double b = hosresult.get(0).getWgs84Lon();
		
			model.addAttribute("x", a);			//검색한 값의 위치로 지도를 이동시키기 위한 경도/위도값
			model.addAttribute("y", b);			//검색한 값의 위치로 지도를 이동시키기 위한 경도/위도값
			model.addAttribute("hos", hosresult);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/choo/hosapiresult";
	}
	
	@RequestMapping("GPSselect")
	public String GPSselect() {
		return "/choo/GPSselect";
	}
	
	@RequestMapping("GPSresult")			//GPS기준으로 주변 병원 검색결과 보는 페이지
	public String GPSresult(Model model, double WGS84_LAT, double WGS84_LON, String QD, String Q0, String Q1) {
		try {
			List<String> hosname = api3.GPSselect(WGS84_LAT, WGS84_LON);
			List<String> hpid2 = api1.hosselect(hosname, QD, Q0, Q1);
			
			//System.out.println(WGS84_LAT);
			//System.out.println(WGS84_LON);
			//System.out.println(Q0);
			//System.out.println(Q1);
			System.out.println(QD);
			
			for(int a = 0; a < hpid2.size(); a++) {		//값이 넘어오고 있는지 확인
				System.out.println(hpid2.get(a));
			}
			
		if(hpid2.size() != 0) {
			List<ChooDTO> hosresult2 = api2.hosselect(hpid2);
			
			//for(int b = 0; b < hosresult2.size(); b++) {		//값이 넘어오고 있는지 확인
				//System.out.println(hosresult2.get(b).getWgs84Lat());
			//}
			
			double a = hosresult2.get(0).getWgs84Lat();
			double b = hosresult2.get(0).getWgs84Lon();
			
			model.addAttribute("x", b);			//검색한 값의 위치로 지도를 이동시키기 위한 경도/위도값
			model.addAttribute("y", a);			//검색한 값의 위치로 지도를 이동시키기 위한 경도/위도값
			model.addAttribute("hos", hosresult2);
		}else {
			List<ChooDTO> hosresult2 = api2.hosselect(hpid2);
			
			model.addAttribute("hos", hosresult2);
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "choo/GPSresult";
	}
}
