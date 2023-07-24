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

import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	// http://localhost:8080/hos/
	@RequestMapping("/")
	public String home() {
		return "/roh/home";
	}
	
	// 카카오맵 API+약국 javascript로 만듬
	@RequestMapping("kakaophar")
	public String kakaophar(Model model) {
		return "/roh/kakao-phar";
	}
	
	// 약국 API 자바로 출력테스트
	@RequestMapping("apitest")
	public String apitest(Model model) {
		String url = null;
		
		try {
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyListInfoInqire");
		    urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=4c%2BBa%2BaPJxSbLQnLM24kicpVPXAEBmsK1V5nqbo7d6AJ4VRKUVVz8vKzYaRLTJFVaHWJ9IUKmf9L01QnZeCEig%3D%3D");
		    urlBuilder.append("&" + URLEncoder.encode("Q0","UTF-8") + "=" + URLEncoder.encode("서울특별시", "UTF-8")); // 주소(시도)
	        urlBuilder.append("&" + URLEncoder.encode("Q1","UTF-8") + "=" + URLEncoder.encode("강남구", "UTF-8")); // 주소(시군구)
	        urlBuilder.append("&" + URLEncoder.encode("QT","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); // 월~일요일, 공휴일: 1~8
	        urlBuilder.append("&" + URLEncoder.encode("QN","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); // 기관명
	        urlBuilder.append("&" + URLEncoder.encode("ORD","UTF-8") + "=" + URLEncoder.encode("NAME", "UTF-8")); // 순서
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); // 페이지 번호
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); // 목록 건수
			
		    url = urlBuilder.toString();
		} catch(UnsupportedEncodingException e) {
		    e.printStackTrace();
		}
		
	    List<String> rNumValues = new ArrayList<>();
	    List<String> dutyAddrValues = new ArrayList<>();
	    List<String> dutyMapimgValues = new ArrayList<>();
	    List<String> dutyNameValues = new ArrayList<>();
	    List<String> dutyTelValues = new ArrayList<>();
	    List<String> dutyTime1sValues = new ArrayList<>();
	    List<String> dutyTime2sValues = new ArrayList<>();
	    List<String> dutyTime3sValues = new ArrayList<>();
	    List<String> dutyTime4sValues = new ArrayList<>();
	    List<String> dutyTime5sValues = new ArrayList<>();
	    List<String> dutyTime6sValues = new ArrayList<>();
	    List<String> dutyTime7sValues = new ArrayList<>();
	    List<String> dutyTime8sValues = new ArrayList<>();
	    List<String> dutyTime1cValues = new ArrayList<>();
	    List<String> dutyTime2cValues = new ArrayList<>();
	    List<String> dutyTime3cValues = new ArrayList<>();
	    List<String> dutyTime4cValues = new ArrayList<>();
	    List<String> dutyTime5cValues = new ArrayList<>();
	    List<String> dutyTime6cValues = new ArrayList<>();
	    List<String> dutyTime7cValues = new ArrayList<>();
	    List<String> dutyTime8cValues = new ArrayList<>();
	    List<String> wgs84LonValues = new ArrayList<>();
	    List<String> wgs84LatValues = new ArrayList<>();

	    try {
	        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	        DocumentBuilder builder = factory.newDocumentBuilder();
	        Document document = builder.parse(new URL(url).openStream());

	        Element root = document.getDocumentElement();
	        NodeList itemNodeList = root.getElementsByTagName("item");
	        for (int i = 0; i < itemNodeList.getLength(); i++) {
	            Element itemElement = (Element) itemNodeList.item(i);

	            String rNum = getTextContent(itemElement, "rnum");
	            rNumValues.add(rNum);

	            String dutyAddr = getTextContent(itemElement, "dutyAddr");
	            dutyAddrValues.add(dutyAddr);
	            
	            String dutyMapimg = getTextContent(itemElement, "dutyMapimg");
	            dutyMapimgValues.add(dutyMapimg);
	            
	            String dutyName = getTextContent(itemElement, "dutyName");
	            dutyNameValues.add(dutyName);

	            String dutyTel = getTextContent(itemElement, "dutyTel1");
	            dutyTelValues.add(dutyTel);

	            String dutyTime1s = getTextContent(itemElement, "dutyTime1s");
	            dutyTime1sValues.add(dutyTime1s);

	            String dutyTime2s = getTextContent(itemElement, "dutyTime2s");
	            dutyTime2sValues.add(dutyTime2s);

	            String dutyTime3s = getTextContent(itemElement, "dutyTime3s");
	            dutyTime3sValues.add(dutyTime3s);

	            String dutyTime4s = getTextContent(itemElement, "dutyTime4s");
	            dutyTime4sValues.add(dutyTime4s);

	            String dutyTime5s = getTextContent(itemElement, "dutyTime5s");
	            dutyTime5sValues.add(dutyTime5s);

	            String dutyTime6s = getTextContent(itemElement, "dutyTime6s");
	            dutyTime6sValues.add(dutyTime6s);

	            String dutyTime7s = getTextContent(itemElement, "dutyTime7s");
	            dutyTime7sValues.add(dutyTime7s);

	            String dutyTime8s = getTextContent(itemElement, "dutyTime8s");
	            dutyTime8sValues.add(dutyTime8s);

	            String dutyTime1c = getTextContent(itemElement, "dutyTime1c");
	            dutyTime1cValues.add(dutyTime1c);

	            String dutyTime2c = getTextContent(itemElement, "dutyTime2c");
	            dutyTime2cValues.add(dutyTime2c);

	            String dutyTime3c = getTextContent(itemElement, "dutyTime3c");
	            dutyTime3cValues.add(dutyTime3c);

	            String dutyTime4c = getTextContent(itemElement, "dutyTime4c");
	            dutyTime4cValues.add(dutyTime4c);

	            String dutyTime5c = getTextContent(itemElement, "dutyTime5c");
	            dutyTime5cValues.add(dutyTime5c);

	            String dutyTime6c = getTextContent(itemElement, "dutyTime6c");
	            dutyTime6cValues.add(dutyTime6c);

	            String dutyTime7c = getTextContent(itemElement, "dutyTime7c");
	            dutyTime7cValues.add(dutyTime7c);

	            String dutyTime8c = getTextContent(itemElement, "dutyTime8c");
	            dutyTime8cValues.add(dutyTime8c);

	            String wgs84Lon = getTextContent(itemElement, "wgs84Lon");
	            wgs84LonValues.add(wgs84Lon);

	            String wgs84Lat = getTextContent(itemElement, "wgs84Lat");
	            wgs84LatValues.add(wgs84Lat);
	        }
	    } catch (ParserConfigurationException | SAXException | IOException e) {
	        e.printStackTrace();
	    }

	    // 모델에 결과 리스트 추가
	    model.addAttribute("rNumValues", rNumValues);
	    model.addAttribute("dutyAddrValues", dutyAddrValues);
	    model.addAttribute("dutyMapimgValues", dutyMapimgValues);
	    model.addAttribute("dutyNameValues", dutyNameValues);
	    model.addAttribute("dutyTelValues", dutyTelValues);
	    model.addAttribute("dutyTime1sValues", dutyTime1sValues);
	    model.addAttribute("dutyTime2sValues", dutyTime2sValues);
	    model.addAttribute("dutyTime3sValues", dutyTime3sValues);
	    model.addAttribute("dutyTime4sValues", dutyTime4sValues);
	    model.addAttribute("dutyTime5sValues", dutyTime5sValues);
	    model.addAttribute("dutyTime6sValues", dutyTime6sValues);
	    model.addAttribute("dutyTime7sValues", dutyTime7sValues);
	    model.addAttribute("dutyTime8sValues", dutyTime8sValues);
	    model.addAttribute("dutyTime1cValues", dutyTime1cValues);
	    model.addAttribute("dutyTime2cValues", dutyTime2cValues);
	    model.addAttribute("dutyTime3cValues", dutyTime3cValues);
	    model.addAttribute("dutyTime4cValues", dutyTime4cValues);
	    model.addAttribute("dutyTime5cValues", dutyTime5cValues);
	    model.addAttribute("dutyTime6cValues", dutyTime6cValues);
	    model.addAttribute("dutyTime7cValues", dutyTime7cValues);
	    model.addAttribute("dutyTime8cValues", dutyTime8cValues);
	    model.addAttribute("wgs84LonValues", wgs84LonValues);
	    model.addAttribute("wgs84LatValues", wgs84LatValues);

	    return "/roh/apitest";
	}
	// 약국api 내 중복 줄이는 메서드
	private String getTextContent(Element element, String tagName) {
	    NodeList nodeList = element.getElementsByTagName(tagName);
	    if (nodeList.getLength() > 0) {
	        Element tagElement = (Element) nodeList.item(0);
	        return tagElement != null ? tagElement.getTextContent() : "";
	    }
	    return "";
	}
	
	@RequestMapping("test")
	public String test() {
		return "/roh/test";
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
		
		// 파라미터 전달확인용
		// model.addAttribute("id", dto.getId());
		// model.addAttribute("pw", dto.getPw());
		// model.addAttribute("name", dto.getName());
		
		return message;
	}
	
	@RequestMapping("signinPro")
	public String signinPro(RohDTO dto, Model model) {
		model.addAttribute("result", service.signin(dto));
		
		return "/roh/home";
	}
	
	@RequestMapping("signout")
	public String signout(HttpSession session) {
		session.invalidate();
		return "/roh/home";
	}
}