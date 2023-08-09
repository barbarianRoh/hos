<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>병원이름으로 검색</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
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

<div class="d-flex justify-content-center">
<form method = "get" name="hosselect" action="/hos/choo/hosinfo">
	<table width="500" cellspacing="0" cellpadding="0">
		<tr height="30">
			<td>
				<div class="input-group mb-2">
					<span class="input-group-text" id="basic-addon1" style="width:80px;">병원이름</span>
					<input type="text" class="form-control" placeholder="병원이름을 입력해주세요" name="QN" aria-describedby="basic-addon1">
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input class="btn btn-primary" type="submit" value="검색"></td></tr>
	</table>
</form>
</div>
</body>
</html>