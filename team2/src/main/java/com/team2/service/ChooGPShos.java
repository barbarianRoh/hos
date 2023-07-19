package com.team2.service;

import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.team2.component.ChooDTO;

import java.io.BufferedReader;
import java.io.IOException;

@Service
public class ChooGPShos {
	
	//GPS좌표를 받아서 검색해서 주변 병원 검색해서 병원 이름만 리스트에 넣음
	public List GPSselect(double WGS84_LAT, double WGS84_LON) throws Exception{
		List<String> hpidselect = new ArrayList<String>();
		
		String wgs84_lat = Double.toString(WGS84_LAT);
		String wgs84_lon = Double.toString(WGS84_LON);
		
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncLcinfoInqire"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=UZHnvSBw7ESYEUBtz%2BH9YHocdwfx3wFhm54v1fiXwk9pj4Wv3pY5%2F4uhCj9YTxYd1gtqHkhlP9vC9tMQh6CulA%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("WGS84_LAT","UTF-8") + "=" + URLEncoder.encode(wgs84_lat, "UTF-8")); //좌표Y
        urlBuilder.append("&" + URLEncoder.encode("WGS84_LON","UTF-8") + "=" + URLEncoder.encode(wgs84_lon, "UTF-8")); //좌표Y
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); //결과로 가져올 갯수
        
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        //System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
        //System.out.println(sb.toString());
		
        String tag = sb.toString();
        
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document = builder.parse(new InputSource(new StringReader(tag)));
        
        NodeList namelist = document.getElementsByTagName("dutyName");
        
        	for(int a = 0; a < namelist.getLength(); a++) {
        		Node hosname = namelist.item(a).getChildNodes().item(0);
        		
        		String value = hosname.getNodeValue();
        		String stringValue = value != null ? value : "";
				//System.out.println(stringValue); //이부분에선 값을 제대로 가지고 오고 있음
        		hpidselect.add(stringValue);
        	}
		return hpidselect;
	}
}
