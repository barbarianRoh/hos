<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${chack == 0}">
	<script>
		alert('비밀번호가 맞지 않습니다');
		history.go(-1);
	</script>
</c:if>

<c:if test="${chack == 1}">
	<script>
		alert('수정되었습니다');
		location.href="/hos/choo/hosgrade?name=${name}&addr=${addr}&pageNum=${pageNum}"
	</script>
</c:if>