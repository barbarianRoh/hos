<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>병원이름으로 검색</title>
</head>
<body>
<%-- 2100589fb32df980773796dffa657449 --%>


<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:1200px;height:650px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2100589fb32df980773796dffa657449"></script>
<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.350701, 127.0016), // 지도의 중심좌표
        level: 13 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 
</script>

<form method = "post" name="hosselect" action="/hos/choo/hosinfo">
	<table width="500" height="100" border="1" cellspacing="0" cellpadding="0" align="center">
		<tr height="30">
			<td width="150" align="center">병원검색</td>
			<td width="100"><input type="text" size="50" maxlength="50" name="QN"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="검색"></td></tr>
	</table>
</form>

</body>
</html>