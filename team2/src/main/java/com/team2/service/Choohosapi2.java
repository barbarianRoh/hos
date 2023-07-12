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

//���� ��� �˻��� ������ ���ID�� ������ �ͼ� �ش� ���� ��������� ã�� API ���

@Service
public class Choohosapi2 {
// UZHnvSBw7ESYEUBtz%2BH9YHocdwfx3wFhm54v1fiXwk9pj4Wv3pY5%2F4uhCj9YTxYd1gtqHkhlP9vC9tMQh6CulA%3D%3D : ����Ű
	public List hpidselect(List<String> hpid) throws Exception {
		//List<ChooDTO> resultlist = new ArrayList<ChooDTO>();		//hpid�� �˻��� �Ŀ� ������� ���� ����Ʈ
		//List<List<String>> resultlist = new ArrayList<List<String>>();
		List<ChooDTO> resultlist = new ArrayList<ChooDTO>();
		
		for(int i = 0 ; i < hpid.size(); i++) {
			ChooDTO dto = new ChooDTO();
	        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlBassInfoInqire"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=UZHnvSBw7ESYEUBtz%2BH9YHocdwfx3wFhm54v1fiXwk9pj4Wv3pY5%2F4uhCj9YTxYd1gtqHkhlP9vC9tMQh6CulA%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("HPID","UTF-8") + "=" + URLEncoder.encode(hpid.get(i), "UTF-8")); /*���ID*/
	        
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
		  
			NodeList namelist = document.getElementsByTagName("dutyName"); // dutyName �����
			Node hosname =  namelist.item(0).getChildNodes().item(0);
		  
			if(hosname != null) {
				String value = hosname.getNodeValue();		//getNodeValue�� �ش� ����� ���� �����ϰ� StringŸ�� ������ ������
				   String name = value != null ? value : "";	//������ ������ ���� stringValue�� ���� �Ҵ��ϰ� value���� null���� �ƴ��� Ȯ����
				   //resultlist.add(name);
				   dto.setDutyName(name);
			}
			NodeList addresslist = document.getElementsByTagName("dutyAddr"); // dutyAddr �ּ�
			Node hosaddr =  addresslist.item(0).getChildNodes().item(0);
		  
			if(hosaddr != null) {
				String value = hosaddr.getNodeValue();		//getNodeValue�� �ش� ����� ���� �����ϰ� StringŸ�� ������ ������
				String addr = value != null ? value : "";	//������ ������ ���� stringValue�� ���� �Ҵ��ϰ� value���� null���� �ƴ��� Ȯ����
				dto.setDutyAddr(addr);
		   }
		  
		  //List<String> tel = new ArrayList<String>();
		  
		  NodeList tellist = document.getElementsByTagName("dutyTel1"); // dutyTel1 ��ǥ��ȭ1
		  Node hostel =  tellist.item(0).getChildNodes().item(0);
		  
		  if(hostel != null) {
			  String value = hostel.getNodeValue();				//getNodeValue�� �ش� ����� ���� �����ϰ� StringŸ�� ������ ������
			  String tel = value != null ? value : "";		//������ ������ ���� stringValue�� ���� �Ҵ��ϰ� value���� null���� �ƴ��� Ȯ����
			  dto.setDutyTel1(tel);
		   }

		  NodeList classlist = document.getElementsByTagName("dgidIdName"); // dgidIdName �������
		  
		  if(classlist.getLength() == 0) {
			  dto.setDgidIdName("���� ������Ʈ �������Դϴ�.");
		  }else if(classlist.getLength() == 1){
			  Node hosclass =  classlist.item(0).getChildNodes().item(0);
			  String value = hosclass.getNodeValue();			//getNodeValue�� �ش� ����� ���� �����ϰ� StringŸ�� ������ ������
			  String jinryo = value != null ? value : "";	//������ ������ ���� stringValue�� ���� �Ҵ��ϰ� value���� null���� �ƴ��� Ȯ����
			  dto.setDgidIdName(jinryo);					
		   }
		  
		  NodeList gyodo = document.getElementsByTagName("wgs84Lon");		//�����浵
		  Node hosgyodo = gyodo.item(0).getChildNodes().item(0);
		  
		  if(hosgyodo != null) {
			  double gdovalue = Double.parseDouble(hosgyodo.getNodeValue());
			  dto.setWgs84Lon(gdovalue);
		  }
		  
		  NodeList widolist = document.getElementsByTagName("wgs84Lat");	//��������
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