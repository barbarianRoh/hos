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
    	// XML �ļ�����
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
	
	// XML ���� �ε�
	Document document = builder.parse(new URL(url).openStream());

	NodeList resultCodeList = document.getElementsByTagName("resultCode"); // ����ڵ�
	NodeList pageNoList = document.getElementsByTagName("pageNo"); 
	NodeList numOfRowsList = document.getElementsByTagName("numOfRows");
	NodeList itemImageList = document.getElementsByTagName("itemImage"); /*�̹���*/
	NodeList entpNameList = document.getElementsByTagName("entpName"); /*��ü��*/
	NodeList itemNameList = document.getElementsByTagName("itemName");  /*��ǰ��*/
	NodeList itemSeqList = document.getElementsByTagName("itemSeq");    /*ǰ������ڵ�*/
	NodeList efcyQesitmList = document.getElementsByTagName("efcyQesitm"); /*�� ���� ȿ���� �����Դϱ�?*/
	NodeList useMethodQesitmList = document.getElementsByTagName("useMethodQesitm"); /*�� ���� ��� ����մϱ�?*/
	NodeList atpnWarnQesitmList = document.getElementsByTagName("atpnWarnQesitm"); /*�� ���� ����ϱ� ���� �ݵ�� �˾ƾ� �� ������ �����Դϱ�?*/
	NodeList atpnQesitmList = document.getElementsByTagName("atpnQesitm"); /*�� ���� ���� ���ǻ����� �����Դϱ�?*/
	NodeList intrcQesitmList = document.getElementsByTagName("intrcQesitm"); /*�� ���� ����ϴ� ���� �����ؾ� �� �� �Ǵ� ������ �����Դϱ�?*/
	NodeList seQesitmList = document.getElementsByTagName("seQesitm"); /*�� ���� � �̻������ ��Ÿ�� �� �ֽ��ϱ�?*/
	NodeList depositMethodQesitmList = document.getElementsByTagName("depositMethodQesitm"); /*�� ���� ��� �����ؾ� �մϱ�?*/
	NodeList updateDeList = document.getElementsByTagName("updateDe"); /*��������*/

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
		model.addAttribute("itemImageValues" , itemImageValues); //�̹���
		model.addAttribute("entpNameValues", entpNameValues);	// ��ü��
		model.addAttribute("itemNameValues", itemNameValues);	// ��ǰ��
		model.addAttribute("itemSeqValues", itemSeqValues);		// ǰ������ڵ�
		model.addAttribute("efcyQesitmValues", efcyQesitmValues);	// ȿ���̹���
		model.addAttribute("useMethodQesitmValues", useMethodQesitmValues);	// ����
		model.addAttribute("atpnWarnQesitmValues", atpnWarnQesitmValues);	// �˾ƾ���!
		model.addAttribute("atpnQesitmValues", atpnQesitmValues);		// ���ǻ���
		model.addAttribute("intrcQesitmValues", intrcQesitmValues);	// ������ ��Ǵ� ����
		model.addAttribute("seQesitmValues", seQesitmValues);	// �̻����
		model.addAttribute("depositMethodQesitmValues", depositMethodQesitmValues);	// ������
		model.addAttribute("updateDeValues", updateDeValues);	// ��������
	} else {
		System.out.println("resultCode ��Ҹ� ã�� �� �����ϴ�");
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
        
        String url = "http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList?serviceKey=MMbncKBwZqOh19KQELbd%2FeILVFSsR6IbbxB7%2BNF3Oz1uxb5VmjB9p%2BQ1LFZyk2F8RZ6QWiTXrf%2BhNb6G%2BiDWVw%3D%3D&trustEntpName=%ED%95%9C%EB%AF%B8%EC%95%BD%ED%92%88(%EC%A3%BC)&pageNo=1&startPage=1&numOfRows=1";
        try {
        	// XML �ļ�����
    		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
    		DocumentBuilder builder = factory.newDocumentBuilder();
    	Document document = builder.parse(new URL(url).openStream());
        // Retrieve data from the API and populate the lists
    	NodeList resultCodeList = document.getElementsByTagName("resultCode"); // ����ڵ�
    	NodeList pageNoList = document.getElementsByTagName("pageNo"); 
    	NodeList numOfRowsList = document.getElementsByTagName("numOfRows");
    	NodeList itemImageList = document.getElementsByTagName("itemImage"); /*�̹���*/
    	NodeList entpNameList = document.getElementsByTagName("entpName"); /*��ü��*/
    	NodeList itemNameList = document.getElementsByTagName("itemName");  /*��ǰ��*/
    	NodeList itemSeqList = document.getElementsByTagName("itemSeq");    /*ǰ������ڵ�*/
    	NodeList efcyQesitmList = document.getElementsByTagName("efcyQesitm"); /*�� ���� ȿ���� �����Դϱ�?*/
    	NodeList useMethodQesitmList = document.getElementsByTagName("useMethodQesitm"); /*�� ���� ��� ����մϱ�?*/
    	NodeList atpnWarnQesitmList = document.getElementsByTagName("atpnWarnQesitm"); /*�� ���� ����ϱ� ���� �ݵ�� �˾ƾ� �� ������ �����Դϱ�?*/
    	NodeList atpnQesitmList = document.getElementsByTagName("atpnQesitm"); /*�� ���� ���� ���ǻ����� �����Դϱ�?*/
    	NodeList intrcQesitmList = document.getElementsByTagName("intrcQesitm"); /*�� ���� ����ϴ� ���� �����ؾ� �� �� �Ǵ� ������ �����Դϱ�?*/
    	NodeList seQesitmList = document.getElementsByTagName("seQesitm"); /*�� ���� � �̻������ ��Ÿ�� �� �ֽ��ϱ�?*/
    	NodeList depositMethodQesitmList = document.getElementsByTagName("depositMethodQesitm"); /*�� ���� ��� �����ؾ� �մϱ�?*/
    	NodeList updateDeList = document.getElementsByTagName("updateDe"); /*��������*/

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
    		model.addAttribute("itemImageValues" , itemImageValues); //�̹���
    		model.addAttribute("entpNameValues", entpNameValues);	// ��ü��
    		model.addAttribute("itemNameValues", itemNameValues);	// ��ǰ��
    		model.addAttribute("itemSeqValues", itemSeqValues);		// ǰ������ڵ�
    		model.addAttribute("efcyQesitmValues", efcyQesitmValues);	// ȿ���̹���
    		model.addAttribute("useMethodQesitmValues", useMethodQesitmValues);	// ����
    		model.addAttribute("atpnWarnQesitmValues", atpnWarnQesitmValues);	// �˾ƾ���!
    		model.addAttribute("atpnQesitmValues", atpnQesitmValues);		// ���ǻ���
    		model.addAttribute("intrcQesitmValues", intrcQesitmValues);	// ������ ��Ǵ� ����
    		model.addAttribute("seQesitmValues", seQesitmValues);	// �̻����
    		model.addAttribute("depositMethodQesitmValues", depositMethodQesitmValues);	// ������
    		model.addAttribute("updateDeValues", updateDeValues);	// ��������
    	} else {
    		System.out.println("resultCode ��Ҹ� ã�� �� �����ϴ�");
    	}

        } catch(IOException e) {
    	e.printStackTrace();
    	}
        return "medicine";
    }
}