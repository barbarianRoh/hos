package com.team2.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;


public class DataApiClient {

    private RestTemplate restTemplate;
    private String apiUrlWithKey;

    public DataApiClient() {
        this.restTemplate = new RestTemplate();
        this.apiUrlWithKey = "http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList?serviceKey=MMbncKBwZqOh19KQELbd%2FeILVFSsR6IbbxB7%2BNF3Oz1uxb5VmjB9p%2BQ1LFZyk2F8RZ6QWiTXrf%2BhNb6G%2BiDWVw%3D%3D&trustEntpName=%ED%95%9C%EB%AF%B8%EC%95%BD%ED%92%88(%EC%A3%BC)&pageNo=&startPage=&numOfRows=";
        
    }

    public String searchPublicData(String keyword) {
        String url = apiUrlWithKey + "&keyword=" + keyword;
        ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
        if (response.getStatusCode().is2xxSuccessful()) {
            return response.getBody();
        } else {
            throw new RuntimeException("Failed to fetch public data. Status code: " + response.getStatusCode());
        }
    }
}