package com.team2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
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
		return "/choo/addressselect";
	}
	
	@RequestMapping("hosapiresult")			//시도군과 진료과를 입력받아서 api를 이용해서 검색하는 곳
	public String hosapiresult(Model model, String Q0, String Q1, String QD, String QZ) throws Exception{
		try {
			
			//만약 병원분류에 치과병원이나 치과의원을 선택했을 시 진료과를 초기화 시키고 검색
			if(QZ == "M" || QZ == "N") {
				QD = "";
				
				List<ChooDTO> hosresult = api1.hpidlist(Q0,Q1,QD,QZ);	 //첫번쪠 api를 써서 기관id를 가져오는 곳
				
				double a = hosresult.get(0).getWgs84Lat();
				double b = hosresult.get(0).getWgs84Lon();
			
				model.addAttribute("x", a);			//검색한 값의 위치로 지도를 이동시키기 위한 경도/위도값
				model.addAttribute("y", b);			//검색한 값의 위치로 지도를 이동시키기 위한 경도/위도값
				model.addAttribute("hos", hosresult);
			
			//만약 병원분류에 한의원이나 한방병원을 선택했을 때 해당하는 진료과가 없기때문에 진료과를 초기화 시키고 검색
			}else if(QZ == "E" || QZ == "G") {
				QD = "";
				
				List<ChooDTO> hosresult = api1.hpidlist(Q0,Q1,QD,QZ);	 //첫번쪠 api를 써서 기관id를 가져오는 곳
				
				double a = hosresult.get(0).getWgs84Lat();
				double b = hosresult.get(0).getWgs84Lon();
			
				model.addAttribute("x", a);			//검색한 값의 위치로 지도를 이동시키기 위한 경도/위도값
				model.addAttribute("y", b);			//검색한 값의 위치로 지도를 이동시키기 위한 경도/위도값
				model.addAttribute("hos", hosresult);
			
			}else {
				List<ChooDTO> hosresult = api1.hpidlist(Q0,Q1,QD,QZ);	 //첫번쪠 api를 써서 기관id를 가져오는 곳
		
				double a = hosresult.get(0).getWgs84Lat();
				double b = hosresult.get(0).getWgs84Lon();
		
				model.addAttribute("x", a);			//검색한 값의 위치로 지도를 이동시키기 위한 경도/위도값
				model.addAttribute("y", b);			//검색한 값의 위치로 지도를 이동시키기 위한 경도/위도값
				model.addAttribute("hos", hosresult);
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
	public String GPSresult(Model model, String QD, String Q0, String Q1) {
		try {
			List<ChooDTO> hpid2 = api1.hosselect(QD, Q0, Q1);
			
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
	public String resultHos(Model model, String W0, String W1, String Q0, String Q1) {
		try {
			String QD = "";
			
			if(W0.equals("머리")) {
				QD = "D001";		//내과
				List<ChooDTO> resultlist = api1.selectHos(QD, Q0, Q1);
				
				double a = resultlist.get(0).getWgs84Lat();
				double b = resultlist.get(0).getWgs84Lon();
				
				
				model.addAttribute("x", b);
				model.addAttribute("y", a);
				model.addAttribute("hos", resultlist);
			
			}else if(W0.equals("얼굴") && W1.equals("눈충혈") || W1.equals("눈간지럼")) {
				QD = "D012";		//안과
				List<ChooDTO> resultlist = api1.selectHos(QD, Q0, Q1);
				
				double a = resultlist.get(0).getWgs84Lat();
				double b = resultlist.get(0).getWgs84Lon();
				
				model.addAttribute("x", b);
				model.addAttribute("y", a);
				model.addAttribute("hos", resultlist);
			
			}else if(W0.equals("얼굴") && W1.equals("이통증") || W1.equals("이시림") || W1.equals("잇몸출혈")) {
				QD = "D026";		//치과
				List<ChooDTO> resultlist = api1.selectHos(QD, Q0, Q1);
				
				double a = resultlist.get(0).getWgs84Lat();
				double b = resultlist.get(0).getWgs84Lon();
				
				model.addAttribute("x", b);
				model.addAttribute("y", a);
				model.addAttribute("hos", resultlist);
			
			}else if(W0.equals("얼굴") && W1.equals("귀통증") || W1.equals("이명") || W1.equals("난청")) {
				QD = "D013";		//이비인후과
				List<ChooDTO> resultlist = api1.selectHos(QD, Q0, Q1);
				
				double a = resultlist.get(0).getWgs84Lat();
				double b = resultlist.get(0).getWgs84Lon();
				
				model.addAttribute("x", b);
				model.addAttribute("y", a);
				model.addAttribute("hos", resultlist);
			
			}else if(W0.equals("목")){
				QD = "D013";
				List<ChooDTO> resultlist = api1.selectHos(QD, Q0, Q1);
				
				double a = resultlist.get(0).getWgs84Lat();
				double b = resultlist.get(0).getWgs84Lon();
				
				model.addAttribute("x", b);
				model.addAttribute("y", a);
				model.addAttribute("hos", resultlist);
			
			}else if(W0.equals("가슴") && W1.equals("객혈") || W1.equals("호흡곤란") || W1.equals("흉통")) {
				QD = "D007";		//흉부외과
				List<ChooDTO> resultlist = api1.selectHos(QD, Q0, Q1);
				
				double a = resultlist.get(0).getWgs84Lat();
				double b = resultlist.get(0).getWgs84Lon();
				
				model.addAttribute("x", b);
				model.addAttribute("y", a);
				model.addAttribute("hos", resultlist);
				
			}else if(W0.equals("가슴") && W1.equals("기침") || W1.equals("가슴쓰림")) {
				QD = "D001";		//내과
				List<ChooDTO> resultlist = api1.selectHos(QD, Q0, Q1);
				
				double a = resultlist.get(0).getWgs84Lat();
				double b = resultlist.get(0).getWgs84Lon();
				
				model.addAttribute("x", b);
				model.addAttribute("y", a);
				model.addAttribute("hos", resultlist);
			
			}else if(W0.equals("배")) {
				QD = "D001";		//내과(소화기내과가 따로 존재하지 않아서 내과로 지정)
				List<ChooDTO> resultlist = api1.selectHos(QD, Q0, Q1);
				
				double a = resultlist.get(0).getWgs84Lat();
				double b = resultlist.get(0).getWgs84Lon();
				
				model.addAttribute("x", b);
				model.addAttribute("y", a);
				model.addAttribute("hos", resultlist);
			
			}else if(W0.equals("골격계")) {
				QD = "D008";		//정형외과
				List<ChooDTO> resultlist = api1.selectHos(QD, Q0, Q1);
				
				double a = resultlist.get(0).getWgs84Lat();
				double b = resultlist.get(0).getWgs84Lon();
				
				model.addAttribute("x", b);
				model.addAttribute("y", a);
				model.addAttribute("hos", resultlist);
			
			}else if(W0.equals("피부")) {
				QD = "D005";		//피부과
				List<ChooDTO> resultlist = api1.selectHos(QD, Q0, Q1);
				
				double a = resultlist.get(0).getWgs84Lat();
				double b = resultlist.get(0).getWgs84Lon();
				
				model.addAttribute("x", b);
				model.addAttribute("y", a);
				model.addAttribute("hos", resultlist);
			
			}else if(W0.equals("비뇨기")){
				QD = "D014";		//비뇨기과
				List<ChooDTO> resultlist = api1.selectHos(QD, Q0, Q1);
				
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
	public String hosgrade(Model model, @RequestParam("name") String name, @RequestParam("addr") String addr, ChooTestDTO dto,String pageNum) {
		
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

		return "choo/hosgrade";
	}
	
	//글작성
	@RequestMapping("gradeWrite")
	public String gradeWrite(Model model, @RequestParam("name") String name, @RequestParam("addr") String addr, String pageNum) {
		model.addAttribute("name", name);
		model.addAttribute("addr", addr);
		model.addAttribute("pageNum", pageNum);
		
		return "choo/gradeWrite";
	}
	
	//글작성
	@RequestMapping("gradeWritePro")
	public String gradeWritePro(ChooTestDTO dto, @RequestParam("name") String name, @RequestParam("addr") String addr, @RequestParam("pageNum") String pageNum,Model model) {
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
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);						//10 / 10 + (10%10) =2
			int startPage = (int)(currentPage / 10) * 10 + 1;										//1 / 10 * 10+1 = 1
			int pageBlock = 10;
			int endPage = startPage + pageBlock -1;													//1 + 10 -1 = 10
			if(endPage > pageCount) endPage = pageCount;											//10 > 2)
			
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("startPage", startPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("endPage", endPage);
		}
		
		return "choo/gradeWritePro";
	}
	
	//글보는곳
	@RequestMapping("gradecon")
	public String gradecon(Model model, int num, @RequestParam("name") String name, @RequestParam("addr") String addr, @RequestParam("pageNum") String pageNum) {
		model.addAttribute("dto",service.gradecon(num, addr));
		model.addAttribute("name",name);
		model.addAttribute("addr",addr);
		model.addAttribute("pageNum",pageNum);
		
		return "choo/gradecon";
	}
	
	//병원 평점 기능 좋아요 페이지
	@RequestMapping("hosgood")
	public String hosgood(Model model, int num, @RequestParam("name") String name, @RequestParam("addr") String addr, String id) {
		int count = service.goodCheck(num, name, addr, id);
				
		if(count == 0) {
			model.addAttribute("check",count);
			service.goodinsert(num, name, addr, id);
		}else {
			model.addAttribute("check",count);
			service.goodupdate(num, name, addr, id);
		}
		
		return "choo/hosgood";
	}
	
	//병원 평점기능 싫어요 페이지
	@RequestMapping("hosbad")
	public String hosbad(Model model, int num, @RequestParam("name") String name, @RequestParam("addr") String addr, String id) {
		
		
		return "choo/hosbad";
	}
	
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
		int count = service.pwCheck(num, pw);
		
		if(count == 1) {
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
}
