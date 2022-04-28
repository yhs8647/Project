<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="resources/css/headerManager.css?after"> 
	<link rel="stylesheet" href="resources/css/footer.css?after"> 
	<link rel="stylesheet" href="resources/css/reset.css?after"> 
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script src="resources/script/footer.js" defer></script>
<style>
.content {
	padding:0 0 0 240px;
	height:100%;
	margin:0 0 0 0;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id = "root">
		<div class="content" >
			<%@ include file="/WEB-INF/views/includes/headerManager.jsp" %>
			<div class="maincontent">
				<main>
				<!-- <h1>관리자 페이지</h1>
				
				<h2><a href="getTitleList.do">영상 관리</a></h2>
				<h2><a href="getItem.do">항목 관리</a></h2>
				<h2><a href="getNoticeList.do">공지사항 관리</a></h2>
				<h2><a href="getUserList.do">회원 정보 관리</a></h2> -->
				
				</main>
			</div>
			<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
		</div>
		
	</div>
</body>
</html>