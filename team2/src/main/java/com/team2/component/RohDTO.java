package com.team2.component;

import java.util.Date;

import lombok.Data;

@Data
public class RohDTO {
	
	private int num;
	private String id;
	private String pw;
	private String pw2;
	private String pw3;
	private String name;
	private String memberType;
	private String ip;
	private Date reg;
	private String enabled;
	private String etc1;
	private String etc2;
}