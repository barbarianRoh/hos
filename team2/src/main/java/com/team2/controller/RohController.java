package com.team2.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

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

import com.team2.service.RohService;

@Controller
@RequestMapping("/roh/*")
public class RohController {
	
	@Autowired
	private RohService service;
	
	@RequestMapping("maptest")
	public String maptest() {
		return "/roh/maptest";
	}
	
	@RequestMapping("maptest2")
	public String maptest2(Model model) {
	    String url = "https://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyListInfoInqire?serviceKey=4c%2BBa%2BaPJxSbLQnLM24kicpVPXAEBmsK1V5nqbo7d6AJ4VRKUVVz8vKzYaRLTJFVaHWJ9IUKmf9L01QnZeCEig%3D%3D&Q0=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&Q1=%EA%B0%95%EB%82%A8%EA%B5%AC&QT=1&QN=%EC%82%BC%EC%84%B1%EC%95%BD%EA%B5%AD&ORD=NAME&pageNo=1&numOfRows=10";
	    try {
	    	// XML 파서생성
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = null;
			try {
				builder = factory.newDocumentBuilder();
			} catch (ParserConfigurationException e) {
				e.printStackTrace();
			}
			
			// XML 파일 로드
			Document document = null;
			try {
				document = builder.parse(new URL(url).openStream());
			} catch (SAXException e) {
				e.printStackTrace();
			}
			NodeList resultCodeList = document.getElementsByTagName("resultCode"); // 결과코드
			NodeList rNumList = document.getElementsByTagName("rnum"); // 일련번호
			NodeList dutyAddrList = document.getElementsByTagName("dutyAddr"); // 주소
			NodeList dutyNameList = document.getElementsByTagName("dutyName"); // 기관명
			NodeList dutyTelList = document.getElementsByTagName("dutyTel1"); // 대표전화
			NodeList dutyTime1sList = document.getElementsByTagName("dutyTime1s"); // 월요일 오픈
			NodeList dutyTime2sList = document.getElementsByTagName("dutyTime2s"); // 화요일 오픈
			NodeList dutyTime3sList = document.getElementsByTagName("dutyTime3s"); // 수요일 오픈
			NodeList dutyTime4sList = document.getElementsByTagName("dutyTime4s"); // 목요일 오픈
			NodeList dutyTime5sList = document.getElementsByTagName("dutyTime5s"); // 금요일 오픈
			NodeList dutyTime6sList = document.getElementsByTagName("dutyTime6s"); // 토요일 오픈
			NodeList dutyTime7sList = document.getElementsByTagName("dutyTime7s"); // 일요일 오픈
			NodeList dutyTime8sList = document.getElementsByTagName("dutyTime8s"); // 공휴일 오픈
			NodeList dutyTime1cList = document.getElementsByTagName("dutyTime1c"); // 월요일 클로즈
			NodeList dutyTime2cList = document.getElementsByTagName("dutyTime2c"); // 화요일 클로즈
			NodeList dutyTime3cList = document.getElementsByTagName("dutyTime3c"); // 수요일 클로즈
			NodeList dutyTime4cList = document.getElementsByTagName("dutyTime4c"); // 목요일 클로즈
			NodeList dutyTime5cList = document.getElementsByTagName("dutyTime5c"); // 금요일 클로즈
			NodeList dutyTime6cList = document.getElementsByTagName("dutyTime6c"); // 토요일 클로즈
			NodeList dutyTime7cList = document.getElementsByTagName("dutyTime7c"); // 일요일 클로즈
			NodeList dutyTime8cList = document.getElementsByTagName("dutyTime8c"); // 공휴일 클로즈
			NodeList wgs84LonList = document.getElementsByTagName("wgs84Lon"); // 병원경도
			NodeList wgs84LatList = document.getElementsByTagName("wgs84Lat"); // 병원위도
			
			List<String> resultCodeValues = new ArrayList<String>();
			List<String> rNumValues = new ArrayList<String>();
			List<String> dutyAddrValues = new ArrayList<String>();
			List<String> dutyNameValues = new ArrayList<String>();
			List<String> dutyTelValues = new ArrayList<String>();
			List<String> dutyTime1sValues = new ArrayList<String>();
			List<String> dutyTime2sValues = new ArrayList<String>();
			List<String> dutyTime3sValues = new ArrayList<String>();
			List<String> dutyTime4sValues = new ArrayList<String>();
			List<String> dutyTime5sValues = new ArrayList<String>();
			List<String> dutyTime6sValues = new ArrayList<String>();
			List<String> dutyTime7sValues = new ArrayList<String>();
			List<String> dutyTime8sValues = new ArrayList<String>();
			List<String> dutyTime1cValues = new ArrayList<String>();
			List<String> dutyTime2cValues = new ArrayList<String>();
			List<String> dutyTime3cValues = new ArrayList<String>();
			List<String> dutyTime4cValues = new ArrayList<String>();
			List<String> dutyTime5cValues = new ArrayList<String>();
			List<String> dutyTime6cValues = new ArrayList<String>();
			List<String> dutyTime7cValues = new ArrayList<String>();
			List<String> dutyTime8cValues = new ArrayList<String>();
			List<String> wgs84LonValues = new ArrayList<String>();
			List<String> wgs84LatValues = new ArrayList<String>();

			if(dutyAddrList.getLength() > 0) {
				Element resultCodeElement = (Element)resultCodeList.item(0);
				String resultCode = resultCodeElement != null ? resultCodeElement.getTextContent() : "";
				resultCodeValues.add(resultCode);
				
				for(int i = 0; i < dutyAddrList.getLength(); i++) {
					Element rNumElement = (Element)rNumList.item(i);
					String rNum = rNumElement != null ? rNumElement.getTextContent() : "";
					rNumValues.add(rNum);
					
					Element dutyAddrElement = (Element)dutyAddrList.item(i);
					String dutyAddr = dutyAddrElement != null ? dutyAddrElement.getTextContent() : "";
					dutyAddrValues.add(dutyAddr);
					
					Element dutyNameElement = (Element)dutyNameList.item(i);
					String dutyName = dutyNameElement != null ? dutyNameElement.getTextContent() : "";
					dutyNameValues.add(dutyName);
					
					Element dutyTelElement = (Element)dutyTelList.item(i);
					String dutyTel = dutyTelElement != null ? dutyTelElement.getTextContent() : "";
					dutyTelValues.add(dutyTel);
					
					Element dutyTime1sElement = (Element)dutyTime1sList.item(i);
					String dutyTime1s = dutyTime1sElement != null ? dutyTime1sElement.getTextContent() : "";
					dutyTime1sValues.add(dutyTime1s);
					
					Element dutyTime2sElement = (Element)dutyTime2sList.item(i);
					String dutyTime2s = dutyTime2sElement != null ? dutyTime2sElement.getTextContent() : "";
					dutyTime2sValues.add(dutyTime2s);
					
					Element dutyTime3sElement = (Element)dutyTime3sList.item(i);
					String dutyTime3s = dutyTime3sElement != null ? dutyTime3sElement.getTextContent() : "";
					dutyTime3sValues.add(dutyTime3s);
					
					Element dutyTime4sElement = (Element)dutyTime4sList.item(i);
					String dutyTime4s = dutyTime4sElement != null ? dutyTime4sElement.getTextContent() : "";
					dutyTime4sValues.add(dutyTime4s);
					
					Element dutyTime5sElement = (Element)dutyTime5sList.item(i);
					String dutyTime5s = dutyTime5sElement != null ? dutyTime5sElement.getTextContent() : "";
					dutyTime5sValues.add(dutyTime5s);
					
					Element dutyTime6sElement = (Element)dutyTime6sList.item(i);
					String dutyTime6s = dutyTime6sElement != null ? dutyTime6sElement.getTextContent() : "";
					dutyTime6sValues.add(dutyTime6s);
					
					Element dutyTime7sElement = (Element)dutyTime7sList.item(i);
					String dutyTime7s = dutyTime7sElement != null ? dutyTime7sElement.getTextContent() : "";
					dutyTime7sValues.add(dutyTime7s);
					
					Element dutyTime8sElement = (Element)dutyTime8sList.item(i);
					String dutyTime8s = dutyTime8sElement != null ? dutyTime8sElement.getTextContent() : "";
					dutyTime8sValues.add(dutyTime8s);
					
					Element dutyTime1cElement = (Element)dutyTime1cList.item(i);
					String dutyTime1c = dutyTime1cElement != null ? dutyTime1cElement.getTextContent() : "";
					dutyTime1cValues.add(dutyTime1c);
					
					Element dutyTime2cElement = (Element)dutyTime2cList.item(i);
					String dutyTime2c = dutyTime2cElement != null ? dutyTime2cElement.getTextContent() : "";
					dutyTime2cValues.add(dutyTime2c);
					
					Element dutyTime3cElement = (Element)dutyTime3cList.item(i);
					String dutyTime3c = dutyTime3cElement != null ? dutyTime3cElement.getTextContent() : "";
					dutyTime3cValues.add(dutyTime3c);
					
					Element dutyTime4cElement = (Element)dutyTime4cList.item(i);
					String dutyTime4c = dutyTime4cElement != null ? dutyTime4cElement.getTextContent() : "";
					dutyTime4cValues.add(dutyTime4c);
					
					Element dutyTime5cElement = (Element)dutyTime5cList.item(i);
					String dutyTime5c = dutyTime5cElement != null ? dutyTime5cElement.getTextContent() : "";
					dutyTime5cValues.add(dutyTime5c);
					
					Element dutyTime6cElement = (Element)dutyTime6cList.item(i);
					String dutyTime6c = dutyTime6cElement != null ? dutyTime6cElement.getTextContent() : "";
					dutyTime6cValues.add(dutyTime6c);
					
					Element dutyTime7cElement = (Element)dutyTime7cList.item(i);
					String dutyTime7c = dutyTime7cElement != null ? dutyTime7cElement.getTextContent() : "";
					dutyTime7cValues.add(dutyTime7c);
					
					Element dutyTime8cElement = (Element)dutyTime8cList.item(i);
					String dutyTime8c = dutyTime8cElement != null ? dutyTime8cElement.getTextContent() : "";
					dutyTime8cValues.add(dutyTime8c);
					
					Element wgs84LonElement = (Element)wgs84LonList.item(i);
					String wgs84Lon = wgs84LonElement != null ? wgs84LonElement.getTextContent() : "";
					wgs84LonValues.add(wgs84Lon);
					
					Element wgs84LatElement = (Element)wgs84LatList.item(i);
					String wgs84Lat = wgs84LatElement != null ? wgs84LatElement.getTextContent() : "";
					wgs84LatValues.add(wgs84Lat);
				}
				
				model.addAttribute("resultCodeValues", resultCodeValues);
				model.addAttribute("rNumValues", rNumValues);
				model.addAttribute("dutyAddrValues", dutyAddrValues);
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
			} else {
				System.out.println("resultCode 요소를 찾을 수 없습니다");
			}
		
	    } catch(IOException e) {
	    	e.printStackTrace();
	    }
		return "/roh/maptest2";
	}
	
	            
	// 약국api 자바코드
	@RequestMapping("test")
	public String xmltest(Model model) throws Exception {
	    StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyListInfoInqire");
	    urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=4c%2BBa%2BaPJxSbLQnLM24kicpVPXAEBmsK1V5nqbo7d6AJ4VRKUVVz8vKzYaRLTJFVaHWJ9IUKmf9L01QnZeCEig%3D%3D");
	    urlBuilder.append("&" + URLEncoder.encode("Q0","UTF-8") + "=" + URLEncoder.encode("경기", "UTF-8")); // 주소(시도)
        urlBuilder.append("&" + URLEncoder.encode("Q1","UTF-8") + "=" + URLEncoder.encode("성남시", "UTF-8")); // 주소(시군구)
        urlBuilder.append("&" + URLEncoder.encode("QT","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); // 월~일요일, 공휴일: 1~8
        urlBuilder.append("&" + URLEncoder.encode("QN","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); // 기관명
        urlBuilder.append("&" + URLEncoder.encode("ORD","UTF-8") + "=" + URLEncoder.encode("NAME", "UTF-8")); // 순서
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); // 페이지 번호
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("300", "UTF-8")); // 목록 건수
        
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/xml");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        model.addAttribute("apiData", sb.toString());

        return "/roh/test";
	}
	
	// 카테고리 테스트중
	@RequestMapping("test2")
	public String test2() {
		
		return "/roh/test2";
	}
	
	@RequestMapping("apitest")
	public String apitest(Model model) {
	    String url = "https://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyListInfoInqire?serviceKey=4c%2BBa%2BaPJxSbLQnLM24kicpVPXAEBmsK1V5nqbo7d6AJ4VRKUVVz8vKzYaRLTJFVaHWJ9IUKmf9L01QnZeCEig%3D%3D&Q0=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&Q1=%EA%B0%95%EB%82%A8%EA%B5%AC&QT=1&QN=%EC%82%BC%EC%84%B1%EC%95%BD%EA%B5%AD&ORD=NAME&pageNo=1&numOfRows=10";

	    List<String> rNumValues = new ArrayList<>();
	    List<String> dutyAddrValues = new ArrayList<>();
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
	// 중복 줄이는 메서드
	private String getTextContent(Element element, String tagName) {
	    NodeList nodeList = element.getElementsByTagName(tagName);
	    if (nodeList.getLength() > 0) {
	        Element tagElement = (Element) nodeList.item(0);
	        return tagElement != null ? tagElement.getTextContent() : "";
	    }
	    return "";
	}

}
