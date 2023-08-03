<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="javax.servlet.ServletContext" %>
<%@ page import="com.team2.controller.DataApiClient" %>
<html>
<head>
    <title>Search page</title>
    <script type="text/javascript">
    function searchItemName() {
        var keyword = document.getElementById('keyword').value;
        if (!keyword.trim()) {
            alert('제품명을 다시 입력하세요.');
            return false;
        }else{
        	if(keyword !== 'keyword'){
			alert('의약품이 아닙니다.');
			return false;
        	}else{
        		if(keyword === 'keyword'){
        			return true;	
        		}
        	}
        }
    }
    
    /*     function searchItemName() {
		var keyword = document.getElementById('keyword').value;
		if(keyword === "") {
			alert('약품 이름을 검색 해주세요.');
			window.location.href = "/hos/hong/search";
			return false;
    		}else if(!keyword) {
    				alert('다시 입력 해주세요.');
    				window.location.href = "/hos/hong/search";
    				return false;
    			}else{
    			return true;
    			}
    		} */

    function searchEntpName() {
        var businessName = document.getElementById('businessName').value;
        if (!businessName.trim()) {
            alert('업체명을 입력하세요.');
            return false;
        }
        return true;
    }

    function searchOtherItemName() {
        var keyword2 = document.getElementById('keyword2').value;
        if (!keyword2.trim()) {
            alert('의약외품명을 입력하세요.');
            return false;
        }
        return true;
    }
    </script>
    
</head>
<body>
    <h2>의약품 이름 검색</h2>
    <form method="GET" action="result" onsubmit="return searchItemName()">
        <input type="text" name="keyword" id="keyword" placeholder="제품명을 입력 하세요" />
        <input type="submit" value="Search" />
    </form>

    <h2>의약품 업체 이름 검색</h2>
    <form method="GET" action="resultByBusiness" onsubmit="return searchEntpName()">
        <input type="text" name="businessName" id="businessName" placeholder="업체명을 입력하세요" />
        <input type="submit" value="Search" />
    </form>
    
    <br>
    
    <h2>의약외품 이름 검색</h2>
    <form method="GET" action="otherresult" onsubmit="return searchOtherItemName()">
        <input type="text" name="keyword2" id="keyword2" placeholder="제품명을 입력 하세요" />
        <input type="submit" value="Search" />
    </form>

	<form method="GET" action="data">
		<input type="button" value="안전상비약" onclick="location.href='data'"> 
	</form>
</body>
</html>