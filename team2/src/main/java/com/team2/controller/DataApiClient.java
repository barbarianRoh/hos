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
    
    // keyword 매개변수로 검색하는 키워드를 받고 api url에 추가해서 실제 데이터를 요청하는 url 생성 
    public String searchPublicData(String keyword) {
        String url = apiUrlWithKey + "&keyword=" + keyword;
        
        // get으로 요청을 보내고 응답 데이터는 ResponseEntity<String> 형태로 받아옴 getBody로 실제 데이터 추출
        ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
        
        // 응답 상태를 확인해서 요청이 성공했는지 검사, 성공하면 응답을 반환, 아니면 오류발생.
        if (response.getStatusCode().is2xxSuccessful()) {
            return response.getBody();
        } else {
            throw new RuntimeException("Failed to fetch public data. Status code: " + response.getStatusCode());
        }
    }
}