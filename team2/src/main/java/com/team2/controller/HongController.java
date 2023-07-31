package com.team2.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.team2.component.HongDTO;
import com.team2.component.Medicine;
import com.team2.service.HongService;

import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/hong/*")
public class HongController {

	private static final int ROWS_PER_PAGE = 21;	// 한페이지당 보여줄 행의 수

	private static final String HongDTO = null;
	
    @Autowired
    private DataApiClient dataApiClient;
    
    // 목록페이지
    @RequestMapping("total")
    public String getMedicine(@RequestParam(defaultValue = "1") int page, Model model) throws IOException, ParserConfigurationException, SAXException {
	try {
        String baseUrl = "https://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList";
        String serviceKey = "MMbncKBwZqOh19KQELbd%2FeILVFSsR6IbbxB7%2BNF3Oz1uxb5VmjB9p%2BQ1LFZyk2F8RZ6QWiTXrf%2BhNb6G%2BiDWVw%3D%3D";
        int totalRows = getTotalRows(baseUrl, serviceKey); // 총 행 수 가져오기
        // 총페이지를 한페이지당 보여줄 행의 수로 나눠서 계산
        int totalPages = (int) Math.ceil((double) totalRows / ROWS_PER_PAGE);
        
        // fetchMedicines 메소드에서 약물 정보를 가져옴
        List<Medicine> medicines = fetchMedicines(baseUrl, serviceKey, page);
        
        model.addAttribute("medicines", medicines);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("pageUrl", "/hos/hong/total");

        // 현재페이지가 총 페이지수 보다 작을경우 finalpage 로 이동	
        if (page < totalPages) {
            return "/hong/nextPage"; 
        } else {
            return "/hong/finalPage"; 
        }
	    } catch (Exception e) {
	        e.printStackTrace(); 
	        return "/hong/error"; 
	    	}
	    }
    
    private int getTotalRows(String baseUrl, String serviceKey) throws IOException, ParserConfigurationException, SAXException {
    	// 파서 생성을 위한 새로운 객체 생성
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();

        // 요청할 API의 주소를 가져옴
        String url = baseUrl + "?serviceKey=" + serviceKey + "&entpName=&pageNo=1&startPage=1&numOfRows=1";
        
        // API 요청을 보내고 XML 응답을 받아와서 document 객체로 파싱
        Document document = builder.parse(new URL(url).openStream());

        // 파싱된 데이터를 가지고 totalCount를 NodeList로 가져옴
        NodeList totalCountList = document.getElementsByTagName("totalCount");
        
        // totalCount 의 첫번째 인덱스 번호를 가져옴
        Element totalCountElement = (Element) totalCountList.item(0);
        
        // totalCount 의 텍스트 내용을 가져옴
        String totalCountStr = totalCountElement.getTextContent();
        
        // 가져온 총행수를 int 형으로 변환
        int totalCount = Integer.parseInt(totalCountStr);

        // 총행수 반환
        return totalCount;
    }

    // 3가지 매개변수 사용
    private List<Medicine> fetchMedicines(String baseUrl, String serviceKey, int page) throws IOException, ParserConfigurationException, SAXException {
    	
    	// 새로운 builder 생성
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();

        // api에서 정보를 가져오기 위한 시작 행
        int startRow = (page - 1) * ROWS_PER_PAGE + 1;
        
        //데이터 가져오는 url 구성
        String url = baseUrl + "?serviceKey=" + serviceKey + "&itemName=&pageNo=" + page + "&startPage=" + startRow + "&numOfRows=" + ROWS_PER_PAGE;
        // 그 데이터를 document에 구성
        Document document = builder.parse(new URL(url).openStream());

        // xml 응답에서 두가지 요소를 검색
        NodeList itemNameList = document.getElementsByTagName("itemName");
        NodeList entpNameList = document.getElementsByTagName("entpName");

        List<Medicine> medicines = new ArrayList<>();

        // 두가지 요소를 반복 검색, 추출
        for (int i = 0; i < itemNameList.getLength(); i++) {
            Element itemNameElement = (Element) itemNameList.item(i);
            Element entpNameElement = (Element) entpNameList.item(i);

            String itemName = itemNameElement != null ? itemNameElement.getTextContent() : "";
            String entpName = entpNameElement != null ? entpNameElement.getTextContent() : "";

            // 각각 새로운 medicine 객체를 생성하고 목록에 추가
            Medicine medicine = new Medicine(entpName, itemName);
            medicines.add(medicine);
        }

        return medicines;
    }
    
    // 의약품 검색 페이지
	@RequestMapping("search")
	public String check() {
		return "/hong/search";
	}
	
	// 의약품 정보 가져오는곳, 결과 페이지
    @RequestMapping("result")
    public String result(@RequestParam("keyword") String keyword, Model model) throws ParserConfigurationException, SAXException, IOException {
    	
    	// 특수문자 처리 인코드
    	String encodeResult = URLEncoder.encode(keyword, "UTF-8");
    	// 키워드 기반으로 검색결과를 가져옴
        String searchResult = dataApiClient.searchPublicData(keyword);
        
        // 모델에 keyword 와 searchresult를 저장
        model.addAttribute("keyword", keyword);
        model.addAttribute("searchResult", searchResult);
        																																																						
        String url = "http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList?serviceKey=MMbncKBwZqOh19KQELbd%2FeILVFSsR6IbbxB7%2BNF3Oz1uxb5VmjB9p%2BQ1LFZyk2F8RZ6QWiTXrf%2BhNb6G%2BiDWVw%3D%3D&itemName=" + encodeResult + "&pageNo=1&startPage=1&numOfRows=1";

        try {
        	// XML 파서생성
    		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
    		DocumentBuilder builder = factory.newDocumentBuilder();
    		Document document = builder.parse(new URL(url).openStream());
        // API의 응답을 분석하고 NodeList 객체로 검색	
    	NodeList resultCodeList = document.getElementsByTagName("resultCode"); // 결과코드
    	NodeList pageNoList = document.getElementsByTagName("pageNo"); // /*페이지숫자*/
    	NodeList numOfRowsList = document.getElementsByTagName("numOfRows"); /*보여줄갯수*/
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
    	
    	// String 변수 는 여러요소의 값을 보유하도록 초기화됨.
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
    	
    	// entpNameList가 비어있지 않으면 for문을 실행
    	if(entpNameList.getLength() > 0) {
    		System.out.println("약 찾음-=="+resultCodeList.getLength());
    		// for문을 반복해서  Nodelist 요소를 반복하고 String 변수에 추출된 값을 추가해서 텍스트 콘텐츠를 추출
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

    			
    		}
    		
    		/* entpNameList가 비어있지 않은 경우, 각 정보에대해 추출된 정보를 model에 저장하고
    		의약품 정보 요소가 없으면 콘솔에 메시지를 출력하고 있다면 itemName에 리턴 */
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
    	
    	} else {
    		System.out.println("resultCode 요소를 찾을 수 없습니다");
    	}

        } catch(IOException e) {
    	e.printStackTrace(); 
    	}
        return "/hong/itemName";
    }
    
    // 의약품 업체 검색
    @RequestMapping("/resultByBusiness")
    public String searchentpname(@RequestParam("businessName") String businessName, Model model) throws IOException, ParserConfigurationException, SAXException {
        String baseUrl = "https://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList";
        String serviceKey = "MMbncKBwZqOh19KQELbd%2FeILVFSsR6IbbxB7%2BNF3Oz1uxb5VmjB9p%2BQ1LFZyk2F8RZ6QWiTXrf%2BhNb6G%2BiDWVw%3D%3D";

        // businessname을 기반으로 검색하기위해 fetchMedicinessearchentpname 메서드를 실행에 medicines 에 반환
        List<Medicine> medicines = fetchMedicinessearchentpname(baseUrl, serviceKey, businessName);

        // medicines 개체목록을 model 에 추가.
        model.addAttribute("medicines", medicines);
        // searchkeyword 속성을 entpname으로 설정해 업체명을 검색
        model.addAttribute("searchKeyword", "entpname");

        return "/hong/entpName";
    }
    
    // 실제로 검색을 수행하는 메서드, api 요청에 대한 url을 구성하고 api 에서 xml 응답을 구문분석.
    private List<Medicine> fetchMedicinessearchentpname(String baseUrl, String serviceKey, String businessName) throws IOException, ParserConfigurationException, SAXException {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();

        String url = baseUrl + "?serviceKey=" + serviceKey + "&entpName=" + URLEncoder.encode(businessName, "UTF-8") + "&pageNo=1&startPage=1&numOfRows=10";
        Document document = builder.parse(new URL(url).openStream());

        // itemName과 entpName 요소를 NodeList 개체로 검색.
        NodeList itemNameList = document.getElementsByTagName("itemName");
        NodeList entpNameList = document.getElementsByTagName("entpName");

        // Medicine 객체에 검색 결과를 보관
        List<Medicine> medicines = new ArrayList<>();

        // 반복문을 사용해서 두가지의 요소를 추출
        for (int i = 0; i < itemNameList.getLength(); i++) {
            Element itemNameElement = (Element) itemNameList.item(i);
            Element entpNameElement = (Element) entpNameList.item(i);

            String itemName = itemNameElement != null ? itemNameElement.getTextContent() : "";
            String entpName = entpNameElement != null ? entpNameElement.getTextContent() : "";
            
            // 추출된 정보를 medicine 에 저장.
            Medicine medicine = new Medicine(entpName, itemName);
            medicines.add(medicine);
        }

        return medicines;
    } 
    

	@RequestMapping("othertotal")
	public String othertotal(@RequestParam(defaultValue = "1") int page, Model model, String keyword) throws ParserConfigurationException, SAXException, MalformedURLException, IOException {
		
		final int rowpages = 21;	// 한페이지당 보여줄 행의 수
       
		String url = null;
		
		// keyword 가 null 이면 빈 문자열로 설정
		if(keyword == null) {
			keyword = "";
		}
	    int totalPages = 0;
	    
		// api 의 요청을 위한 url 구조 디버깅을 위해 url이 문자열로 변환되고 인쇄
		try {
			StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/1471000/QdrgPrdtPrmsnInfoService02/getQdrgPrdtPrmsnInfoInq02");
		    urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=MMbncKBwZqOh19KQELbd%2FeILVFSsR6IbbxB7%2BNF3Oz1uxb5VmjB9p%2BQ1LFZyk2F8RZ6QWiTXrf%2BhNb6G%2BiDWVw%3D%3D");
	        urlBuilder.append("&" + URLEncoder.encode("item_name","UTF-8") + "=" + URLEncoder.encode(keyword, "UTF-8")); // 제품명
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("20", "UTF-8")); // 보여줄 제품의 갯수
	        urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(page), "UTF-8"));
	        
	        int totalRows = otherTotalRows(urlBuilder); // 총 행 수 가져오기
	        
	        totalPages = (int) Math.ceil((double) totalRows / rowpages);

		    url = urlBuilder.toString();
		    System.out.println(url);
		    
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		List<String> ITEM_NAME_VALUES = new ArrayList<>();
	    List<String> EE_DOC_DATA_VALUES = new ArrayList<>();
	    List<String> UD_DOC_DATA_VALUES = new ArrayList<>();
	    List<String> NB_DOC_DATA_VALUES = new ArrayList<>();
	    List<String> ENTP_NAME_VALUES = new ArrayList<>();
	    

	    try {	// xml 파싱을 위한 객체를 생성
	        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	        DocumentBuilder builder = factory.newDocumentBuilder();
	        
	        // builder를 url 로부터 xml 데이터를 가져옴
	        Document document = builder.parse(new URL(url).openStream());
	        
	        // xml을 파싱해서 root와 itemNodeList의 목록을 가져오기
	        Element root = document.getDocumentElement();
	        NodeList itemNodeList = root.getElementsByTagName("item");

		    if (itemNodeList.getLength() > 0) {
		        for (int i = 0; i < itemNodeList.getLength(); i++) {
		            Element itemElement = (Element) itemNodeList.item(i);

		            String itemname = getTextContent(itemElement, "ITEM_NAME"); // product name
		            ITEM_NAME_VALUES.add(itemname);

		            String efcyQesitm = getTextContent(itemElement, "EE_DOC_DATA"); // efficacy effect
		            EE_DOC_DATA_VALUES.add(efcyQesitm);

		            String atpnQesitm = getTextContent(itemElement, "UD_DOC_DATA"); // usage capacity
		            UD_DOC_DATA_VALUES.add(atpnQesitm);

		            String intrcQesitm = getTextContent(itemElement, "NB_DOC_DATA"); // caution
		            NB_DOC_DATA_VALUES.add(intrcQesitm);

		            String entpName = getTextContent(itemElement, "ENTP_NAME"); // company name
		            ENTP_NAME_VALUES.add(entpName);
		        }
		    } else {
		        System.out.println("No result");
		    }
		    
	    // 모델에 결과 리스트 추가해서 otheritemName 로 반환
	    model.addAttribute("ITEM_NAME_VALUES", ITEM_NAME_VALUES);
	    model.addAttribute("EE_DOC_DATA_VALUES", EE_DOC_DATA_VALUES);
	    model.addAttribute("UD_DOC_DATA_VALUES", UD_DOC_DATA_VALUES);
	    model.addAttribute("NB_DOC_DATA_VALUES", NB_DOC_DATA_VALUES);
	    model.addAttribute("ENTP_NAME_VALUES", ENTP_NAME_VALUES);
	    model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

	    return "/hong/othernextPage";
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
			return "/hong/error";
		}
	}
	    private int otherTotalRows(StringBuilder urlBuilder) throws IOException, ParserConfigurationException, SAXException {
	    	// 파서 생성을 위한 새로운 객체 생성
	        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	        DocumentBuilder builder = factory.newDocumentBuilder();

	        // 요청할 API의 주소를 가져옴
	        String url = urlBuilder.toString();
	        
	        // API 요청을 보내고 XML 응답을 받아와서 document 객체로 파싱
	        Document document = builder.parse(new URL(url).openStream());

	        // 파싱된 데이터를 가지고 totalCount를 NodeList로 가져옴
	        NodeList totalCountList = document.getElementsByTagName("totalCount");
	        
	        // totalCount 의 첫번째 인덱스 번호를 가져옴
	        Element totalCountElement = (Element) totalCountList.item(0);
	        
	        // totalCount 의 텍스트 내용을 가져옴
	        String totalCountStr = totalCountElement.getTextContent();
	        
	        // 가져온 총행수를 int 형으로 변환
	        int totalCount = Integer.parseInt(totalCountStr);

	        // 총행수 반환
	        return totalCount;
	    }

	    // 3가지 매개변수 사용s
	    private List<Medicine> otherMedicines(String baseUrl, String serviceKey, int page) throws IOException, ParserConfigurationException, SAXException {
	    	
	    	// 새로운 builder 생성
	        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	        DocumentBuilder builder = factory.newDocumentBuilder();

	        // api에서 정보를 가져오기 위한 시작 행
	        int startRow = (page - 1) * ROWS_PER_PAGE + 1;
	        
	        //데이터 가져오는 url 구성
	        String url = baseUrl + "?serviceKey=" + serviceKey + "&itemName=&pageNo=" + page + "&startPage=" + startRow + "&numOfRows=" + ROWS_PER_PAGE;
	        // 그 데이터를 document에 구성
	        Document document = builder.parse(new URL(url).openStream());

	        // xml 응답에서 두가지 요소를 검색
	        NodeList itemNameList = document.getElementsByTagName("itemName");
	        NodeList entpNameList = document.getElementsByTagName("entpName");

	        List<Medicine> medicines = new ArrayList<>();

	        // 두가지 요소를 반복 검색, 추출
	        for (int i = 0; i < itemNameList.getLength(); i++) {
	            Element itemNameElement = (Element) itemNameList.item(i);
	            Element entpNameElement = (Element) entpNameList.item(i);

	            String itemName = itemNameElement != null ? itemNameElement.getTextContent() : "";
	            String entpName = entpNameElement != null ? entpNameElement.getTextContent() : "";

	            // 각각 새로운 medicine 객체를 생성하고 목록에 추가
	            Medicine medicine = new Medicine(entpName, itemName);
	            medicines.add(medicine);
	        }

	        return medicines;
	    }
	
	
	// api 내 중복 줄이는 메서드
	private String getTextContent(Element element, String tagName) {
		
		// nodelist 의 길이를 확인
		NodeList nodeList = element.getElementsByTagName(tagName);
		
		// nodelist의 길이 확인
	    if (nodeList.getLength() > 0) {
	    	
	    	// nodelist의 길이가 0보다 크면 element롤 가져옴.
	        Element tagElement = (Element) nodeList.item(0);
	        
	        // 가져온 element가 null 이 아니면 텍스트내용 추출
	        return tagElement != null ? tagElement.getTextContent() : "";
	    }
	    // 해당 내용이 없으면 빈 문자열 반환
	    return "";	
	}
	
	
	// 의약품 정보 가져오는곳, 결과 페이지
    @RequestMapping("otherresult")
    public String otherresult (@RequestParam(defaultValue = "1") int page, String keyword, Model model) {

    	String url = null;
    	
		if(keyword == null) {
			keyword = "";
		}

    	try {
			StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/1471000/QdrgPrdtPrmsnInfoService02/getQdrgPrdtPrmsnInfoInq02");
		    urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=MMbncKBwZqOh19KQELbd%2FeILVFSsR6IbbxB7%2BNF3Oz1uxb5VmjB9p%2BQ1LFZyk2F8RZ6QWiTXrf%2BhNb6G%2BiDWVw%3D%3D");
	        urlBuilder.append("&" + URLEncoder.encode("item_name","UTF-8") + "=" + URLEncoder.encode(keyword, "UTF-8")); // 제품명
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("20", "UTF-8")); // 보여줄 제품의 갯수
	        urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(page), "UTF-8")); // current page
	        
		    url = urlBuilder.toString();
		    
    	  } catch(UnsupportedEncodingException e) {
              e.printStackTrace();
          }

	    	
	    	// String 변수 는 여러요소의 값을 보유하도록 초기화됨.
    	 List<String> ITEM_NAME_VALUES = new ArrayList<>();
         List<String> EE_DOC_DATA_VALUES = new ArrayList<>();
         List<String> UD_DOC_DATA_VALUES = new ArrayList<>();
         List<String> NB_DOC_DATA_VALUES = new ArrayList<>();
         List<String> ENTP_NAME_VALUES = new ArrayList<>();
         
	    try {
	    	DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();

            // get builder xml data from url
            Document document = builder.parse(new URL(url).openStream());

            // Parse the xml to get the list of root and itemNodeList
            Element root = document.getDocumentElement();
            NodeList itemNodeList = root.getElementsByTagName("item");

            // Calculate the total number of drugs after parsing the xml data
    	
		// entpNameList가 비어있지 않으면 for문을 실행
   // 	if(itemNameList.getLength() > 0) {
		System.out.println("약 찾음-=="+itemNodeList.getLength());
		// for문을 반복해서  Nodelist 요소를 반복하고 String 변수에 추출된 값을 추가해서 텍스트 콘텐츠를 추출
		 for (int i = 0; i < itemNodeList.getLength(); i++) {
             Element itemElement = (Element) itemNodeList.item(i);

             String itemname = getTextContent(itemElement, "ITEM_NAME"); // product name
             ITEM_NAME_VALUES.add(itemname);

             String efcyQesitm = getTextContent(itemElement, "EE_DOC_DATA"); // efficacy effect
             EE_DOC_DATA_VALUES.add(efcyQesitm);

             String atpnQesitm = getTextContent(itemElement, "UD_DOC_DATA"); // usage capacity
             UD_DOC_DATA_VALUES.add(atpnQesitm);

             String intrcQesitm = getTextContent(itemElement, "NB_DOC_DATA"); // caution
             NB_DOC_DATA_VALUES.add(intrcQesitm);

             String entpName = getTextContent(itemElement, "ENTP_NAME"); // company name
             ENTP_NAME_VALUES.add(entpName);
         }
		
		 model.addAttribute("ITEM_NAME_VALUES", ITEM_NAME_VALUES);
         model.addAttribute("EE_DOC_DATA_VALUES", EE_DOC_DATA_VALUES);
         model.addAttribute("UD_DOC_DATA_VALUES", UD_DOC_DATA_VALUES);
         model.addAttribute("NB_DOC_DATA_VALUES", NB_DOC_DATA_VALUES);
         model.addAttribute("ENTP_NAME_VALUES", ENTP_NAME_VALUES);
       
    
         return "/hong/otheritemName";
         
        } catch (Exception e) {
            e.printStackTrace();
            return "/hong/error";
        }
    }
    	
    @Autowired
    private HongService hongService;
    
    @RequestMapping("safe")   
    public String safe(Model model, HongDTO dto) { // model객체와 dto 객체를 파라미터로 받음
       dto = hongService.getcontent(dto);   // hongservice를 통해 dto를 호출하며 dto에 넣고
       model.addAttribute("dto" , dto);   // model에 dto를 "dto" 라는 이름으로 저장해서 
       return "/hong/homesafe";   // homesafe 의 view 페이지로 전달
    }
    
    @RequestMapping("data")
    public String data(Model model) {
       // safe 메서드를 호출해서 dto 객체의 list를 가져옴
       List<HongDTO> list = hongService.safe();   
       
       // list 내부의 객체들을 getNum을 기준으로 오름차순으로 정렬
       list.sort((dto1, dto2) -> Integer.compare(dto1.getNum(), dto2.getNum()));
       
       // model 에 list를 "list" 의 이름으로 추가해서 dbsafe 로 전달
       model.addAttribute("list",list);
       return "/hong/dbsafe";
    }
    
    @RequestMapping("main")
    public String main(Model model) {
    	return "/hong/index";
    }
}