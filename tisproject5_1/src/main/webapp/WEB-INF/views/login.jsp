<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
	<script type="text/javascript" src="resources/script/login.js" ></script>
	<link href = "resources/css/Login.css" rel = "stylesheet"/>
</head>

<body>
	 <script src = "app.js"></script>

    <div class = "header" >
            <ul class="logo" >
                <a href="index.do">
                	<img src="resources/img/wtch_logo.png" alt="wtch_logo"  width= "104px" height= "52px">
                </a>
            </ul>
        <ul class = "sign_up"  style="text-decoration:none"><a href="sign_up.do">회원가입</a></ul>
    </div>

<main class = main>
    <img src = "resources/img/login_back.jpg" class = "back" ></img>

    <main class = "login">
    <div class = "login_2">
        <span class = "title" >로그인</span>
        <a class = "forgotPwd" href = "forgot_pw.jsp" style="text-decoration:none">비밀번호를 잊어버리셨나요?</a>
           
    </div> 
    <form class="form" id="logfrm" action="login.do" method="post" name="form1">
        <input placeholder="아이디" type="text" class="userid" name="userid"/></p>
        <input placeholder="비밀번호" type="password" class = "pwd" name="password"/></p>       
    
    <div class="login_btn">	<!-- home.do -->
        <a class = "#" href="#" style="text-decoration:none" onclick="logfrm()">
        	<input type="button" name="btn1" value="로그인" />  
        </a> 
    </div>
    </form>
   
    <div class = "oth_login"> 다른 방법으로 로그인 하기 
        <ul class = "other">
            <li class="kakao">
                <img class="kakao" src = "resources/img/kakao.png"></img>
            </li>
            <li class="google">
                <img class="google" type="button" src = "resources/img/google.png"></img>
            </li>
            <li class="face">
                <img class="face" type="button"  src = "resources/img/face.png"></img>
            </li>
            <li class="twitter">
                <img class="twitter" type="button" src = "resources/img/twitter.png"></img>
            </li>
            <li class="apple">
                <img class="apple" type="button" src = "resources/img/apple.png"></img>
            </li>
            <li class="line">
                <img class="line" type="button" src = "resources/img/line.png"></img>
            </li>
        </ul>
    </div>
</main>

<footer>
    <span class="top">
        <a>고객센터(이용 및 결제 문의) cs@watcha.co.kr </a> &nbsp;&nbsp;
    </span>
    <span>  •  </span>
    "02-515-9985 (유료)"
    &nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;
    "제휴 및 대외 협력"  &nbsp;&nbsp;
    <a>http://watcha.team/contact </a> <br>
    <span class="bottom">
        <a>주식회사 왓챠 / 대표 박태훈 / 서울특별시 서초구 강남대로 343 신덕빌딩 3층 / 사업자 등록번호 211-88-66013 
        / 통신판매업 신고번호 제 2019-서울서초-0965호 / 대표번호 02-515-9985 / 개인정보 처리 방침 / 청소년 보호정책
    </a></span>
</footer>

<script>
function logfrm(){
	document.getElementById('logfrm').submit();
}

function singupfrm(){
	document.getElementById('singupfrm').submit();
}
</script>
</body>
</html>