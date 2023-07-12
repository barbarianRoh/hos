package com.team2.service;

import org.jdom2.Element;
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

//병원목록 조회하는 API 장소

@Service
public class Choohosapi {
// UZHnvSBw7ESYEUBtz%2BH9YHocdwfx3wFhm54v1fiXwk9pj4Wv3pY5%2F4uhCj9YTxYd1gtqHkhlP9vC9tMQh6CulA%3D%3D : 인증키
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
	        	urlBuilder.append("&" + URLEncoder.encode("Q1","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*주소(시군구)*/
	        }else {	
	        	urlBuilder.append("&" + URLEncoder.encode("Q1","UTF-8") + "=" + URLEncoder.encode(Q1, "UTF-8")); /*주소(시군구)*/
	        }
	        
	        // urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*목록 건수*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        //System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {		//200이면 정상작동 300이면 오류
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
	        
	        // 여기서부터 추가한 부분
	        ChooDTO dto = new ChooDTO();
	        String tag = sb.toString();
			
			DocumentBuilderFactory factory  =  DocumentBuilderFactory.newInstance();
			DocumentBuilder builder    =  factory.newDocumentBuilder();
			Document document     =  builder.parse(new InputSource(new StringReader(tag)));
			  
			  
			
			NodeList idforhoslist = document.getElementsByTagName("hpid"); // XML에선 hpid태그안에 있는 값이며 즉 불러낼 것 : 기관ID
			  
			  for(int i = 0 ; i < idforhoslist.getLength(); i++) {
				   Node idforhos =  idforhoslist.item(i).getChildNodes().item(0);
			
				   String value = idforhos.getNodeValue();				//getNodeValue는 해당 노드의 값을 추출하고 String타입 변수에 저장함
				   String stringValue = value != null ? value : "";		//위에서 저장한 값을 stringValue에 값을 할당하고 value값이 null인지 아닌지 확인함
				   idlist.add(stringValue);								//값을 for문을 사용해서 dto에 저장을 해야하기에 사용
				   
			  //for(int a = 0 ; a < idlist.size() ; a++) {
				   //dto.setHpid(idlist.get(i));
			  //}
			//System.out.println(idforhos.getNodeName()+"==="+idforhos.getNodeValue());
			//System.out.println(dto.getHpid()); 현재 여기까지 정상작동중 
		}
			return idlist;
	}	        	        
}

