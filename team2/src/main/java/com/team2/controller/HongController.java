package com.team2.controller;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/medi/*")
public class HongController {

@RequestMapping("eat")
public String Medicine(Model model) throws SAXException, ParserConfigurationException {
String url = "http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList?serviceKey=MMbncKBwZqOh19KQELbd%2FeILVFSsR6IbbxB7%2BNF3Oz1uxb5VmjB9p%2BQ1LFZyk2F8RZ6QWiTXrf%2BhNb6G%2BiDWVw%3D%3D&trustEntpName=%ED%95%9C%EB%AF%B8%EC%95%BD%ED%92%88(%EC%A3%BC)&pageNo=12&startPage=1&numOfRows=1";
    try {
    	// XML 파서생성
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
	
	// XML 파일 로드
	Document document = builder.parse(new URL(url).openStream());

	NodeList resultCodeList = document.getElementsByTagName("resultCode"); // 결과코드
	NodeList pageNoList = document.getElementsByTagName("pageNo"); 
	NodeList numOfRowsList = document.getElementsByTagName("numOfRows");
	NodeList itemImageList = document.getElementsByTagName("itemImage"); /*이미지*/
	NodeList entpNameList = document.getElementsByTagName("entpName"); /*업체명*/
	NodeList itemNameList = document.getElementsByTagName("itemName");  /*제품명*/
	NodeList itemSeqList = document.getElementsByTagName("itemSeq");    /*품목기준코드*/
	NodeList efcyQesitmList = document.getElementsByTagName("efcyQesitm"); /*이 약의 효능은 무엇입니까?*/
	NodeList useMethodQesitmList = document.getElementsByTagName("useMethodQesitm"); /*이 약은 어떻게 사용합니까?*/
	NodeList atpnWarnQesitmList = document.getElementsByTagName("atpnWarnQesitm"); /*이 약을 사용하기 전에 반드시 알아야 할 내용은 무엇입니까?*/
	NodeList atpnQesitmList = document.getElementsByTagName("atpnQesitm"); /*이 약의 사용상 주의사항은 무엇입니까?*/
	NodeList intrcQesitmList = document.getElementsByTagName("intrcQesitm"); /*이 약을 사용하는 동안 주의해야 할 약 또는 음식은 무엇입니까?*/
	NodeList seQesitmList = document.getElementsByTagName("seQesitm"); /*이 약은 어떤 이상반응이 나타날 수 있습니까?*/
	NodeList depositMethodQesitmList = document.getElementsByTagName("depositMethodQesitm"); /*이 약은 어떻게 보관해야 합니까?*/
	NodeList updateDeList = document.getElementsByTagName("updateDe"); /*수정일자*/

	List<String> resultCodeValues = new ArrayList<String>();
	List<String> pageNoValues = new ArrayList<String>();
	List<String> numOfRowsValues = new ArrayList<String>();
	List<String> itemImageValues = new ArrayList<String>();
	List<String> entpNameValues = new ArrayList<String>();
	List<String> itemNameValues = new ArrayList<String>();
	List<String> itemSeqValues = new ArrayList<String>();
	List<String> efcyQesitmValues = new ArrayList<String>();
	List<String> useMethodQesitmValues = new ArrayList<String>();
	List<String> atpnWarnQesitmValues = new ArrayList<String>();
	List<String> atpnQesitmValues = new ArrayList<String>();
	List<String> intrcQesitmValues = new ArrayList<String>();
	List<String> seQesitmValues = new ArrayList<String>();
	List<String> depositMethodQesitmValues = new ArrayList<String>();
	List<String> updateDeValues = new ArrayList<String>();

	if(entpNameList.getLength() > 0) {
		System.out.println(resultCodeList.getLength());
		for(int i = 0; i < resultCodeList.getLength(); i++) {
			Element resultCodeElement = (Element)resultCodeList.item(i);
			String resultCode = resultCodeElement != null ? resultCodeElement.getTextContent() : "";
			resultCodeValues.add(resultCode);
			
			Element pageNoElement = (Element)pageNoList.item(i);
			String pageNo = pageNoElement != null ? pageNoElement.getTextContent() : "";
			pageNoValues.add(pageNo);
			
			Element numOfRowsElement = (Element)numOfRowsList.item(i);
			String numOfRows = numOfRowsElement != null ? numOfRowsElement.getTextContent() : "";
			numOfRowsValues.add(numOfRows);
			
			Element itemImageElement = (Element)itemImageList.item(i);
			String itemImage = itemImageElement != null ? itemImageElement.getTextContent() : "";
			itemImageValues.add(itemImage);
			
			Element entpNameElement = (Element)entpNameList.item(i);
			String entpName = entpNameElement != null ? entpNameElement.getTextContent() : "";
			entpNameValues.add(entpName);
			
			Element  itemNameElement = (Element)itemNameList.item(i);
			String  itemName =  itemNameElement != null ?  itemNameElement.getTextContent() : "";
			itemNameValues.add(itemName);
			
			Element itemSeqElement = (Element)itemSeqList.item(i);
			String itemSeq = itemSeqElement != null ? itemSeqElement.getTextContent() : "";
			itemSeqValues.add(itemSeq);
			
			Element efcyQesitmElement = (Element)useMethodQesitmList.item(i);
			String efcyQesitm = efcyQesitmElement != null ? efcyQesitmElement.getTextContent() : "";
			useMethodQesitmValues.add(efcyQesitm);
			
			Element useMethodQesitmElement = (Element)atpnWarnQesitmList.item(i);
			String useMethodQesitm = useMethodQesitmElement != null ? useMethodQesitmElement.getTextContent() : "";
			atpnWarnQesitmValues.add(useMethodQesitm);
			
			Element atpnWarnQesitmElement = (Element)efcyQesitmList.item(i);
			String atpnWarnQesitm = atpnWarnQesitmElement != null ? atpnWarnQesitmElement.getTextContent() : "";
			efcyQesitmValues.add(atpnWarnQesitm);
			
			Element atpnQesitmElement = (Element)atpnQesitmList.item(i);
			String atpnQesitm = atpnQesitmElement != null ? atpnQesitmElement.getTextContent() : "";
			atpnQesitmValues.add(atpnQesitm);
			
			Element intrcQesitmElement = (Element)intrcQesitmList.item(i);
			String intrcQesitm = intrcQesitmElement != null ? intrcQesitmElement.getTextContent() : "";
			intrcQesitmValues.add(intrcQesitm);
			
			Element seQesitmElement = (Element)seQesitmList.item(i);
			String seQesitm = seQesitmElement != null ? seQesitmElement.getTextContent() : "";
			seQesitmValues.add(seQesitm);
			
			Element depositMethodQesitmElement = (Element)depositMethodQesitmList.item(i);
			String depositMethodQesitm = depositMethodQesitmElement != null ? depositMethodQesitmElement.getTextContent() : "";
			depositMethodQesitmValues.add(depositMethodQesitm);
			
			Element updateDeElement = (Element)depositMethodQesitmList.item(i);
			String updateDe = updateDeElement != null ? updateDeElement.getTextContent() : "";
			depositMethodQesitmValues.add(updateDe);
			
		}
		
		model.addAttribute("resultCodeValues", resultCodeValues); 
		model.addAttribute("pageNoValues" , pageNoValues);
		model.addAttribute("numOfRowsValues", numOfRowsValues);
		model.addAttribute("itemImageValues" , itemImageValues); //이미지
		model.addAttribute("entpNameValues", entpNameValues);	// 업체명
		model.addAttribute("itemNameValues", itemNameValues);	// 제품명
		model.addAttribute("itemSeqValues", itemSeqValues);		// 품목기준코드
		model.addAttribute("efcyQesitmValues", efcyQesitmValues);	// 효능이뭐야
		model.addAttribute("useMethodQesitmValues", useMethodQesitmValues);	// 사용법
		model.addAttribute("atpnWarnQesitmValues", atpnWarnQesitmValues);	// 알아야함!
		model.addAttribute("atpnQesitmValues", atpnQesitmValues);		// 주의사항
		model.addAttribute("intrcQesitmValues", intrcQesitmValues);	// 주의할 약또는 음식
		model.addAttribute("seQesitmValues", seQesitmValues);	// 이상반응
		model.addAttribute("depositMethodQesitmValues", depositMethodQesitmValues);	// 보관법
		model.addAttribute("updateDeValues", updateDeValues);	// 수정일자
	} else {
		System.out.println("resultCode 요소를 찾을 수 없습니다");
	}

    } catch(IOException e) {
	e.printStackTrace();
	}
    return "medicine";
}

	@RequestMapping("check")
	public String check() {
		return "search";
	}
	
    @Autowired
    private DataApiClient dataApiClient;

    @RequestMapping("search")
    public String search(@RequestParam("keyword") String keyword, Model model) throws ParserConfigurationException, SAXException, IOException {
        String searchResult = dataApiClient.searchPublicData(keyword);
        model.addAttribute("keyword", keyword);
        model.addAttribute("searchResult", searchResult);
        
        String url = "http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList?serviceKey=MMbncKBwZqOh19KQELbd%2FeILVFSsR6IbbxB7%2BNF3Oz1uxb5VmjB9p%2BQ1LFZyk2F8RZ6QWiTXrf%2BhNb6G%2BiDWVw%3D%3D&trustEntpName=" + keyword + "%ED%95%9C%EB%AF%B8%EC%95%BD%ED%92%88(%EC%A3%BC)&pageNo=1&startPage=1&numOfRows=1";
        try {
        	// XML 파서생성
    		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
    		DocumentBuilder builder = factory.newDocumentBuilder();
    	Document document = builder.parse(new URL(url).openStream());
        // Retrieve data from the API and populate the lists
    	NodeList resultCodeList = document.getElementsByTagName("resultCode"); // 결과코드
    	NodeList pageNoList = document.getElementsByTagName("pageNo"); 
    	NodeList numOfRowsList = document.getElementsByTagName("numOfRows");
    	NodeList itemImageList = document.getElementsByTagName("itemImage"); /*이미지*/
    	NodeList entpNameList = document.getElementsByTagName("entpName"); /*업체명*/
    	NodeList itemNameList = document.getElementsByTagName("itemName");  /*제품명*/
    	NodeList itemSeqList = document.getElementsByTagName("itemSeq");    /*품목기준코드*/
    	NodeList efcyQesitmList = document.getElementsByTagName("efcyQesitm"); /*이 약의 효능은 무엇입니까?*/
    	NodeList useMethodQesitmList = document.getElementsByTagName("useMethodQesitm"); /*이 약은 어떻게 사용합니까?*/
    	NodeList atpnWarnQesitmList = document.getElementsByTagName("atpnWarnQesitm"); /*이 약을 사용하기 전에 반드시 알아야 할 내용은 무엇입니까?*/
    	NodeList atpnQesitmList = document.getElementsByTagName("atpnQesitm"); /*이 약의 사용상 주의사항은 무엇입니까?*/
    	NodeList intrcQesitmList = document.getElementsByTagName("intrcQesitm"); /*이 약을 사용하는 동안 주의해야 할 약 또는 음식은 무엇입니까?*/
    	NodeList seQesitmList = document.getElementsByTagName("seQesitm"); /*이 약은 어떤 이상반응이 나타날 수 있습니까?*/
    	NodeList depositMethodQesitmList = document.getElementsByTagName("depositMethodQesitm"); /*이 약은 어떻게 보관해야 합니까?*/
    	NodeList updateDeList = document.getElementsByTagName("updateDe"); /*수정일자*/

    	List<String> resultCodeValues = new ArrayList<String>();
    	List<String> pageNoValues = new ArrayList<String>();
    	List<String> numOfRowsValues = new ArrayList<String>();
    	List<String> itemImageValues = new ArrayList<String>();
    	List<String> entpNameValues = new ArrayList<String>();
    	List<String> itemNameValues = new ArrayList<String>();
    	List<String> itemSeqValues = new ArrayList<String>();
    	List<String> efcyQesitmValues = new ArrayList<String>();
    	List<String> useMethodQesitmValues = new ArrayList<String>();
    	List<String> atpnWarnQesitmValues = new ArrayList<String>();
    	List<String> atpnQesitmValues = new ArrayList<String>();
    	List<String> intrcQesitmValues = new ArrayList<String>();
    	List<String> seQesitmValues = new ArrayList<String>();
    	List<String> depositMethodQesitmValues = new ArrayList<String>();
    	List<String> updateDeValues = new ArrayList<String>();

    	if(entpNameList.getLength() > 0) {
    		System.out.println(resultCodeList.getLength());
    		for(int i = 0; i < resultCodeList.getLength(); i++) {
    			Element resultCodeElement = (Element)resultCodeList.item(i);
    			String resultCode = resultCodeElement != null ? resultCodeElement.getTextContent() : "";
    			resultCodeValues.add(resultCode);
    			
    			Element pageNoElement = (Element)pageNoList.item(i);
    			String pageNo = pageNoElement != null ? pageNoElement.getTextContent() : "";
    			pageNoValues.add(pageNo);
    			
    			Element numOfRowsElement = (Element)numOfRowsList.item(i);
    			String numOfRows = numOfRowsElement != null ? numOfRowsElement.getTextContent() : "";
    			numOfRowsValues.add(numOfRows);
    			
    			Element itemImageElement = (Element)itemImageList.item(i);
    			String itemImage = itemImageElement != null ? itemImageElement.getTextContent() : "";
    			itemImageValues.add(itemImage);
    			
    			Element entpNameElement = (Element)entpNameList.item(i);
    			String entpName = entpNameElement != null ? entpNameElement.getTextContent() : "";
    			entpNameValues.add(entpName);
    			
    			Element  itemNameElement = (Element)itemNameList.item(i);
    			String  itemName =  itemNameElement != null ?  itemNameElement.getTextContent() : "";
    			itemNameValues.add(itemName);
    			
    			Element itemSeqElement = (Element)itemSeqList.item(i);
    			String itemSeq = itemSeqElement != null ? itemSeqElement.getTextContent() : "";
    			itemSeqValues.add(itemSeq);
    			
    			Element efcyQesitmElement = (Element)useMethodQesitmList.item(i);
    			String efcyQesitm = efcyQesitmElement != null ? efcyQesitmElement.getTextContent() : "";
    			useMethodQesitmValues.add(efcyQesitm);
    			
    			Element useMethodQesitmElement = (Element)atpnWarnQesitmList.item(i);
    			String useMethodQesitm = useMethodQesitmElement != null ? useMethodQesitmElement.getTextContent() : "";
    			atpnWarnQesitmValues.add(useMethodQesitm);
    			
    			Element atpnWarnQesitmElement = (Element)efcyQesitmList.item(i);
    			String atpnWarnQesitm = atpnWarnQesitmElement != null ? atpnWarnQesitmElement.getTextContent() : "";
    			efcyQesitmValues.add(atpnWarnQesitm);
    			
    			Element atpnQesitmElement = (Element)atpnQesitmList.item(i);
    			String atpnQesitm = atpnQesitmElement != null ? atpnQesitmElement.getTextContent() : "";
    			atpnQesitmValues.add(atpnQesitm);
    			
    			Element intrcQesitmElement = (Element)intrcQesitmList.item(i);
    			String intrcQesitm = intrcQesitmElement != null ? intrcQesitmElement.getTextContent() : "";
    			intrcQesitmValues.add(intrcQesitm);
    			
    			Element seQesitmElement = (Element)seQesitmList.item(i);
    			String seQesitm = seQesitmElement != null ? seQesitmElement.getTextContent() : "";
    			seQesitmValues.add(seQesitm);
    			
    			Element depositMethodQesitmElement = (Element)depositMethodQesitmList.item(i);
    			String depositMethodQesitm = depositMethodQesitmElement != null ? depositMethodQesitmElement.getTextContent() : "";
    			depositMethodQesitmValues.add(depositMethodQesitm);
    			
    			Element updateDeElement = (Element)depositMethodQesitmList.item(i);
    			String updateDe = updateDeElement != null ? updateDeElement.getTextContent() : "";
    			depositMethodQesitmValues.add(updateDe);
    			
    		}
    		
    		model.addAttribute("resultCodeValues", resultCodeValues); 
    		model.addAttribute("pageNoValues" , pageNoValues);
    		model.addAttribute("numOfRowsValues", numOfRowsValues);
    		model.addAttribute("itemImageValues" , itemImageValues); //이미지
    		model.addAttribute("entpNameValues", entpNameValues);	// 업체명
    		model.addAttribute("itemNameValues", itemNameValues);	// 제품명
    		model.addAttribute("itemSeqValues", itemSeqValues);		// 품목기준코드
    		model.addAttribute("efcyQesitmValues", efcyQesitmValues);	// 효능이뭐야
    		model.addAttribute("useMethodQesitmValues", useMethodQesitmValues);	// 사용법
    		model.addAttribute("atpnWarnQesitmValues", atpnWarnQesitmValues);	// 알아야함!
    		model.addAttribute("atpnQesitmValues", atpnQesitmValues);		// 주의사항
    		model.addAttribute("intrcQesitmValues", intrcQesitmValues);	// 주의할 약또는 음식
    		model.addAttribute("seQesitmValues", seQesitmValues);	// 이상반응
    		model.addAttribute("depositMethodQesitmValues", depositMethodQesitmValues);	// 보관법
    		model.addAttribute("updateDeValues", updateDeValues);	// 수정일자
    	} else {
    		System.out.println("resultCode 요소를 찾을 수 없습니다");
    	}

        } catch(IOException e) {
    	e.printStackTrace();
    	}
        return "";
    }
}