package com.team2.component;

import lombok.Data;

@Data
public class HongDTO {
	private String pageno;	/*페이지숫자*/
	private String numofrows;	/*보여줄갯수*/
	private String entpname;	/*업체명*/
	private String itemname;	/*제품명*/
	private String efcyqesitm;	/*이 약의 효능은 무엇입니까?*/
	private String usemethodquesitm;	/*이 약은 어떻게 사용합니까?*/
	private String atpnwarnqesitm; /*이 약을 사용하기 전에 반드시 알아야 할 내용은 무엇입니까?*/
	private String atpnqesitm;	/*이 약의 사용상 주의사항은 무엇입니까?*/
	private String intrcqesitm;	/*이 약을 사용하는 동안 주의해야 할 약 또는 음식은 무엇입니까?*/
	private String seqesitm;	/*이 약은 어떤 이상반응이 나타날 수 있습니까?*/
	private String depositmethodqesitm;	/*이 약은 어떻게 보관해야 합니까?*/
	
}