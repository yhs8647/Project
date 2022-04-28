<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<!--jsp파일 내용 그대로 html로 옴긴 파일입니다.-->
<html>
<head>
	<link rel="stylesheet" href="resources/css/reset.css?after">
	<link rel="stylesheet" href="resources/css/header.css?after"> 
	<link rel="stylesheet" href="resources/css/footer.css?after"> 
	<link rel="stylesheet" href="resources/css/style.css?after"> 
	<link rel="stylesheet" href="resources/css/mypage.css?after">
	<link rel="stylesheet" href="resources/css/profile.css?after">
	<script src="resources/script/jquery.min.js"></script>
	
<style>
.updateinputNo{
	border:2px soild red;
	width:450px;
    height:60px;
    margin-bottom: 70px;
    font-size:35px;
    color:red;
    border-radius: 10px;
    padding-left: 20px;
}

.userbar{
	background-color:#141517;
	height:80px;
	padding-right:20px;
	text-align:right;	
	margin-top:-16px;
	padding:50px 50px 50px 50px;
}



.userbar img{
	border-radius:100%;
	width:32px;
	height:32px;
	color:#fff;
	transform:translate(0%,-15%);
}


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script>
	function count_ck(e){
		let chkbox = document.getElementsByName("Favorite_Genre");
		let count = 0;
		
		for(var i = 0; i < chkbox.length; i++){
			if(chkbox[i].checked){
				count++;
			}
		}
		if(count > 3){
			alert("장르는 최대 3개까지 선택 가능합니다.");
			e.checked = false;
			return false;
		}
	}	
</script>
	<div id = "root">
		<div class="content">
<header>
	<nav class="leftmenu">
		<a class="logolink" href="home.do">
			<img src="resources/img/logo.png" class="logoimg" >	
		</a>
		<section class="leftsction">
			<ul class="leftmenubuttonul">
				<li class="leftmenubuttonli">
					<a href="home.do">영상 보기</a>
				</li>
				<li class="leftmenubuttonli">
					<a href="search.do">검색</a>
				</li>
				<li class="leftmenubuttonli">
					<a href="getBoardList.do">게시판</a>
				</li>
				<li class="leftmenubuttonli">
					<a href="getNoticeList.do">공지사항</a>
				</li>
				<li class="leftmenubuttonli">
					<a href="mymovie.do">마이페이지</a>
					<li class="mypagesub">
                           <a href="profile.do" class="profilea"> 개인정보수정</a>
                    </li>
				</li>
				
				<!-- 관리자만 보이게 -->
				<c:set var="manager" value="${vo.manager}" />
				<c:if test="${manager == 2}">
					<li class="leftmenubuttonli">
						<a href="getTitleList.do">관리자페이지</a>
					</li>	
				</c:if>				
			</ul>
		</section>
	</nav>
