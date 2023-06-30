<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<script>
var xhr = new XMLHttpRequest();
var url = 'http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyListInfoInqire'; /*URL*/
var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'4c%2BBa%2BaPJxSbLQnLM24kicpVPXAEBmsK1V5nqbo7d6AJ4VRKUVVz8vKzYaRLTJFVaHWJ9IUKmf9L01QnZeCEig%3D%3D'; /*Service Key*/
queryParams += '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울특별시'); /**/
queryParams += '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('강남구'); /**/
queryParams += '&' + encodeURIComponent('QT') + '=' + encodeURIComponent('1'); /**/
queryParams += '&' + encodeURIComponent('QN') + '=' + encodeURIComponent('삼성약국'); /**/
queryParams += '&' + encodeURIComponent('ORD') + '=' + encodeURIComponent('NAME'); /**/
queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /**/
xhr.open('GET', url + queryParams);
xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
    }
};

xhr.send('');
</script>