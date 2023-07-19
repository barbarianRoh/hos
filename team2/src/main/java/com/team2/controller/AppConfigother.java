package com.team2.controller;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@Configuration
public class AppConfigother {

    @Bean
    public RestTemplate restOther() {
    	return new RestTemplate();
    }
    
    @Bean(name = "DataApiOther")
    public DataApiClient DataApiOther(RestTemplate restOther) {
    	return new DataApiClient();
    }
}