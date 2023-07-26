package com.team2.service;

import org.springframework.stereotype.Service;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.io.BufferedReader;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.team2.component.ChooDTO;

import java.io.StringReader;

//병원 목록 검색한 곳에서 기관ID를 가지고 와서 해당 병원 진료과목을 찾는 API 장소

@Service
public class Choohosapi2 {
// UZHnvSBw7ESYEUBtz%2BH9YHocdwfx3wFhm54v1fiXwk9pj4Wv3pY5%2F4uhCj9YTxYd1gtqHkhlP9vC9tMQh6CulA%3D%3D : 서비스키
	
	//시/도/구와 진료과를 입력받아서 해당 병원의 기관ID가지고 해당 병원의 정보를 검색
	public List hpidselect(List<String> hpid) throws Exception {
		List<ChooDTO> resultlist = new ArrayList<ChooDTO>();
		
		for(int i = 0 ; i < hpid.size(); i++) {
			ChooDTO dto = new ChooDTO();
	        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlBassInfoInqire"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=UZHnvSBw7ESYEUBtz%2BH9YHocdwfx3wFhm54v1fiXwk9pj4Wv3pY5%2F4uhCj9YTxYd1gtqHkhlP9vC9tMQh6CulA%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("HPID","UTF-8") + "=" + URLEncoder.encode(hpid.get(i), "UTF-8")); /*기관ID*/
	        
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        // System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	    
	    if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	        rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
	    }else{
	        rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
	    }
	        
	        StringBuilder sb = new StringBuilder();
	        String line;
	    
	    while ((line = rd.readLine()) != null) {
	        sb.append(line);
	    }
	        rd.close();
	        conn.disconnect();
        
        
	        String tag = sb.toString();
		
			DocumentBuilderFactory factory  =  DocumentBuilderFactory.newInstance();
			DocumentBuilder builder    =  factory.newDocumentBuilder();
			Document document     =  builder.parse(new InputSource(new StringReader(tag)));
		  
			NodeList namelist = document.getElementsByTagName("dutyName"); // dutyName 병원이름
			Node hosname =  namelist.item(0).getChildNodes().item(0);
		  
		if(hosname != null) {
			String value = hosname.getNodeValue();				//getNodeValue는 해당 노드의 값을 추출하고 String타입 변수에 저장함
			String name = value != null ? value : "";			//위에서 저장한 값을 stringValue에 값을 할당하고 value값이 null인지 아닌지 확인함
			dto.setDutyName(name);
		}
			NodeList addresslist = document.getElementsByTagName("dutyAddr"); // dutyAddr 주소
			Node hosaddr =  addresslist.item(0).getChildNodes().item(0);
		  
		if(hosaddr != null) {
			String value = hosaddr.getNodeValue();		//getNodeValue는 해당 노드의 값을 추출하고 String타입 변수에 저장함
			String addr = value != null ? value : "";	//위에서 저장한 값을 stringValue에 값을 할당하고 value값이 null인지 아닌지 확인함
			dto.setDutyAddr(addr);
		}
		 
		  
		  NodeList tellist = document.getElementsByTagName("dutyTel1"); // dutyTel1 전화번호
		  Node hostel =  tellist.item(0).getChildNodes().item(0);
		  
		if(hostel != null) {
			String value = hostel.getNodeValue();				//getNodeValue는 해당 노드의 값을 추출하고 String타입 변수에 저장함
			String tel = value != null ? value : "";			//위에서 저장한 값을 stringValue에 값을 할당하고 value값이 null인지 아닌지 확인함
			dto.setDutyTel1(tel);
		}

		  NodeList classlist = document.getElementsByTagName("dgidIdName"); // dgidIdName 진료과
		  
		if(classlist.getLength() == 0) {
			dto.setDgidIdName("현재 업데이트 진행중입니다.");
		}else if(classlist.getLength() == 1){
			Node hosclass =  classlist.item(0).getChildNodes().item(0);
			String value = hosclass.getNodeValue();			//getNodeValue는 해당 노드의 값을 추출하고 String타입 변수에 저장함
			String jinryo = value != null ? value : "";		//위에서 저장한 값을 stringValue에 값을 할당하고 value값이 null인지 아닌지 확인함
			dto.setDgidIdName(jinryo);					
		 }
		  
		  NodeList gyodo = document.getElementsByTagName("wgs84Lon");		//병원경도
		  Node hosgyodo = gyodo.item(0).getChildNodes().item(0);
		  
		if(hosgyodo != null) {
			double gdovalue = Double.parseDouble(hosgyodo.getNodeValue());
			dto.setWgs84Lon(gdovalue);
		}
		  
		  NodeList widolist = document.getElementsByTagName("wgs84Lat");	//병원위도
		  Node hoswido = widolist.item(0).getChildNodes().item(0);
		  
		if(hoswido != null) {
			double wido = Double.parseDouble(hoswido.getNodeValue());
			dto.setWgs84Lat(wido);
		}
		  resultlist.add(dto);
		}
		return resultlist;
	}
	
	//지도에 마커클러스터를 생성하기 위해 값을 가지고 오는 메소드
	public List hpidselect1(List<String> hpid1) throws Exception {
		List<ChooDTO> resultlist = new ArrayList<ChooDTO>();
		
		for(int i = 0 ; i < hpid1.size(); i++) {
			ChooDTO dto = new ChooDTO();
	        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlBassInfoInqire"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=UZHnvSBw7ESYEUBtz%2BH9YHocdwfx3wFhm54v1fiXwk9pj4Wv3pY5%2F4uhCj9YTxYd1gtqHkhlP9vC9tMQh6CulA%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("HPID","UTF-8") + "=" + URLEncoder.encode(hpid1.get(i), "UTF-8")); /*기관ID*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*목록 건수*/
	        
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        // System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        
	     if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
        
        
	        String tag = sb.toString();
		
			DocumentBuilderFactory factory  =  DocumentBuilderFactory.newInstance();
			DocumentBuilder builder    =  factory.newDocumentBuilder();
			Document document     =  builder.parse(new InputSource(new StringReader(tag)));
		  
			NodeList namelist = document.getElementsByTagName("dutyName"); // dutyName 병원이름
			Node hosname =  namelist.item(0).getChildNodes().item(0);
		  
		if(hosname != null) {
				String value = hosname.getNodeValue();			//getNodeValue는 해당 노드의 값을 추출하고 String타입 변수에 저장함
				   String name = value != null ? value : "";	//위에서 저장한 값을 stringValue에 값을 할당하고 value값이 null인지 아닌지 확인함
				   dto.setDutyName(name);
		}
			NodeList addresslist = document.getElementsByTagName("dutyAddr"); // dutyAddr 주소
			Node hosaddr =  addresslist.item(0).getChildNodes().item(0);
		  
		if(hosaddr != null) {
				String value = hosaddr.getNodeValue();		//getNodeValue는 해당 노드의 값을 추출하고 String타입 변수에 저장함
				String addr = value != null ? value : "";	//위에서 저장한 값을 stringValue에 값을 할당하고 value값이 null인지 아닌지 확인함
				dto.setDutyAddr(addr);
		}
		  
		  
		  NodeList tellist = document.getElementsByTagName("dutyTel1"); // dutyTel1 전화번호
		  Node hostel =  tellist.item(0).getChildNodes().item(0);
		  
		if(hostel != null) {
			  String value = hostel.getNodeValue();				//getNodeValue는 해당 노드의 값을 추출하고 String타입 변수에 저장함
			  String tel = value != null ? value : "";			//위에서 저장한 값을 stringValue에 값을 할당하고 value값이 null인지 아닌지 확인함
			  dto.setDutyTel1(tel);
		}

		  NodeList classlist = document.getElementsByTagName("dgidIdName"); // dgidIdName 진료과
		  
		if(classlist.getLength() == 0) {
			  dto.setDgidIdName("현재 업데이트 진행중입니다.");
		}else if(classlist.getLength() == 1){
			  Node hosclass =  classlist.item(0).getChildNodes().item(0);
			  String value = hosclass.getNodeValue();			//getNodeValue는 해당 노드의 값을 추출하고 String타입 변수에 저장함
			  String jinryo = value != null ? value : "";		//위에서 저장한 값을 stringValue에 값을 할당하고 value값이 null인지 아닌지 확인함
			  dto.setDgidIdName(jinryo);					
		}
		  
		  NodeList gyodo = document.getElementsByTagName("wgs84Lon");		//병원경도
		  Node hosgyodo = gyodo.item(0).getChildNodes().item(0);
		  
		if(hosgyodo != null) {
			  double gdovalue = Double.parseDouble(hosgyodo.getNodeValue());
			  dto.setWgs84Lon(gdovalue);
		}
		  
		  NodeList widolist = document.getElementsByTagName("wgs84Lat");	//병원위도
		  Node hoswido = widolist.item(0).getChildNodes().item(0);
		  
		if(hoswido != null) {
			  double wido = Double.parseDouble(hoswido.getNodeValue());
			  dto.setWgs84Lat(wido);
		}
		  resultlist.add(dto);
		}
		return resultlist;
	}
	
	//병원이름으로 검색했을 때 해당 병원 값을 가지고 오는 메소드
	public ChooDTO hpidselect1(ChooDTO dto) throws Exception {

	        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlBassInfoInqire"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=UZHnvSBw7ESYEUBtz%2BH9YHocdwfx3wFhm54v1fiXwk9pj4Wv3pY5%2F4uhCj9YTxYd1gtqHkhlP9vC9tMQh6CulA%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("HPID","UTF-8") + "=" + URLEncoder.encode(dto.getHpid(), "UTF-8")); /*기관ID*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*목록 건수*/
	        
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        // System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        
	     if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
	     }else{
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
	     }
	        StringBuilder sb = new StringBuilder();
	        String line;
	       
	     while ((line = rd.readLine()) != null) {
	            sb.append(line);
	     }
	        rd.close();
	        conn.disconnect();
        
        
	        String tag = sb.toString();
		
			DocumentBuilderFactory factory  =  DocumentBuilderFactory.newInstance();
			DocumentBuilder builder    =  factory.newDocumentBuilder();
			Document document     =  builder.parse(new InputSource(new StringReader(tag)));
		  
			NodeList namelist = document.getElementsByTagName("dutyName"); // dutyName 병원이름
			Node hosname =  namelist.item(0).getChildNodes().item(0);
		  
		if(hosname != null) {
			String value = hosname.getNodeValue();			//getNodeValue는 해당 노드의 값을 추출하고 String타입 변수에 저장함
			String name = value != null ? value : "";	//위에서 저장한 값을 stringValue에 값을 할당하고 value값이 null인지 아닌지 확인함
			dto.setDutyName(name);
		}
			NodeList addresslist = document.getElementsByTagName("dutyAddr"); // dutyAddr 주소
			Node hosaddr =  addresslist.item(0).getChildNodes().item(0);
		  
		if(hosaddr != null) {
			String value = hosaddr.getNodeValue();		//getNodeValue는 해당 노드의 값을 추출하고 String타입 변수에 저장함
			String addr = value != null ? value : "";	//위에서 저장한 값을 stringValue에 값을 할당하고 value값이 null인지 아닌지 확인함
			dto.setDutyAddr(addr);
		}
		  
		  NodeList tellist = document.getElementsByTagName("dutyTel1"); // dutyTel1 전화번호
		  Node hostel =  tellist.item(0).getChildNodes().item(0);
		  
	   if(hostel != null) {
			String value = hostel.getNodeValue();				//getNodeValue는 해당 노드의 값을 추출하고 String타입 변수에 저장함
			String tel = value != null ? value : "";			//위에서 저장한 값을 stringValue에 값을 할당하고 value값이 null인지 아닌지 확인함
			dto.setDutyTel1(tel);
	   }

		  NodeList classlist = document.getElementsByTagName("dgidIdName"); // dgidIdName 진료과
		  
	   if(classlist.getLength() == 0) {
			dto.setDgidIdName("현재 업데이트 진행중입니다.");
	   }else if(classlist.getLength() == 1){
			Node hosclass =  classlist.item(0).getChildNodes().item(0);
			String value = hosclass.getNodeValue();			//getNodeValue는 해당 노드의 값을 추출하고 String타입 변수에 저장함
			String jinryo = value != null ? value : "";		//위에서 저장한 값을 stringValue에 값을 할당하고 value값이 null인지 아닌지 확인함
			dto.setDgidIdName(jinryo);					
	   }
		  
		  NodeList gyodo = document.getElementsByTagName("wgs84Lon");		//병원경도
		  Node hosgyodo = gyodo.item(0).getChildNodes().item(0);
		  
	   if(hosgyodo != null) {
			double gdovalue = Double.parseDouble(hosgyodo.getNodeValue());
			dto.setWgs84Lon(gdovalue);
	   }
		  
		  NodeList widolist = document.getElementsByTagName("wgs84Lat");	//병원위도
		  Node hoswido = widolist.item(0).getChildNodes().item(0);
		  
	   if(hoswido != null) {
			double wido = Double.parseDouble(hoswido.getNodeValue());
			dto.setWgs84Lat(wido);
	   }
		return dto;
	}
	
	//GPS기반으로 병원과 진료과로 검색해서 분류한 병원의 기관ID를 가지고 와서 해당 병원의 정보를 리스트에 저장
	public List hosselect(List<String> hpid2) throws Exception {
		List<ChooDTO> resultlist = new ArrayList<ChooDTO>();
		
		for(int i = 0 ; i < hpid2.size(); i++) {
			ChooDTO dto = new ChooDTO();
	        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlBassInfoInqire"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=UZHnvSBw7ESYEUBtz%2BH9YHocdwfx3wFhm54v1fiXwk9pj4Wv3pY5%2F4uhCj9YTxYd1gtqHkhlP9vC9tMQh6CulA%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("HPID","UTF-8") + "=" + URLEncoder.encode(hpid2.get(i), "UTF-8")); /*기관ID*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("20", "UTF-8")); /*목록 건수*/
	        
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        // System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        
	    if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
	    }else{
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
	    }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        
	    while ((line = rd.readLine()) != null) {
	            sb.append(line);
	    }
	        rd.close();
	        conn.disconnect();
        
        
	        String tag = sb.toString();
		
			DocumentBuilderFactory factory  =  DocumentBuilderFactory.newInstance();
			DocumentBuilder builder    =  factory.newDocumentBuilder();
			Document document     =  builder.parse(new InputSource(new StringReader(tag)));
		  
			NodeList namelist = document.getElementsByTagName("dutyName"); // dutyName 병원이름
			
			if(namelist.getLength() == 1) {
				Node hosname =  namelist.item(0).getChildNodes().item(0);
				String value = hosname.getNodeValue();			//getNodeValue는 해당 노드의 값을 추출하고 String타입 변수에 저장함
				String name = value != null ? value : "";		//위에서 저장한 값을 stringValue에 값을 할당하고 value값이 null인지 아닌지 확인함
				//resultlist.add(name);
				dto.setDutyName(name);
			}else if(namelist.getLength() == 0){
				System.out.println("병원을 찾지 못하였습니다");
				break;
			}
			NodeList addresslist = document.getElementsByTagName("dutyAddr"); // dutyAddr 주소
			
		  
			if(addresslist.getLength() == 0) {
				dto.setDutyAddr("");
			}else if(addresslist.getLength() == 1) {
				Node hosaddr =  addresslist.item(0).getChildNodes().item(0);
				String value = hosaddr.getNodeValue();		//getNodeValue는 해당 노드의 값을 추출하고 String타입 변수에 저장함
				String addr = value != null ? value : "";	//위에서 저장한 값을 stringValue에 값을 할당하고 value값이 null인지 아닌지 확인함
				dto.setDutyAddr(addr);
		   }
		  
		  //List<String> tel = new ArrayList<String>();
		  
		  NodeList tellist = document.getElementsByTagName("dutyTel1"); // dutyTel1 전화번호
		  
		  
		  if(tellist.getLength() == 0) {
			  dto.setDutyTel1("");
		  }else if(tellist.getLength() == 1) {
			  Node hostel =  tellist.item(0).getChildNodes().item(0);
			  String value = hostel.getNodeValue();				//getNodeValue는 해당 노드의 값을 추출하고 String타입 변수에 저장함
			  String tel = value != null ? value : "";			//위에서 저장한 값을 stringValue에 값을 할당하고 value값이 null인지 아닌지 확인함
			  dto.setDutyTel1(tel);
		   }

		  NodeList classlist = document.getElementsByTagName("dgidIdName"); // dgidIdName 진료과
		  
		  if(classlist.getLength() == 0) {
			  dto.setDgidIdName("현재 업데이트 진행중입니다.");
		  }else if(classlist.getLength() == 1){
			  Node hosclass =  classlist.item(0).getChildNodes().item(0);
			  String value = hosclass.getNodeValue();			//getNodeValue는 해당 노드의 값을 추출하고 String타입 변수에 저장함
			  String jinryo = value != null ? value : "";		//위에서 저장한 값을 stringValue에 값을 할당하고 value값이 null인지 아닌지 확인함
			  dto.setDgidIdName(jinryo);					
		   }
		  
		  NodeList gyodo = document.getElementsByTagName("wgs84Lon");		//병원경도
		  Node hosgyodo = gyodo.item(0).getChildNodes().item(0);
		  
		  if(hosgyodo != null) {
			  double gdovalue = Double.parseDouble(hosgyodo.getNodeValue());
			  dto.setWgs84Lon(gdovalue);
		  }
		  
		  NodeList widolist = document.getElementsByTagName("wgs84Lat");	//병원위도
		  Node hoswido = widolist.item(0).getChildNodes().item(0);
		  
		  if(hoswido != null) {
			  double wido = Double.parseDouble(hoswido.getNodeValue());
			  dto.setWgs84Lat(wido);
		  }
		  resultlist.add(dto);
		}
		return resultlist;
	}
}