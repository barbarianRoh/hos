package com.team2.controller;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;

import com.team2.component.ChooDTO;
import com.team2.component.ChooTestDTO;
import com.team2.service.ChooService;
import com.team2.service.Choohosapi;
import com.team2.service.Choohosapi2;

@Controller
@RequestMapping("/choo/*")
public class ChooController {
	
	@Autowired
	private ChooService service;
	@Autowired
	private Choohosapi api1;
	@Autowired
	private Choohosapi2 api2;
	
	@RequestMapping("map")
	public String hosmap(ChooTestDTO dto, Model model) {
		return "/choo/hosselect";
	}
	
	@RequestMapping("hosinfo")
	public String hosinfo(Model model, HttpServletRequest request, String name) {
		int count = service.nameCheck(name);
		model.addAttribute("count",count);
	if(count == 1) {
		ChooTestDTO dto = service.hospitalselect(name);
		double x = (double)dto.getJwapyoX();
		double y = (double)dto.getJwapyoY();
		model.addAttribute("name",name);
		model.addAttribute("x", x);
		model.addAttribute("y", y);
	}
		return "/choo/hosinfo";
	}
	
	@RequestMapping("addressselect")
	public String addressselect() {		//�ö� ���� �ؽ�Ʈ�� �Է°��� �ִ� ������
		return "/choo/addressselect";
	}
	
	@RequestMapping("hosapi")			//�õ����� �Է¹޾Ƽ� api�� �̿��ؼ� �˻��ϴ� ��
	public String hosapi(Model model, String Q0, String Q1) throws Exception{
		List<String> hpid = api1.hpidlist(Q0,Q1);	//ù���� api�� �Ἥ ���id�� �������� ��
		List<ChooDTO> hosresult = api2.hpidselect(hpid); //���id�� �Է��ؼ� �ش� ������ ������ ������ ���� ��

		model.addAttribute("hos", hosresult);
		return "/choo/hosapiresult";
	}
	
	@RequestMapping("hosapiresult")
	public String hosapiresult(Model model) {
		return "/choo/hosapiresult";
	}
}
