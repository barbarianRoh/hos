package com.team2.service;

import org.springframework.stereotype.Service;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import java.io.BufferedReader;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import com.team2.component.ChooDTO;
import java.io.StringReader;

//병원목록 조회하는 API 장소

@Service
public class Choohosapi {
	// UZHnvSBw7ESYEUBtz%2BH9YHocdwfx3wFhm54v1fiXwk9pj4Wv3pY5%2F4uhCj9YTxYd1gtqHkhlP9vC9tMQh6CulA%3D%3D : 서비스키
	
	//10진수를 radian(라디안)으로 변환
	private static double deg2rad(double deg) {
		return(deg * Math.PI/180.0);
	}
	
	//radian(라디안)을 10진수로 변환
	private static double rad2deg(double red) {
		return(red * 180 / Math.PI);
	}
	
	 //시/도/군/진료과/병원분류 검색값을 받아서 해당 병원의 기관ID를 검색하는 메소드
	 public List hpidlist(String Q0, String Q1, String QD, String QZ) throws Exception {
		 	List<ChooDTO> idlist = new ArrayList<>();
		 	
		 	StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncListInfoInqire"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=UZHnvSBw7ESYEUBtz%2BH9YHocdwfx3wFhm54v1fiXwk9pj4Wv3pY5%2F4uhCj9YTxYd1gtqHkhlP9vC9tMQh6CulA%3D%3D"); /*Service Key*/
	        if(Q0 == null) {
	        	urlBuilder.append("&" + URLEncoder.encode("Q0","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*주소(시도)*/
	        }else {
	        	urlBuilder.append("&" + URLEncoder.encode("Q0","UTF-8") + "=" + URLEncoder.encode(Q0, "UTF-8")); /*주소(시도)*/
	        }
	        
	        if(Q1 == null) {
	        	urlBuilder.append("&" + URLEncoder.encode("Q1","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*주소(시구군)*/
	        }else {	
	        	urlBuilder.append("&" + URLEncoder.encode("Q1","UTF-8") + "=" + URLEncoder.encode(Q1, "UTF-8")); /*주소(시구군)*/
	        }
	        
	        if(QD == null) {
	        	urlBuilder.append("&" + URLEncoder.encode("QD","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*진료과*/
	        }else {
	        	urlBuilder.append("&" + URLEncoder.encode("QD","UTF-8") + "=" + URLEncoder.encode(QD, "UTF-8")); /*진료과*/
	        }
	        
	        if(QZ == null) {
	        	urlBuilder.append("&" + URLEncoder.encode("QZ","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); //병원분류
	        }else {
	        	urlBuilder.append("&" + URLEncoder.encode("QD","UTF-8") + "=" + URLEncoder.encode(QZ, "UTF-8")); //병원분류
	        }
	        
	        // urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*결과로 가져올 갯수*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        //System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {		//200이라면 정상 300이라면 오류
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        // System.out.println(sb.toString());
	        
	        String tag = sb.toString();
			
			DocumentBuilderFactory factory  =  DocumentBuilderFactory.newInstance();
			DocumentBuilder builder    =  factory.newDocumentBuilder();
			Document document     =  builder.parse(new InputSource(new StringReader(tag)));
			  
			  
			
			NodeList hosaddr = document.getElementsByTagName("dutyAddr");		//주소
			NodeList name = document.getElementsByTagName("dutyName");			//병원병
			NodeList hosTel = document.getElementsByTagName("dutyTel1");		//전화번호
			NodeList gyodo = document.getElementsByTagName("wgs84Lon");			//병원경도	
			NodeList widolist = document.getElementsByTagName("wgs84Lat");		//병원위도
			
			
			for(int a = 0; a < hosaddr.getLength(); a++) {						//주소
				ChooDTO dto = new ChooDTO();
				
				Node hosaddress = hosaddr.item(a).getChildNodes().item(0);
				Node hosname = name.item(a).getChildNodes().item(0);
				Node Tel = hosTel.item(a).getChildNodes().item(0);
				Node hosgyodo = gyodo.item(a).getChildNodes().item(0);
				Node hoswido = widolist.item(a).getChildNodes().item(0);
				
				String value = hosaddress.getNodeValue();
				String addrValue = value != null ? value : "";
				dto.setDutyAddr(addrValue);
				
				String value1 = hosname.getNodeValue();
				String nameValue = value1 != null ? value1 : "";
				dto.setDutyName(nameValue);
				
				String value2 = Tel.getNodeValue();
				String telValue = value2 != null ? value2 : "";
				dto.setDutyTel1(telValue);
				
				double gdovalue = Double.parseDouble(hosgyodo.getNodeValue());
				dto.setWgs84Lon(gdovalue);
				
				double wido = Double.parseDouble(hoswido.getNodeValue());
				dto.setWgs84Lat(wido);
				
				idlist.add(dto);
			}	
			return idlist;
	}
	 
	 //지도에 클러스터를 생성하기 위해서 값을 가져오는 메소드
	 public List<String> hpidlist(String Q0, String Q1) throws Exception {
		 	List<String> idlist = new ArrayList<>();
		 	
		 	StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncListInfoInqire"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=UZHnvSBw7ESYEUBtz%2BH9YHocdwfx3wFhm54v1fiXwk9pj4Wv3pY5%2F4uhCj9YTxYd1gtqHkhlP9vC9tMQh6CulA%3D%3D"); /*Service Key*/
	        if(Q0 == null) {
	        	urlBuilder.append("&" + URLEncoder.encode("Q0","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*주소(시도)*/
	        }else {
	        	urlBuilder.append("&" + URLEncoder.encode("Q0","UTF-8") + "=" + URLEncoder.encode(Q0, "UTF-8")); /*주소(시도)*/
	        }
	        
	        if(Q1 == null) {
	        	urlBuilder.append("&" + URLEncoder.encode("Q1","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*주소(시구군)*/
	        }else {	
	        	urlBuilder.append("&" + URLEncoder.encode("Q1","UTF-8") + "=" + URLEncoder.encode(Q1, "UTF-8")); /*주소(시구군)*/
	        }
	        
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*결과로 가져올 갯수*/
	        
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        //System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {		//200이라면 정상 300이라면 오류
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        // System.out.println(sb.toString());
	        
	        String tag = sb.toString();
			
			DocumentBuilderFactory factory  =  DocumentBuilderFactory.newInstance();
			DocumentBuilder builder    =  factory.newDocumentBuilder();
			Document document     =  builder.parse(new InputSource(new StringReader(tag)));
			  
			  
			
			NodeList idforhoslist = document.getElementsByTagName("hpid"); // XML에선 hpid태그안에 있는 값이며 즉 불러낼 것 : 기관ID
			  
			  for(int i = 0 ; i < idforhoslist.getLength(); i++) {
				   Node idforhos =  idforhoslist.item(i).getChildNodes().item(0);
			
				   String value = idforhos.getNodeValue();				//getNodeValue는 해당 노드의 값을 추출하고 String타입 변수에 저장함
				   String stringValue = value != null ? value : "";		//위에서 저장한 값을 stringValue에 값을 할당하고 value값이 null인지 아닌지 확인함
				   idlist.add(stringValue);								//값을 리스트에 저장
		}
			return idlist;
	}
	 
	 //병원이름으로 검색한 값을 가지고 오는 메소드
	 public ChooDTO hpidlist(String QN) throws Exception {
		 	ChooDTO dto = new ChooDTO();
		 	
		 	StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncListInfoInqire"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=UZHnvSBw7ESYEUBtz%2BH9YHocdwfx3wFhm54v1fiXwk9pj4Wv3pY5%2F4uhCj9YTxYd1gtqHkhlP9vC9tMQh6CulA%3D%3D"); /*Service Key*/
	        if(QN == null) {
	        	urlBuilder.append("&" + URLEncoder.encode("QN","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*주소(시도)*/
	        }else {
	        	urlBuilder.append("&" + URLEncoder.encode("QN","UTF-8") + "=" + URLEncoder.encode(QN, "UTF-8")); /*주소(시도)*/
	        }
	        
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*결과로 가져올 갯수*/
	        
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        //System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {		//200이라면 정상 300이라면 오류
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        // System.out.println(sb.toString());
	        
	        String tag = sb.toString();
			
			DocumentBuilderFactory factory  =  DocumentBuilderFactory.newInstance();
			DocumentBuilder builder    =  factory.newDocumentBuilder();
			Document document     =  builder.parse(new InputSource(new StringReader(tag)));
			  
			  
			
			NodeList idforhoslist = document.getElementsByTagName("hpid"); // XML에선 hpid태그안에 있는 값이며 즉 불러낼 것 : 기관ID
			  

				   Node idforhos =  idforhoslist.item(0).getChildNodes().item(0);
			
				   String value = idforhos.getNodeValue();				//getNodeValue는 해당 노드의 값을 추출하고 String타입 변수에 저장함
				   String stringValue = value != null ? value : "";		//위에서 저장한 값을 stringValue에 값을 할당하고 value값이 null인지 아닌지 확인함
				   dto.setHpid(stringValue);							//값을 for문을 사용해서 dto에 저장을 해야하기에 사용

			return dto;
	}
	 
	 //UZHnvSBw7ESYEUBtz%2BH9YHocdwfx3wFhm54v1fiXwk9pj4Wv3pY5%2F4uhCj9YTxYd1gtqHkhlP9vC9tMQh6CulA%3D%3D
	 //GPS 기반 좌표로 검색한 병원 이름과 입력받은 진료과를 넣고 해당 과에 해당하는 병원 분류
	 public List hosselect(String QD, String Q0, String Q1) throws Exception {
		 	List<ChooDTO> idlist = new ArrayList<>();
		 	
		 	StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncListInfoInqire"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=UZHnvSBw7ESYEUBtz%2BH9YHocdwfx3wFhm54v1fiXwk9pj4Wv3pY5%2F4uhCj9YTxYd1gtqHkhlP9vC9tMQh6CulA%3D%3D"); /*Service Key*/

	        if(Q0 == null) {
	        	urlBuilder.append("&" + URLEncoder.encode("Q0","UTF-8") + "=" + URLEncoder.encode("","UTF-8"));		//시도
	        }else {
	        	urlBuilder.append("&" + URLEncoder.encode("Q0","UTF-8") + "=" + URLEncoder.encode(Q0,"UTF-8"));
	        }
	        
	        
	        if(Q1 == null) {
	        	urlBuilder.append("&" + URLEncoder.encode("Q1","UTF-8") + "=" + URLEncoder.encode("","UTF-8"));		//구
	        }else {
	        	urlBuilder.append("&" + URLEncoder.encode("Q1","UTF-8") + "=" + URLEncoder.encode(Q1,"UTF-8"));
	        }
	        
	        
	        if(QD == null) {
	        	urlBuilder.append("&" + URLEncoder.encode("QD","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); 	/*진료과*/
	        }else {
	        	urlBuilder.append("&" + URLEncoder.encode("QD","UTF-8") + "=" + URLEncoder.encode(QD, "UTF-8")); 	/*진료과*/
	        }
	        
	        
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("20", "UTF-8")); /*결과로 가져올 갯수*/
	        
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        //System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {		//200이라면 정상 300이라면 오류
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        // System.out.println(sb.toString());
	        
	        String tag = sb.toString();
			
			DocumentBuilderFactory factory  =  DocumentBuilderFactory.newInstance();
			DocumentBuilder builder    =  factory.newDocumentBuilder();
			Document document     =  builder.parse(new InputSource(new StringReader(tag)));
			  	   
		
			NodeList hosaddr = document.getElementsByTagName("dutyAddr");		//주소
			NodeList name = document.getElementsByTagName("dutyName");			//병원병
			NodeList hosTel = document.getElementsByTagName("dutyTel1");		//전화번호
			NodeList gyodo = document.getElementsByTagName("wgs84Lon");			//병원경도	
			NodeList widolist = document.getElementsByTagName("wgs84Lat");		//병원위도
			
			
			for(int a = 0; a < hosaddr.getLength(); a++) {						//주소
				ChooDTO dto = new ChooDTO();
				
				Node hosaddress = hosaddr.item(a).getChildNodes().item(0);
				Node hosname = name.item(a).getChildNodes().item(0);
				Node Tel = hosTel.item(a).getChildNodes().item(0);
				Node hosgyodo = gyodo.item(a).getChildNodes().item(0);
				Node hoswido = widolist.item(a).getChildNodes().item(0);
				
				String value = hosaddress.getNodeValue();
				String addrValue = value != null ? value : "";
				dto.setDutyAddr(addrValue);
				
				String value1 = hosname.getNodeValue();
				String nameValue = value1 != null ? value1 : "";
				dto.setDutyName(nameValue);
				
				String value2 = Tel.getNodeValue();
				String telValue = value2 != null ? value2 : "";
				dto.setDutyTel1(telValue);
				
				double gdovalue = Double.parseDouble(hosgyodo.getNodeValue());
				dto.setWgs84Lon(gdovalue);
				
				double wido = Double.parseDouble(hoswido.getNodeValue());
				dto.setWgs84Lat(wido);
				
				idlist.add(dto);
			}	
		return idlist;
	}
	 
	 //증상으로 병원 검색하는 메소드
	 public List selectHos(String QD, String Q0, String Q1) throws Exception {
		 	List<ChooDTO> hoslist = new ArrayList<>();
		 	
		 	double x = 37.480890;
		 	double y = 126.952290;
		 	
		 	StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncListInfoInqire"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=UZHnvSBw7ESYEUBtz%2BH9YHocdwfx3wFhm54v1fiXwk9pj4Wv3pY5%2F4uhCj9YTxYd1gtqHkhlP9vC9tMQh6CulA%3D%3D"); /*Service Key*/

	        if(Q0 == null) {
	        	urlBuilder.append("&" + URLEncoder.encode("Q0","UTF-8") + "=" + URLEncoder.encode("","UTF-8"));		//시도
	        }else {
	        	urlBuilder.append("&" + URLEncoder.encode("Q0","UTF-8") + "=" + URLEncoder.encode(Q0,"UTF-8"));
	        }
	        
	        
	        if(Q1 == null) {
	        	urlBuilder.append("&" + URLEncoder.encode("Q1","UTF-8") + "=" + URLEncoder.encode("","UTF-8"));		//구
	        }else {
	        	urlBuilder.append("&" + URLEncoder.encode("Q1","UTF-8") + "=" + URLEncoder.encode(Q1,"UTF-8"));
	        }
	        
	        
	        if(QD == null) {
	        	urlBuilder.append("&" + URLEncoder.encode("QD","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); 	/*진료과*/
	        }else {
	        	urlBuilder.append("&" + URLEncoder.encode("QD","UTF-8") + "=" + URLEncoder.encode(QD, "UTF-8")); 	/*진료과*/
	        }
	        
	        
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("500", "UTF-8")); /*결과로 가져올 갯수*/
	        
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        //System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {		//200이라면 정상 300이라면 오류
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        // System.out.println(sb.toString());
	        
	        String tag = sb.toString();
			
			DocumentBuilderFactory factory  =  DocumentBuilderFactory.newInstance();
			DocumentBuilder builder    =  factory.newDocumentBuilder();
			Document document     =  builder.parse(new InputSource(new StringReader(tag)));
			  	   
		
			NodeList hosaddr = document.getElementsByTagName("dutyAddr");		//주소
			NodeList name = document.getElementsByTagName("dutyName");			//병원병
			NodeList hosTel = document.getElementsByTagName("dutyTel1");		//전화번호
			NodeList gyodo = document.getElementsByTagName("wgs84Lon");			//병원경도	
			NodeList widolist = document.getElementsByTagName("wgs84Lat");		//병원위도
			
			
			for(int a = 0; a < hosaddr.getLength(); a++) {						//주소
				ChooDTO dto = new ChooDTO();
				
				Node hosaddress = hosaddr.item(a).getChildNodes().item(0);
				Node hosname = name.item(a).getChildNodes().item(0);
				Node Tel = hosTel.item(a).getChildNodes().item(0);
				Node hosgyodo = gyodo.item(a).getChildNodes().item(0);
				Node hoswido = widolist.item(a).getChildNodes().item(0);
				
				String value = hosaddress.getNodeValue();
				String addrValue = value != null ? value : "";
				dto.setDutyAddr(addrValue);
				
				String value1 = hosname.getNodeValue();
				String nameValue = value1 != null ? value1 : "";
				dto.setDutyName(nameValue);
				
				String value2 = Tel.getNodeValue();
				String telValue = value2 != null ? value2 : "";
				dto.setDutyTel1(telValue);
				
				double gdovalue = Double.parseDouble(hosgyodo.getNodeValue());
				dto.setWgs84Lon(gdovalue);										//x
				//System.out.println(gdovalue);
				
				double wido = Double.parseDouble(hoswido.getNodeValue());
				dto.setWgs84Lat(wido);											//y
				//System.out.println(wido);
				
				//병원 위도 경도와 받아온 위도 경도를 넣고 거리 계산을 해서 반경내에 있는 병원만 넣는 곳
				double theta = y - gdovalue;
				double dist = Math.sin(deg2rad(wido)) * Math.sin(deg2rad(x)) + Math.cos(deg2rad(wido)) * Math.cos(deg2rad(x)) * Math.cos(deg2rad(theta));
				
				dist = Math.acos(dist);
				dist = rad2deg(dist);
				dist = dist * 60 * 1.1515 * 1609.344;
				int nodegre = (int)dist;
				//System.out.println(nodegre + "m" + "소수점 제거");
				
				dto.setBan(nodegre);						//단위는 미터로 들어간다고 되어있음
				
				int selectlength = 500; 					//특정 거리 반경 설정 값 (단위 : meter)
				int resulthos = nodegre - selectlength; 	// 거리 조건 식
				
				if(resulthos < 0) {
					hoslist.add(dto);
				}
			}
			
			List<ChooDTO> reverlist = hoslist.stream().sorted(Comparator.comparing(ChooDTO::getBan)).collect(Collectors.toList());
		// return hoslist;
			return reverlist;	
	}
}