</header>	
			
			<div class="userbar">
                <a href="logout.do">Logout</a>
            </div> 
			<main class="maincontent">
					<div class="update">
						<h1>개인정보수정</h1>
							<form action="profileupdate.do" id="profileupdate" method="post" onsubmit="return pawclick();">
								<div class="back">
								<table class="profileupdate">
									<tr class="updatetr">
										<td>
											<h2>아이디</h2>
										</td>
										<td>
											<input type="text" class="updateinput" value="${vo.userid }" disabled>
											<input type="hidden" name="userid" value="${vo.userid }">
										</td>
									</tr>
									<tr class="updatetr">
										<td>
											<h2>비밀번호</h2>
										</td>
										<td>
											<input type="password" name="clickpw" class="updateinput" id = "passwordinput">
										</td>
									</tr>
									<tr class="updatetr">
										<td>
											<h2>비밀번호변경</h2>
										</td>
										<td>
											<input type="password" class="updateinput" id = "password1">
										</td>
									</tr>
									<tr class="updatetr">
										<td>
											<h2>확 인</h2>
										</td>
										<td>
											<input type="password" name="password" class="updateinput" id = "password2">
										</td>
									</tr>
									<tr class="updatetr">
										<td>
											<h2>닉네임</h2>
										</td>
										<td>
											<input type="text" name="nickname" class="updateinput" value="${vo.nickname }" >
										</td>
									</tr>
									<tr class="updatetr">
										<td>
											<h2>생년월일</h2>
										</td>
										<td>
											<input type="date" name="birthday" value="${vo.birthday }" min = "1900-01-01" class="updatedate" disabled>
										</td>
									</tr>
									<tr class="updatetr">
										<td>
											<h2>이메일</h2>
										</td>
										<td>
											<input type="text" name="email" class="updateinput" value="${vo.email }">
										</td>
									</tr>
									<tr class="updatetr">
										<td>
											<h2>선호 장르</h2>
										</td>
										<td class="checkboxtd">
											<label><input type="checkbox" name="Favorite_Genre" onclick="count_ck(this)" value="1" <c:if test="${fn:contains(Favorite,1) }" >checked</c:if>>장르1</label>&nbsp;&nbsp;&nbsp;&nbsp; <label><input type="checkbox" name="Favorite_Genre" onclick="count_ck(this)" value="2" <c:if test="${fn:contains(Favorite,2) }" >checked</c:if>>장르2</label>&nbsp;&nbsp;&nbsp;&nbsp; <label><input type="checkbox" name="Favorite_Genre" onclick="count_ck(this)" value="3" <c:if test="${fn:contains(Favorite,3) }" >checked</c:if>>장르3</label><br><br>
											<label><input type="checkbox" name="Favorite_Genre" onclick="count_ck(this)" value="4" <c:if test="${fn:contains(Favorite,4) }" >checked</c:if>>장르4</label>&nbsp;&nbsp;&nbsp;&nbsp; <label><input type="checkbox" name="Favorite_Genre" onclick="count_ck(this)" value="5" <c:if test="${fn:contains(Favorite,5) }" >checked</c:if>>장르5</label>&nbsp;&nbsp;&nbsp;&nbsp; <label><input type="checkbox" name="Favorite_Genre" onclick="count_ck(this)" value="6" <c:if test="${fn:contains(Favorite,6) }" >checked</c:if>>장르6</label><br><br>
										</td>
									</tr>
								</table>
								
							</div>
							<div class="submitbt">
								<input type="submit" value="수정완료">
							</div>	
						</form>
						<div class="submitbt">
							<input type="submit" value="회원탈퇴" onclick="leavepop()">
						</div>	
					</div>
			</main>	
			</div>
			<%@ include file="/WEB-INF/views/includes/footer.jsp" %>	
	</div>
	<script>
		var vopassword = '${vo.password}'
		var password;
		var password1;
		var password2;
		
	$('#passwordinput').on("propertychange change keyup paste input", function(){
		password = $(this).val();

		
		if(password!=vopassword){
			document.querySelector("#passwordinput").className="updateinputNo";
		}else if(password==vopassword){
			document.querySelector("#passwordinput").className="updateinput";
		}
	})
		
	$('#password1').on("propertychange change keyup paste input", function(){
		password1 = $(this).val();	
	});
	$('#password2').on("propertychange change keyup paste input", function(){
		password2 = $(this).val();
		
		if(password1!=password2){
			document.querySelector("#password2").className="updateinputNo";
		}else if(password1==password2){
			document.querySelector("#password2").className="updateinput";
		}	
	});


    function leavepop(){
        window.open("leavepop.do","leavepop","width=400,height=341px,top=10,left=10");
    }
	
	function pawclick(){
		if(vopassword!=password){
			alert("기존 비밀번호가 일치하지 않습니다.");
			return false;
		}else if(password1!=password2){
			alert("변경된 비밀번호가 일치하지 않습니다.")
			return false;
		}
	}

	</script>
</body>
</html>