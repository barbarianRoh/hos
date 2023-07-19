package com.team2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;


@Component
public class DataApiother {
	
private RestTemplate restOther;
private String apiUrlWithKey;

@Autowired
public void DataApiOther(@Qualifier("restOther")RestTemplate restOther) {
	this.restOther = new RestTemplate();
	this.apiUrlWithKey = "http://apis.data.go.kr/1471000/QdrgPrdtPrmsnInfoService01/getQdrgPrdtPrmsnInfoInq01?serviceKey=MMbncKBwZqOh19KQELbd%2FeILVFSsR6IbbxB7%2BNF3Oz1uxb5VmjB9p%2BQ1LFZyk2F8RZ6QWiTXrf%2BhNb6G%2BiDWVw%3D%3D&numOfRows=10&pageNo=1&type=xml";
	
}

	public String searchotherData(String keyword) {
		String apiUrlWithKey = "https://apis.data.go.kr/1471000/QdrgPrdtPrmsnInfoService02/getQdrgPrdtPrmsnInfoInq02?serviceKey=MMbncKBwZqOh19KQELbd%2FeILVFSsR6IbbxB7%2BNF3Oz1uxb5VmjB9p%2BQ1LFZyk2F8RZ6QWiTXrf%2BhNb6G%2BiDWVw%3D%3D&itemName=1&pageNo=1&numOfRows=1&type=xml";
		String url = apiUrlWithKey + "&keyword=" + keyword;
		
		ResponseEntity<String> response = restOther.getForEntity(url, String.class);
		if(response.getStatusCode().is2xxSuccessful()) {
			return response.getBody();
		}else {
			throw new RuntimeException("실패 뭐시기 Status code : " + response.getStatusCodeValue());
		}
	}
}