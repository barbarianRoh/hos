package com.team2.controller;

import java.io.IOException;
import java.net.URL;
import java.net.URLEncoder;
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
import com.team2.component.Medicine;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/hong/*")
public class Hong2Controller {

	private static final int ROWS_PER_PAGE = 10;
	
    @Autowired
    private DataApiother restOther;

    @RequestMapping("all")
    public String getotherMedicine(@RequestParam(defaultValue = "1") int page, Model model) throws IOException, ParserConfigurationException, SAXException {
        try {
            String baseUrl = "http://apis.data.go.kr/1471000/QdrgPrdtPrmsnInfoService01/getQdrgPrdtPrmsnInfoInq01";
            String serviceKey = "MMbncKBwZqOh19KQELbd%2FeILVFSsR6IbbxB7%2BNF3Oz1uxb5VmjB9p%2BQ1LFZyk2F8RZ6QWiTXrf%2BhNb6G%2BiDWVw%3D%3D";
            int totalRows = othergetTotalRows(baseUrl, serviceKey); // Get the total number of rows

            int totalPages = (int) Math.ceil((double) totalRows / ROWS_PER_PAGE);

            List<Medicine> medicines = otherfetchMedicines(baseUrl, serviceKey, page);

            model.addAttribute("medicines", medicines);
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("pageUrl", "/hos/hong/all");

            if (page < totalPages) {
                return "redirect:/hong/data1.xml"; // Return the name of the JSP for the next page
            } else {
                return "/hong/othernextPage"; // Redirect to the data1.xml address for the last page
            }
        } catch (Exception e) {
            e.printStackTrace(); // Print the stack trace of the exception for debugging
            return "/hong/error"; // Return the name of the error page
        }
    }
    
    private int othergetTotalRows(String baseUrl, String serviceKey) throws IOException, ParserConfigurationException, SAXException {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();

        String url = baseUrl + "?serviceKey=" + serviceKey + "&entpName=&pageNo=1&startPage=1&numOfRows=1";
        Document document = builder.parse(new URL(url).openStream());

        NodeList totalCountList = document.getElementsByTagName("totalCount");
        Element totalCountElement = (Element) totalCountList.item(0);
        String totalCountStr = totalCountElement.getTextContent();
        int totalCount = Integer.parseInt(totalCountStr);

        return totalCount;
    }

    private List<Medicine> otherfetchMedicines(String baseUrl, String serviceKey, int page) throws IOException, ParserConfigurationException, SAXException {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();

        int startRow = (page - 1) * ROWS_PER_PAGE + 1;
        String url = baseUrl + "?serviceKey=" + serviceKey + "&entpName=&pageNo=" + page + "&startPage=" + startRow + "&numOfRows=" + ROWS_PER_PAGE;
        Document document = builder.parse(new URL(url).openStream());

        NodeList itemNameList = document.getElementsByTagName("itemName");
        NodeList entpNameList = document.getElementsByTagName("entpName");

        List<Medicine> medicines = new ArrayList<>();

        for (int i = 0; i < itemNameList.getLength(); i++) {
            Element itemNameElement = (Element) itemNameList.item(i);
            Element entpNameElement = (Element) entpNameList.item(i);

            String itemName = itemNameElement != null ? itemNameElement.getTextContent() : "";
            String entpName = entpNameElement != null ? entpNameElement.getTextContent() : "";

            Medicine medicine = new Medicine(entpName, itemName);
            medicines.add(medicine);
        }

        return medicines;
    }

	@RequestMapping("check2")
	public String check() {
		return "/hong/othersearch";
	}

//	@RequestMapping("data1")
//	public String data1() {
//		return "redirect:/hong/data1.xml";
//	}

	
    @RequestMapping("othersearch")
    public String othersearch(@RequestParam("keyword") String keyword, Model model) throws ParserConfigurationException, SAXException, IOException {
    	
    	String encodeResult = URLEncoder.encode(keyword, "UTF-8");
    	
        String searchResult = restOther.searchotherData(keyword);
        model.addAttribute("keyword", keyword);
        model.addAttribute("searchResult", searchResult);
     
/* http://apis.data.go.kr/1471000/QdrgPrdtPrmsnInfoService01/getQdrgPrdtPrmsnInfoInq01?serviceKey=MMbncKBwZqOh19KQELbd%2FeILVFSsR6IbbxB7%2BNF3Oz1uxb5VmjB9p%2BQ1LFZyk2F8RZ6QWiTXrf%2BhNb6G%2BiDWVw%3D%3D&numOfRows=10&pageNo=1&type=xml */ 
     //   http://localhost:8080/data/data1.xml
        String url = "http://apis.data.go.kr/1471000/QdrgPrdtPrmsnInfoService01/getQdrgPrdtPrmsnInfoInq01?serviceKey=MMbncKBwZqOh19KQELbd%2FeILVFSsR6IbbxB7%2BNF3Oz1uxb5VmjB9p%2BQ1LFZyk2F8RZ6QWiTXrf%2BhNb6G%2BiDWVw%3D%3D&numOfRows=10&pageNo=1&type=xml";

     
        try {
        	// XML 파서생성
    		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
    		DocumentBuilder builder = factory.newDocumentBuilder();
    		Document document = builder.parse(new URL(url).openStream());

    		

        // Retrieve data from the API and populate the lists
    	NodeList resultCodeList = document.getElementsByTagName("resultCode"); // 결과코드
    	NodeList pageNoList = document.getElementsByTagName("pageNo"); 
    	NodeList numOfRowsList = document.getElementsByTagName("numOfRows");
    	NodeList entpNameList = document.getElementsByTagName("ENTP_NAME"); /*업체명*/
    	NodeList itemNameList = document.getElementsByTagName("ITEM_NAME");  /*제품명*/
    	NodeList efcyQesitmList = document.getElementsByTagName("EE_DOC_DATA"); /*이 약의 효능은 무엇입니까?*/
    	NodeList atpnWarnQesitmList = document.getElementsByTagName("UD_DOC_DATA"); /* 용법용량*/
    	NodeList atpnQesitmList = document.getElementsByTagName("NB_DOC_DATA"); /*이 약의 사용상 주의사항은 무엇입니까?*/

    	
    	List<String> resultCodeValues = new ArrayList<String>();
    	List<String> pageNoValues = new ArrayList<String>();
    	List<String> numOfRowsValues = new ArrayList<String>();
    	List<String> entpNameValues = new ArrayList<String>();
    	List<String> itemNameValues = new ArrayList<String>();
    	List<String> efcyQesitmValues = new ArrayList<String>();
    	List<String> atpnWarnQesitmValues = new ArrayList<String>();
    	List<String> atpnQesitmValues = new ArrayList<String>();

    	

    	if (entpNameList.getLength() > 0) {
    	    for (int i = 0; i < entpNameList.getLength(); i++) {
    	        Element resultCodeElement = (Element) resultCodeList.item(i);
    	        String resultCode = resultCodeElement != null ? resultCodeElement.getTextContent() : "";
    	        resultCodeValues.add(resultCode);

    	        Element pageNoElement = (Element) pageNoList.item(i);
    	        String pageNo = pageNoElement != null ? pageNoElement.getTextContent() : "";
    	        pageNoValues.add(pageNo);

    	        Element numOfRowsElement = (Element) numOfRowsList.item(i);
    	        String numOfRows = numOfRowsElement != null ? numOfRowsElement.getTextContent() : "";
    	        numOfRowsValues.add(numOfRows);

    	        Element entpNameElement = (Element) entpNameList.item(i);
    	        String entpName = entpNameElement != null ? entpNameElement.getTextContent() : "";
    	        entpNameValues.add(entpName);

    	        Element itemNameElement = (Element) itemNameList.item(i);
    	        String itemName = itemNameElement != null ? itemNameElement.getTextContent() : "";
    	        itemNameValues.add(itemName);

    	        Element useMethodQesitmElement = (Element) atpnWarnQesitmList.item(i);
    	        String useMethodQesitm = useMethodQesitmElement != null ? useMethodQesitmElement.getTextContent() : "";
    	        atpnWarnQesitmValues.add(useMethodQesitm);

    	        Element atpnWarnQesitmElement = (Element) efcyQesitmList.item(i);
    	        String atpnWarnQesitm = atpnWarnQesitmElement != null ? atpnWarnQesitmElement.getTextContent() : "";
    	        efcyQesitmValues.add(atpnWarnQesitm);

    	        Element atpnQesitmElement = (Element) atpnQesitmList.item(i);
    	        String atpnQesitm = atpnQesitmElement != null ? atpnQesitmElement.getTextContent() : "";
    	        atpnQesitmValues.add(atpnQesitm);
    	    }
    	}
    		
    		model.addAttribute("resultCodeValues", resultCodeValues); 
    		model.addAttribute("pageNoValues" , pageNoValues);
    		model.addAttribute("numOfRowsValues", numOfRowsValues);
    		model.addAttribute("entpNameValues", entpNameValues);	// 업체명
    		model.addAttribute("itemNameValues", itemNameValues);	// 제품명
    		model.addAttribute("efcyQesitmValues", efcyQesitmValues);	// 효능이뭐야
    		model.addAttribute("atpnWarnQesitmValues", atpnWarnQesitmValues);	// 복용방법!
    		model.addAttribute("atpnQesitmValues", atpnQesitmValues);		// 주의사항
    	

        } catch(IOException e) {
    	e.printStackTrace();
    	}
        return "/hong/otheritemName";
    }
    
    @RequestMapping("othersearchByBusiness")
    public String othersearchentpname(@RequestParam("businessName") String businessName, Model model) throws IOException, ParserConfigurationException, SAXException {
        String baseUrl = "https://apis.data.go.kr/1471000/QdrgPrdtPrmsnInfoService01/getQdrgPrdtPrmsnInfoInq01";
        String serviceKey = "MMbncKBwZqOh19KQELbd%2FeILVFSsR6IbbxB7%2BNF3Oz1uxb5VmjB9p%2BQ1LFZyk2F8RZ6QWiTXrf%2BhNb6G%2BiDWVw%3D%3D";

        // Perform the search based on the business name
        List<Medicine> medicines = otherfetchMedicinessearchentpname(baseUrl, serviceKey, businessName);

        model.addAttribute("medicines", medicines);
        model.addAttribute("searchKeyword", "entpname");

        return "/hong/otherentpName";
    }

    private List<Medicine> otherfetchMedicinessearchentpname(String baseUrl, String serviceKey, String businessName) throws IOException, ParserConfigurationException, SAXException {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();

        String encodedBusinessName = URLEncoder.encode(businessName, "UTF-8");
        String url = baseUrl + "?serviceKey=" + serviceKey + "&entpName=" + encodedBusinessName + "&pageNo=1&startPage=1&numOfRows=10";
        Document document = builder.parse(new URL(url).openStream());

        NodeList itemList = document.getElementsByTagName("item");

        List<Medicine> medicines = new ArrayList<>();

        for (int i = 0; i < itemList.getLength(); i++) {
            Element itemElement = (Element) itemList.item(i);

            Element itemNameElement = (Element) itemElement.getElementsByTagName("itemName").item(0);
            Element entpNameElement = (Element) itemElement.getElementsByTagName("entpName").item(0);

            String itemName = itemNameElement != null ? itemNameElement.getTextContent() : "";
            String entpName = entpNameElement != null ? entpNameElement.getTextContent() : "";

            Medicine medicine = new Medicine(entpName, itemName);
            medicines.add(medicine);
        }

        return medicines;
    }
}