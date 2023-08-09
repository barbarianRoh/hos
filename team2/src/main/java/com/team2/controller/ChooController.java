package com.team2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.SessionScope;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.IOException;

import com.team2.component.ChooDTO;
import com.team2.component.ChooGesipan;
import com.team2.component.ChooRecon;
import com.team2.component.ChooTestDTO;
import com.team2.component.RohDTO;
import com.team2.component.Userhos;
import com.team2.service.ChooGPShos;
import com.team2.service.ChooService;
import com.team2.service.Choohosapi;
import com.team2.service.Choohosapi2;

@Controller
@RequestMapping("/choo/*")
public class ChooController {
	// 1 사용자 2 운영자 0 미회원유저
	@Autowired
	private ChooService service;
	@Autowired
	private Choohosapi api1;
	@Autowired
	private Choohosapi2 api2;
	@Autowired
	private ChooGPShos api3;
	
	//병원이름으로 병원 검색
	@RequestMapping("hosselect")
	public String hosselect(ChooTestDTO dto, Model model) {
		return "/choo/hosselect";
	}
	
	//병원이름으로 병원 검색
	@RequestMapping("hosinfo")
	public String hosinfo(Model model, String QN, HttpSession session, Userhos hos) {
		String id = (String)session.getAttribute("sid");
		String id1 = (String)session.getAttribute("kid");
		
		try {
			if(id != null) {										//로그인한 유저용
				ChooDTO dto = api1.hpidlist(QN);
				ChooDTO dto1 = api2.hpidselect1(dto);
				
				hos.setId(id);
				hos.setHosname(dto1.getDutyName());
				hos.setHosaddr(dto1.getDutyAddr());
				
				service.userhos(hos);
			
				model.addAttribute("dto", dto1);
			}else if(id1 != null) {									//카카오로 로그인 유저용
				String nick = (String)session.getAttribute("knick");
				ChooDTO dto = api1.hpidlist(QN);
				ChooDTO dto1 = api2.hpidselect1(dto);
				
				hos.setHosname(dto1.getDutyName());
				hos.setHosaddr(dto1.getDutyAddr());
				hos.setNick(nick);
				hos.setId(id1);
				
				service.kakaouserhos(hos);
				
				model.addAttribute("dto", dto1);
			}else {													//비회원 유저일 때
				ChooDTO dto = api1.hpidlist(QN);
				ChooDTO dto1 = api2.hpidselect1(dto);
				
				model.addAttribute("dto", dto1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/choo/hosinfo";
	}
	
	@RequestMapping("addressselect")
	public String addressselect(Model model) {		//시랑 구를 텍스트로 입력값을 넣는 페이지
		return "/choo/addressselect";
	}
	
	//Q0 시도 Q1 시구 QD 진료과 QZ 병원분류
	@RequestMapping("hosapiresult")			//시도군과 진료과를 입력받아서 api를 이용해서 검색하는 곳
	public String hosapiresult(Model model, HttpSession session, String Q0, String Q1, String QD, String QZ, String pageNum) throws Exception{
		Userhos hos = new Userhos();
		String id = (String)session.getAttribute("sid");
		String id1 = (String)session.getAttribute("kid");
		
		try {
			
			//만약 병원분류에 치과병원이나 치과의원을 선택했을 시 진료과를 초기화 시키고 검색
			if(QZ == "M" || QZ == "N") {
				QD = "";
				List<ChooDTO> hosresult = api1.hpidlist(Q0,Q1,QD,QZ);	 //첫번쪠 api를 써서 기관id를 가져오는 곳
				
				if(id != null) {
					for(int a = 0; a < hosresult.size(); a++) {
						hos.setId(id);
						hos.setHosname(hosresult.get(a).getDutyName());
						hos.setHosaddr(hosresult.get(a).getDutyAddr());
						
						service.userhos(hos);
					}
					
				}else if(id1 != null) {
					String nick = (String)session.getAttribute("knick");
					
					for(int a = 0; a < hosresult.size(); a++) {
						hos.setId(id1);
						hos.setNick(nick);
						hos.setHosname(hosresult.get(a).getDutyName());
						hos.setHosaddr(hosresult.get(a).getDutyAddr());
						
						service.kakaouserhos(hos);
					}
				}
				
				if(hosresult.size() != 0) {
				
					double a = hosresult.get(0).getWgs84Lat();
					double b = hosresult.get(0).getWgs84Lon();
			
					model.addAttribute("x", a);			//검색한 값의 위치로 지도를 이동시키기 위한 경도/위도값
					model.addAttribute("y", b);			//검색한 값의 위치로 지도를 이동시키기 위한 경도/위도값
					model.addAttribute("hos", hosresult);
				}
			
			
			}else{
				List<ChooDTO> hosresult = api1.hpidlist(Q0,Q1,QD,QZ);	 //첫번쪠 api를 써서 기관id를 가져오는 곳
				
				//회원가입한 유저
				if(id != null) {
					
					for(int a = 0; a < hosresult.size(); a++) {
						hos.setId(id);
						hos.setHosname(hosresult.get(a).getDutyName());
						hos.setHosaddr(hosresult.get(a).getDutyAddr());
						
						service.userhos(hos);
					}
				
				//카카오로 로그인한 유저
				}else if(id1 != null) {
					String nick = (String)session.getAttribute("knick");
					
					for(int a = 0; a < hosresult.size(); a++) {
						hos.setId(id1);
						hos.setNick(nick);
						hos.setHosname(hosresult.get(a).getDutyName());
						hos.setHosaddr(hosresult.get(a).getDutyAddr());
						
						service.kakaouserhos(hos);
					}
				}
				
				
				if(hosresult.size() != 0) {
					double a = hosresult.get(0).getWgs84Lat();
					double b = hosresult.get(0).getWgs84Lon();
				
					model.addAttribute("x", a);			//검색한 값의 위치로 지도를 이동시키기 위한 경도/위도값
					model.addAttribute("y", b);			//검색한 값의 위치로 지도를 이동시키기 위한 경도/위도값
					model.addAttribute("hos", hosresult);
				
				}else if(hosresult.size() == 0) {
					String hos1 = "null";
					model.addAttribute("hos", hos1);
				}
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/choo/hosapiresult";
	}
	
	@RequestMapping("GPSselect")
	public String GPSselect() {
		return "/choo/GPSselect";
	}
	
	@RequestMapping("GPSresult")				//GPS기준으로 주변 병원 검색결과 보는 페이지
	public String GPSresult(Model model, String QD, String Q0, String Q1, double WGS84_LAT, double WGS84_LON, HttpSession session) {
		try {
			List<ChooDTO> hpid2 = api1.hosselect(QD, Q0, Q1, WGS84_LAT, WGS84_LON);
			
			Userhos hos = new Userhos();
			String id = (String)session.getAttribute("sid");
			String id1 = (String)session.getAttribute("kid");
			
		
			if(id != null) {
				for(int a = 0; a < hpid2.size(); a++) {
					hos.setId(id);
					hos.setHosname(hpid2.get(a).getDutyName());
					hos.setHosaddr(hpid2.get(a).getDutyAddr());
					
					service.userhos(hos);
				}
				
			
			}else if(id1 != null) {
				String nick = (String)session.getAttribute("knick");
				for(int a = 0; a < hpid2.size(); a++) {
					hos.setId(id1);
					hos.setNick(nick);
					hos.setHosname(hpid2.get(a).getDutyName());
					hos.setHosaddr(hpid2.get(a).getDutyAddr());
					
					service.kakaouserhos(hos);
				}
				
			}	
		
		if(hpid2.size() != 0) {
			
			double a = hpid2.get(0).getWgs84Lat();
			double b = hpid2.get(0).getWgs84Lon();
			
			model.addAttribute("x", b);			//검색한 값의 위치로 지도를 이동시키기 위한 경도/위도값
			model.addAttribute("y", a);			//검색한 값의 위치로 지도를 이동시키기 위한 경도/위도값
			model.addAttribute("hos", hpid2);
		}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "choo/GPSresult";
	}
	
	@RequestMapping("selectHos")
	public String selectHos() {
		
		return "choo/selectHos"; 
	}
	
	//부위와 증상을 선택했을 시 관련된 과를 선택하여 해당 과를 입력하고 병원을 검색해서 출력
	@RequestMapping("resultHos")
	public String resultHos(Model model, String W0, String W1, String Q0, String Q1, HttpSession session) {
		try {
			String QD = "";
			String id = (String)session.getAttribute("sid");
			String id1 = (String)session.getAttribute("kid");
			Userhos hos = new Userhos();
			
			if(W0.equals("머리")) {
				QD = "D001";		//내과
				List<ChooDTO> resultlist = api1.selectHos(QD, Q0, Q1);
				
				if(id != null) {
					for(int a = 0; a < resultlist.size(); a++) {
						hos.setId(id);
						hos.setHosname(resultlist.get(a).getDutyName());
						hos.setHosaddr(resultlist.get(a).getDutyAddr());
						
						service.userhos(hos);
					}
					
				}else if(id1 != null) {
					String nick = (String)session.getAttribute("knick");
					for(int b = 0; b < resultlist.size(); b++) {
						hos.setId(id1);
						hos.setNick(nick);
						hos.setHosname(resultlist.get(b).getDutyName());
						hos.setHosaddr(resultlist.get(b).getDutyAddr());
						
						service.kakaouserhos(hos);
					}
					
				}
				
				double a = resultlist.get(0).getWgs84Lat();
				double b = resultlist.get(0).getWgs84Lon();
				
				
				model.addAttribute("x", b);
				model.addAttribute("y", a);
				model.addAttribute("hos", resultlist);
				
				
			}else if(W0.equals("얼굴") && W1.equals("얼굴떨림")){
				QD = "D001";		//내과
				List<ChooDTO> resultlist = api1.selectHos(QD, Q0, Q1);
				
				if(id != null) {
					for(int a = 0; a < resultlist.size(); a++) {
						hos.setId(id);
						hos.setHosname(resultlist.get(a).getDutyName());
						hos.setHosaddr(resultlist.get(a).getDutyAddr());
						
						service.userhos(hos);
					}
					
				}else if(id1 != null) {
					String nick = (String)session.getAttribute("knick");
					for(int b = 0; b < resultlist.size(); b++) {
						hos.setId(id1);
						hos.setNick(nick);
						hos.setHosname(resultlist.get(b).getDutyName());
						hos.setHosaddr(resultlist.get(b).getDutyAddr());
						
						service.kakaouserhos(hos);
					}
					
				}
				
				double a = resultlist.get(0).getWgs84Lat();
				double b = resultlist.get(0).getWgs84Lon();
				
				
				model.addAttribute("x", b);
				model.addAttribute("y", a);
				model.addAttribute("hos", resultlist);
			
			}else if(W0.equals("얼굴") && W1.equals("눈충혈") || W1.equals("눈간지럼") || W1.equals("저시력")) {
				QD = "D012";		//안과
				List<ChooDTO> resultlist = api1.selectHos(QD, Q0, Q1);
				
				if(id != null) {
					for(int a = 0; a < resultlist.size(); a++) {
						hos.setId(id);
						hos.setHosname(resultlist.get(a).getDutyName());
						hos.setHosaddr(resultlist.get(a).getDutyAddr());
						
						service.userhos(hos);
					}
					
				}else if(id1 != null) {
					String nick = (String)session.getAttribute("knick");
					for(int b = 0; b < resultlist.size(); b++) {
						hos.setId(id1);
						hos.setNick(nick);
						hos.setHosname(resultlist.get(b).getDutyName());
						hos.setHosaddr(resultlist.get(b).getDutyAddr());
						
						service.kakaouserhos(hos);
					}
				
				}
				
				double a = resultlist.get(0).getWgs84Lat();
				double b = resultlist.get(0).getWgs84Lon();
				
				model.addAttribute("x", b);
				model.addAttribute("y", a);
				model.addAttribute("hos", resultlist);
				
				
			
			}else if(W0.equals("얼굴") && W1.equals("이통증") || W1.equals("이시림") || W1.equals("잇몸출혈")) {
				QD = "D026";		//치과
				List<ChooDTO> resultlist = api1.selectHos(QD, Q0, Q1);
				
				if(id != null) {
					for(int a = 0; a < resultlist.size(); a++) {
						hos.setId(id);
						hos.setHosname(resultlist.get(a).getDutyName());
						hos.setHosaddr(resultlist.get(a).getDutyAddr());
						
						service.userhos(hos);
					}
					
				}else if(id1 != null) {
					String nick = (String)session.getAttribute("knick");
					for(int b = 0; b < resultlist.size(); b++) {
						hos.setId(id1);
						hos.setNick(nick);
						hos.setHosname(resultlist.get(b).getDutyName());
						hos.setHosaddr(resultlist.get(b).getDutyAddr());
						
						service.kakaouserhos(hos);
					}
					
				}
				
				double a = resultlist.get(0).getWgs84Lat();
				double b = resultlist.get(0).getWgs84Lon();
				
				model.addAttribute("x", b);
				model.addAttribute("y", a);
				model.addAttribute("hos", resultlist);
			
			}else if(W0.equals("얼굴") && W1.equals("귀통증") || W1.equals("이명") || W1.equals("난청") || W1.equals("코막힘")) {
				QD = "D013";		//이비인후과
				List<ChooDTO> resultlist = api1.selectHos(QD, Q0, Q1);
				
				if(id != null) {
					for(int a = 0; a < resultlist.size(); a++) {
						hos.setId(id);
						hos.setHosname(resultlist.get(a).getDutyName());
						hos.setHosaddr(resultlist.get(a).getDutyAddr());
						
						service.userhos(hos);
					}
					
				}else if(id1 != null) {
					String nick = (String)session.getAttribute("knick");
					for(int b = 0; b < resultlist.size(); b++) {
						hos.setId(id1);
						hos.setNick(nick);
						hos.setHosname(resultlist.get(b).getDutyName());
						hos.setHosaddr(resultlist.get(b).getDutyAddr());
						
						service.kakaouserhos(hos);
					}
					
				}
				
				double a = resultlist.get(0).getWgs84Lat();
				double b = resultlist.get(0).getWgs84Lon();
				
				model.addAttribute("x", b);
				model.addAttribute("y", a);
				model.addAttribute("hos", resultlist);
			
			}else if(W0.equals("목")){
				QD = "D013";
				List<ChooDTO> resultlist = api1.selectHos(QD, Q0, Q1);
				
				if(id != null) {
					for(int a = 0; a < resultlist.size(); a++) {
						hos.setId(id);
						hos.setHosname(resultlist.get(a).getDutyName());
						hos.setHosaddr(resultlist.get(a).getDutyAddr());
						
						service.userhos(hos);
					}
					
				}else if(id1 != null) {
					String nick = (String)session.getAttribute("knick");
					for(int b = 0; b < resultlist.size(); b++) {
						hos.setId(id1);
						hos.setNick(nick);
						hos.setHosname(resultlist.get(b).getDutyName());
						hos.setHosaddr(resultlist.get(b).getDutyAddr());
						
						service.kakaouserhos(hos);
					}
					
				}
				
				double a = resultlist.get(0).getWgs84Lat();
				double b = resultlist.get(0).getWgs84Lon();
				
				model.addAttribute("x", b);
				model.addAttribute("y", a);
				model.addAttribute("hos", resultlist);
			
			}else if(W0.equals("가슴") && W1.equals("객혈") || W1.equals("호흡곤란") || W1.equals("흉통")) {
				QD = "D007";		//흉부외과
				List<ChooDTO> resultlist = api1.selectHos(QD, Q0, Q1);
				
				if(id != null) {
					for(int a = 0; a < resultlist.size(); a++) {
						hos.setId(id);
						hos.setHosname(resultlist.get(a).getDutyName());
						hos.setHosaddr(resultlist.get(a).getDutyAddr());
						
						service.userhos(hos);
					}
					
				}else if(id1 != null) {
					String nick = (String)session.getAttribute("knick");
					for(int b = 0; b < resultlist.size(); b++) {
						hos.setId(id1);
						hos.setNick(nick);
						hos.setHosname(resultlist.get(b).getDutyName());
						hos.setHosaddr(resultlist.get(b).getDutyAddr());
						
						service.kakaouserhos(hos);
					}
					
				}
				
				double a = resultlist.get(0).getWgs84Lat();
				double b = resultlist.get(0).getWgs84Lon();
				
				model.addAttribute("x", b);
				model.addAttribute("y", a);
				model.addAttribute("hos", resultlist);
				
			}else if(W0.equals("가슴") && W1.equals("기침") || W1.equals("가슴쓰림")) {
				QD = "D001";		//내과
				List<ChooDTO> resultlist = api1.selectHos(QD, Q0, Q1);
				
				if(id != null) {
					for(int a = 0; a < resultlist.size(); a++) {
						hos.setId(id);
						hos.setHosname(resultlist.get(a).getDutyName());
						hos.setHosaddr(resultlist.get(a).getDutyAddr());
						
						service.userhos(hos);
					}
					
				}else if(id1 != null) {
					String nick = (String)session.getAttribute("knick");
					for(int b = 0; b < resultlist.size(); b++) {
						hos.setId(id1);
						hos.setNick(nick);
						hos.setHosname(resultlist.get(b).getDutyName());
						hos.setHosaddr(resultlist.get(b).getDutyAddr());
						
						service.kakaouserhos(hos);
					}
					
				}
				
				double a = resultlist.get(0).getWgs84Lat();
				double b = resultlist.get(0).getWgs84Lon();
				
				model.addAttribute("x", b);
				model.addAttribute("y", a);
				model.addAttribute("hos", resultlist);
			
			}else if(W0.equals("배")) {
				QD = "D001";		//내과(소화기내과가 따로 존재하지 않아서 내과로 지정)
				List<ChooDTO> resultlist = api1.selectHos(QD, Q0, Q1);
				
				if(id != null) {
					for(int a = 0; a < resultlist.size(); a++) {
						hos.setId(id);
						hos.setHosname(resultlist.get(a).getDutyName());
						hos.setHosaddr(resultlist.get(a).getDutyAddr());
						
						service.userhos(hos);
					}
					
				}else if(id1 != null) {
					String nick = (String)session.getAttribute("knick");
					for(int b = 0; b < resultlist.size(); b++) {
						hos.setId(id1);
						hos.setNick(nick);
						hos.setHosname(resultlist.get(b).getDutyName());
						hos.setHosaddr(resultlist.get(b).getDutyAddr());
						
						service.kakaouserhos(hos);
					}
					
				}
				
				double a = resultlist.get(0).getWgs84Lat();
				double b = resultlist.get(0).getWgs84Lon();
				
				model.addAttribute("x", b);
				model.addAttribute("y", a);
				model.addAttribute("hos", resultlist);
			
			}else if(W0.equals("골격계")) {
				QD = "D008";		//정형외과
				List<ChooDTO> resultlist = api1.selectHos(QD, Q0, Q1);
				
				if(id != null) {
					for(int a = 0; a < resultlist.size(); a++) {
						hos.setId(id);
						hos.setHosname(resultlist.get(a).getDutyName());
						hos.setHosaddr(resultlist.get(a).getDutyAddr());
						
						service.userhos(hos);
					}
					
				}else if(id1 != null) {
					String nick = (String)session.getAttribute("knick");
					for(int b = 0; b < resultlist.size(); b++) {
						hos.setId(id1);
						hos.setNick(nick);
						hos.setHosname(resultlist.get(b).getDutyName());
						hos.setHosaddr(resultlist.get(b).getDutyAddr());
						
						service.kakaouserhos(hos);
					}
					
				}
				
				double a = resultlist.get(0).getWgs84Lat();
				double b = resultlist.get(0).getWgs84Lon();
				
				model.addAttribute("x", b);
				model.addAttribute("y", a);
				model.addAttribute("hos", resultlist);
			
			}else if(W0.equals("피부")) {
				QD = "D005";		//피부과
				List<ChooDTO> resultlist = api1.selectHos(QD, Q0, Q1);
				
				if(id != null) {
					for(int a = 0; a < resultlist.size(); a++) {
						hos.setId(id);
						hos.setHosname(resultlist.get(a).getDutyName());
						hos.setHosaddr(resultlist.get(a).getDutyAddr());
						
						service.userhos(hos);
					}
					
				}else if(id1 != null) {
					String nick = (String)session.getAttribute("knick");
					for(int b = 0; b < resultlist.size(); b++) {
						hos.setId(id1);
						hos.setNick(nick);
						hos.setHosname(resultlist.get(b).getDutyName());
						hos.setHosaddr(resultlist.get(b).getDutyAddr());
						
						service.kakaouserhos(hos);
					}
					
				}
				
				double a = resultlist.get(0).getWgs84Lat();
				double b = resultlist.get(0).getWgs84Lon();
				
				model.addAttribute("x", b);
				model.addAttribute("y", a);
				model.addAttribute("hos", resultlist);
			
			}else if(W0.equals("비뇨기")){
				QD = "D014";		//비뇨기과
				List<ChooDTO> resultlist = api1.selectHos(QD, Q0, Q1);
				
				if(id != null) {
					for(int a = 0; a < resultlist.size(); a++) {
						hos.setId(id);
						hos.setHosname(resultlist.get(a).getDutyName());
						hos.setHosaddr(resultlist.get(a).getDutyAddr());
						
						service.userhos(hos);
					}
					
				}else if(id1 != null) {
					String nick = (String)session.getAttribute("knick");
					for(int b = 0; b < resultlist.size(); b++) {
						hos.setId(id1);
						hos.setNick(nick);
						hos.setHosname(resultlist.get(b).getDutyName());
						hos.setHosaddr(resultlist.get(b).getDutyAddr());
						
						service.kakaouserhos(hos);
					}
					
				}
				
				double a = resultlist.get(0).getWgs84Lat();
				double b = resultlist.get(0).getWgs84Lon();
				
				model.addAttribute("x", b);
				model.addAttribute("y", a);
				model.addAttribute("hos", resultlist);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}	
		return "choo/resultHos";
	}
	
	//게시판 메인페이지
	@RequestMapping("hosgrade")
	public String hosgrade(Model model, @RequestParam("name") String name, @RequestParam("addr") String addr, ChooTestDTO dto, String pageNum, HttpSession session) {
		
		int pageSize = 10;
		model.addAttribute("pageSize",pageSize);
		
		
		if(pageNum == null) {
			pageNum = "1";
		}
		model.addAttribute("pageNum",pageNum);
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize+1;
		int endRow = currentPage * pageSize;
		int count = service.hosCheck(name, addr);
		int number = 0;
		
		model.addAttribute("currentPage",currentPage);
		
		List<ChooTestDTO> dtolist = service.gradeList(name, addr, startRow, endRow);
		model.addAttribute("list", dtolist);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd HH:mm:ss");
		
		number = dtolist.size() - (currentPage - 1) * pageSize;
		model.addAttribute("number",number);
		
		if(count > 0) {
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);						
			int startPage = (int)(currentPage / 10) * 10 + 1;										
			int pageBlock = 10;
			int endPage = startPage + pageBlock -1;													
			if(endPage > pageCount) endPage = pageCount;											
			
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("startPage", startPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("endPage", endPage);
		}
		
		model.addAttribute("name",name);
		model.addAttribute("addr",addr);
		
		String id = (String)session.getAttribute("sid");
		model.addAttribute("memId", id);

		return "choo/hosgrade";
	}
	
	//글작성
	@RequestMapping("gradeWrite")
	public String gradeWrite(Model model, @RequestParam("name") String name, @RequestParam("addr") String addr, String pageNum, HttpSession session) {
		String id = (String)session.getAttribute("sid");
		String id1 = (String)session.getAttribute("kid");
		
		if(id != null) {
			model.addAttribute("memId", id);
		}
		
		if(id1 != null) {
			String nick = (String)session.getAttribute("knick");
			model.addAttribute("nick", nick);
		}
		
		if(id == null && id1 == null) {
			String guest = "guest";
			model.addAttribute("guest", guest);
		}
		
		model.addAttribute("name", name);
		model.addAttribute("addr", addr);
		model.addAttribute("pageNum", pageNum);
		
		return "choo/gradeWrite";
	}
	
	//글작성
	@RequestMapping("gradeWritePro")
	public String gradeWritePro(ChooTestDTO dto, @RequestParam("name") String name, @RequestParam("addr") String addr, @RequestParam("pageNum") String pageNum,Model model) {
		String con = dto.getCon();
		con = con.replace("/r/n", "<br>");
		dto.setCon(con);
		service.insert(dto);
		model.addAttribute("name",name);
		model.addAttribute("addr",addr);
		model.addAttribute("pageNum", pageNum);
		
		int pageSize = 10;
		model.addAttribute("pageSize",pageSize);
		
		if(pageNum == null) {
			pageNum = "1";
			model.addAttribute("pageNum",pageNum);
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize+1;
		int endRow = currentPage * pageSize;
		int count = service.hosCheck(name, addr);
		int number = 0;
		
		model.addAttribute("currentPage",currentPage);
		
		List<ChooTestDTO> dtolist = service.gradeList(name, addr, startRow, endRow);
		model.addAttribute("list", dtolist);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd HH:mm:ss");
		
		number = dtolist.size() - (currentPage - 1) * pageSize;
		model.addAttribute("number",number);
		
		if(count > 0) {
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);						
			int startPage = (int)(currentPage / 10) * 10 + 1;										
			int pageBlock = 10;
			int endPage = startPage + pageBlock -1;													
			if(endPage > pageCount) endPage = pageCount;											
			
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("startPage", startPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("endPage", endPage);
		}
		
		return "choo/gradeWritePro";
	}
	
	//글보는곳
	@RequestMapping("gradecon")
	public String gradecon(Model model, int num, @RequestParam("name") String name, @RequestParam("addr") String addr, @RequestParam("pageNum") String pageNum, HttpSession session) {
		String id = (String)session.getAttribute("sid");
		String id1 = (String)session.getAttribute("kid");
		
		if(id != null) {
			model.addAttribute("memId", id);
		}
		
		if(id1 != null) {
			String nick = (String)session.getAttribute("knick");
			model.addAttribute("nick", nick);
		}
		
		model.addAttribute("dto",service.gradecon(num, addr));
		model.addAttribute("name",name);
		model.addAttribute("addr",addr);
		model.addAttribute("pageNum",pageNum);
		
		return "choo/gradecon";
	}
	
	/*
	 * //병원 평점 기능 좋아요 페이지
	 * 
	 * @RequestMapping("hosgood") public String hosgood(Model model, int
	 * num, @RequestParam("name") String name, @RequestParam("addr") String addr,
	 * String id) { int count = service.goodCheck(num, name, addr, id); int count1 =
	 * service.badCheck(num, name, addr, id);
	 * 
	 * if(count == 0) { model.addAttribute("check",count); service.goodinsert(num,
	 * name, addr, id); }else if(count1 == 1){
	 * 
	 * }else { model.addAttribute("check",count); service.goodupdate(num, name,
	 * addr, id); }
	 * 
	 * return "choo/hosgood"; }
	 * 
	 * //병원 평점기능 싫어요 페이지
	 * 
	 * @RequestMapping("hosbad") public String hosbad(Model model, int
	 * num, @RequestParam("name") String name, @RequestParam("addr") String addr,
	 * String id) {
	 * 
	 * 
	 * return "choo/hosbad"; }
	 */
	
	//글수정
	@RequestMapping("updategrade")
	public String updategrade(Model model, int num, @RequestParam("name") String name, @RequestParam("addr") String addr, @RequestParam("pageNum") String pageNum) {
		 model.addAttribute("dto",service.gradecon(num, addr));
		 model.addAttribute("name",name);
		 model.addAttribute("addr",addr);
		 model.addAttribute("pageNum",pageNum);
		return "choo/updategrade";
	}
	
	//글수정
	@RequestMapping("updategradePro")
	public String updategradePro(int num, String pw, Model model, ChooTestDTO dto, @RequestParam("name") String name, @RequestParam("addr") String addr, @RequestParam("pageNum") String pageNum) {
		model.addAttribute("pw", pw);
		int count = service.pwCheck(num, pw);
		
		if(count == 1) {
			String con = dto.getCon();
			con = con.replace("/r/n", "<br>");
			dto.setCon(con);
			service.gradeUpdate(dto);
			model.addAttribute("chack", count);
			model.addAttribute("name",name);
			model.addAttribute("addr",addr);
			model.addAttribute("pageNum",pageNum);
		}else {
			model.addAttribute("chack", count);
			model.addAttribute("pageNum",pageNum);
		}	
		return "choo/updategradePro";
	}
	
	//글삭제
	@RequestMapping("gradedelect")
	public String gradedelect(Model model, int num, @RequestParam("name") String name, @RequestParam("addr") String addr, @RequestParam("pageNum") String pageNum) {
		model.addAttribute("num", num);
		model.addAttribute("name",name);
		model.addAttribute("addr",addr);
		model.addAttribute("pageNum",pageNum);
		
		return "choo/gradedelect";
	}
	
	//글삭제
	@RequestMapping("gradedelectPro")
	public String gradedelectPro(Model model, int num, String pw, @RequestParam("name") String name, @RequestParam("addr") String addr, @RequestParam("pageNum") String pageNum) {
		model.addAttribute("pw",pw);
		int count = service.pwCheck(num,pw);
		
		if(count == 1) {
			service.gradedelect(num, addr);
			model.addAttribute("chack",count);
			model.addAttribute("name",name);
			model.addAttribute("addr",addr);
			model.addAttribute("pageNum",pageNum);
		}else {
			model.addAttribute("chack",count);
			model.addAttribute("pageNum",pageNum);
		}
		
		return "choo/gradedelectPro";
	}
	
	
	//고객센터 게시판
	@RequestMapping("gesipanmain")
	public String gesipanmain(Model model, String pageNum, HttpSession session) {
		
		String id = (String)session.getAttribute("sid");
		String id1 = (String)session.getAttribute("kid");
		
		int pageSize = 10;
		model.addAttribute("pageSize",pageSize);
		
		if(pageNum == null) {
			pageNum = "1";
		}
		model.addAttribute("pageNum",pageNum);
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize+1;
		int endRow = currentPage * pageSize;
		int count = service.gesipancount();
		int number = 0;
		
		model.addAttribute("currentPage",currentPage);
		
		List<ChooGesipan> dtolist = service.gesipanList(startRow, endRow);
		model.addAttribute("list", dtolist);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd HH:mm:ss");
		
		number = dtolist.size() - (currentPage - 1) * pageSize;
		model.addAttribute("number",number);
		
		if(count > 0) {
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);						
			int startPage = (int)(currentPage / 10) * 10 + 1;										
			int pageBlock = 10;
			int endPage = startPage + pageBlock -1;													
			if(endPage > pageCount) endPage = pageCount;											
			
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("startPage", startPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("endPage", endPage);
			
		if(id != null) {
			model.addAttribute("memId", id);
		}else if(id1 != null) {
			model.addAttribute("kid", id1);
		}
		
		}
		return "choo/gesipanmain";
	}
	
	//고객센터 게시판 글작성
	@RequestMapping("gesipanWrite")
	public String gesipanWrite(Model model, String pageNum, HttpSession session) {
		String id = (String)session.getAttribute("sid");
		String id1 = (String)session.getAttribute("kid");
		
		if(id1 != null) {
			String nick = (String)session.getAttribute("knick");
			System.out.println(nick);
			model.addAttribute("nick", nick);
		}
		
		if(id != null) {
			model.addAttribute("memId",id);
		}
		
		if(id == null && id1 == null) {
			String guest = "guest";
			
			model.addAttribute("guest", guest);
		}
		
		model.addAttribute("pageNum", pageNum);
		return "choo/gesipanWrite";
	}
	
	//고객센터 게시판 글작성
	@RequestMapping("gesipanWritePro")
	public String gesipanWritePro(Model model, String pageNum, ChooGesipan dto) {
		String con = dto.getCon();
		con = con.replace("/r/n", "<br>");
		dto.setCon(con);
		service.gesipaninsert(dto);
		model.addAttribute("pageNum", pageNum);
		return "choo/gesipanWritePro";
	}
	
	//답글작성페이지
	@RequestMapping("reconWrite")
	public String gesipanReWrite(Model model, int num, HttpSession session) {
		String id = (String)session.getAttribute("sid");
		model.addAttribute("memId", id);
		model.addAttribute("num",num);
		return "choo/reconWrite";
	}
	
	//답글작성
	@RequestMapping("reconWritePro")
	public String reconWritePro(Model model, int num, ChooRecon recon) {
		service.reconinsert(recon);
		model.addAttribute("num", num);
		
		return "choo/reconWritePro";
	}
	
	
	//고객센터 글작성보기
	@RequestMapping("gesipancon")
	public String gesipancon(Model model, String pageNum, int num, ChooGesipan dto, RohDTO dto1, HttpSession session) {
		dto = service.gesipancon(num);									//글을 가지고 오는 곳
		List<ChooRecon> reconlist = service.reconlist(num);				//답글 가져오는 것
		
		String id = (String)session.getAttribute("sid");
		String id1 = (String)session.getAttribute("kid");
		
		
		if(id != null) {
			dto1 = service.memtype(id);									//멤버타입 확인하기 위한 것
			model.addAttribute("dto1",dto1);
			model.addAttribute("memId", id);
		}
		
		
		if(id1 != null) {
			String nick = (String)session.getAttribute("knick");
			model.addAttribute("nick", nick);
		}
		
		model.addAttribute("dto", dto);									//글번호로 해당 글 정보를 가지고 옴
		model.addAttribute("list", reconlist);
		model.addAttribute("pageNum",pageNum);
		return "choo/gesipancon";
	}
	
	//고객센터 작성글 수정
	@RequestMapping("gesipanupdate")
	public String gesipanupdate(Model model, int num, String pageNum) {
		model.addAttribute("dto", service.gesipancon(num));
		model.addAttribute("pageNum",pageNum);
		
		return "choo/gesipanupdate";
	}
	
	//고객센터 작성글 수정
	@RequestMapping("gesipanupdatePro")
	public String gesipanupdatePro(int num, String pw, String pageNum, Model model, ChooGesipan dto) {
		model.addAttribute("pw",pw);
		int check = service.pwcheck(num, pw);
		
		if(check == 1) {
			String con = dto.getCon();
			con = con.replace("/r/n", "<br>");
			dto.setCon(con);
			service.gesipanupdate(dto);
			model.addAttribute("count",check);
			model.addAttribute("pageNum",pageNum);
		}else {
			model.addAttribute("count",check);
		}
		
		return "choo/gesipanupdatePro";
	}
	
	
	//고객센터 작성글 삭제
	@RequestMapping("gesipandelect")
	public String gesipandelect(Model model, int num, String pageNum) {
		model.addAttribute("num",num);
		model.addAttribute("pageNum",pageNum);
		
		return "choo/gesipandelect";
	}
	
	
	//고객센터 작성글 삭제
	@RequestMapping("gesipandelectPro")
	public String gesipandelectPro(Model model, int num, String pageNum, String pw) {
		model.addAttribute("pw",pw);
		int check = service.pwcheck(num, pw);
		
		if(check == 1) {
			service.gesipandelect(num);
			model.addAttribute("count",check);
			model.addAttribute("pageNum", pageNum);
		}else {
			model.addAttribute("count",check);
		}
		
		return "choo/gesipandelectPro";
	}
	
	//고객센터 본인이 쓴 글 리스트로 표기
	@RequestMapping("gesipanMylist")
	public String gesipanMylist(Model model, String id, HttpSession session, String pageNum) {
		int count = 0;
		int count1 = 0;
		String nick = "";
		id = (String)session.getAttribute("sid");					//유저 로그인
		String id1 = (String)session.getAttribute("kid");			//카카오 로그인
		
		//홈페이지에서 회원가입한 유저
		if(id == null) {
			count = 0;
		}else {
			count = service.conCheck(id);
		}
		
		if(count != 0) {
			model.addAttribute("check", count);
			model.addAttribute("pageNum", pageNum);
			
			List<ChooGesipan> mylist = service.mycon(id);
			model.addAttribute("dto", mylist);
		}else {
			model.addAttribute("check", count);
			model.addAttribute("pageNum", pageNum);
		}
		
		
		//카카오 로그인 유저
		if(id1 != null) {
			RohDTO dto = service.kakaomember(id1);
			id = dto.getKNick();						//카카오맵 로그인 유저일 경우에는 String id를 사용할 일이 없기때문에 id에 닉을 저장
			count1 = service.conCheck(id);
		}else {
			count1 = 0;
		}
		
		if(count1 != 0) {
			model.addAttribute("check",count1);
			model.addAttribute("pageNum",pageNum);
			
			List<ChooGesipan> mylist = service.mycon(id);
			model.addAttribute("dto", mylist);
		}else {
			model.addAttribute("check", count);
			model.addAttribute("pageNum", pageNum);
		}
		
		return "choo/gesipanMylist";
	}
	
	//최근 찾은 병원 검색해서 결과값 가지고 오는 곳
	@RequestMapping("userhosselect")
	public String userhosselect(Model model, HttpSession session) {
		String id = (String)session.getAttribute("sid");
		String id1 = (String)session.getAttribute("kid");
		
		List<Userhos> hos = new ArrayList<Userhos>();
		
		if(id != null) {
			 hos = service.userhosselect(id);
			model.addAttribute("hos",hos);
			model.addAttribute("sid", id);
		}else if(id1 != null) {
			id = id1;
			hos = service.userhosselect(id);
			model.addAttribute("hos",hos);
			model.addAttribute("kid", id1);
		}else {
			model.addAttribute("hos",hos);
		}
		
		return "choo/userhosselect";
	}
}
