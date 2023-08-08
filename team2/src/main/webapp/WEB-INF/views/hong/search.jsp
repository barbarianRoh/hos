<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="javax.servlet.ServletContext" %>
<%@ page import="com.team2.controller.DataApiClient" %>
<html>
<head>
    <title>Search page</title>
    <link rel="stlesheet" href="htps://"maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script type="text/javascript">
    
    function searchItemName() {
        var keyword = document.getElementById('keyword').value;
        if (!keyword.trim()) {
            alert('제품명을 다시 입력하세요.');
            return false;
        }else{
        	return true;	
     	}
    }

    function searchEntpName() {
        var businessName = document.getElementById('businessName').value;
        if (!businessName.trim()) {
            alert('업체명을 입력하세요.');
            return false;
        }else{
 	       return true;    	
        }
    }

    function searchOtherItemName() {
        var keyword2 = document.getElementById('keyword2').value;
        if (!keyword2.trim()) {
            alert('의약외품명을 입력하세요.');
            return false;
        }else{
        	return true;
        }
    }
    </script>
    
</head>
<body>
	<div class="container">
	    <h2>의약품 이름 검색</h2>
	    <form class="form-inline" method="GET" action="result" onsubmit="return searchItemName()">
		    <div class="form-group">
		        <input type="text" class="form-control" name="keyword" id="keyword" placeholder="제품명을 입력 하세요" />
		        <input type="submit" value="Search" />
		    </div>
	    </form>
	
	    <h2>의약품 업체 이름 검색</h2>
	    <form class="form-inline" method="GET" action="resultByBusiness" onsubmit="return searchEntpName()">
		    <div class="form-group">
		        <input type="text" class="form-control" name="businessName" id="businessName" placeholder="업체명을 입력하세요" />
		        <input type="submit" value="Search" />
		    </div>
	    </form>
	    
	    <br>
	    
	    <h2>의약외품 이름 검색</h2>
	    <form class="form-inline" method="GET" action="otherresult" onsubmit="return searchOtherItemName()">
		    <div class="form-group">
		        <input type="text" class="form-control" name="keyword2" id="keyword2" placeholder="제품명을 입력 하세요" />
		        <input type="submit" value="Search" />
		    </div>
	    </form>
	
		<form method="GET" action="data">
			<input type="button" class="btn btn-secondary" value="안전상비약" onclick="location.href='data'"> 
		</form>
	</div>
</body>
</html>