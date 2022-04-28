<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri = "http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel = "stylesheet" href="resources/css/sign_up.css?after">
    <title>sign_up</title>
    
    </style>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script>
  
    
    $(document).ready(function() {
    	$("#check_all").click(function() {
    		if($("#check_all").is(":checked")) $("input[name=check]").prop("checked", true);
    		else $("input[name=check]").prop("checked", false);
    	});

    	$("input[name=check]").click(function() {
    		var total = $("input[name=check]").length;
    		var checked = $("input[name=check]:checked").length;

    		if(total != checked) $("#check_all").prop("checked", false);
    		else $("#check_all").prop("checked", true); 
    	});
    });
   
    function namePopup() { window.open("idCheck.jsp", "a", "width=400, height=300, left=100, top=50"); }
    function idPopup() { window.open("nameCheck.jsp", "a", "width=400, height=300, left=100, top=50"); }
    
	</script>

</head>
	

<body>
    <div class = "header" >
            <ul class="logo" >
                <img src="resources/img/wtch_logo.png" alt="wtch_logo"  width= "104px" height= "52px"></a>
            </ul>
        <button class = "login" href="Login.jsp" style="text-decoration:none">로그인</button>
    </div>
    

<main class = "main">
    <img src = "resources/img/login_back.jpg" class = "back" > </img>

    <main class = "sign_up">
    <div class = "sign_up_2">
        <span class = "title">회원가입</span>
          
    </div> 
    <form class="form">
    
    <input placeholder="이름(2자 이상)" type="nickname" class = "nickname"/></p>
    <input type = "button" value = "중복확인" class = "button2" onclick="idPopup();"/>
    <input type = "button" value = "중복확인" class = "button1" onclick="namePopup();"/>
    <input placeholder="아이디" type="id" class = "userId"/></p>
   
    <input placeholder="이메일(example@gmail.com)" type="email" class = "email"/></p>
    <input placeholder="영문,숫자,특문 중 2개 조합 10자 이상" type="password" class = "password"/></p> 
    <input placeholder="생년월일(990101)" type="birth" class = "birthday"/></p>   
    <span class = "gender">성별
        <input type = "radio" class="male" name="gender" value="male"> 남자
		<input type = "radio" class="female" name="gender" value="female"> 여자 <br>
    </span>
    <form>
        <span class = "genre">선호하는 장르 선택</span>
        <select name = "favorite_genre1">
            <option value="none">=== 장르1 선택 ===</option>
            <option value="none">=== 장르1 선택 ===</option>
            <option value="none">=== 장르1 선택 ===</option>
            <option value="none">=== 장르1 선택 ===</option>
        </select> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        <select name = "favorite_genre2">
            <option value="none">=== 장르2 선택 ===</option>
            <option value="none">=== 장르2 선택 ===</option>
            <option value="none">=== 장르2 선택 ===</option>
            <option value="none">=== 장르2 선택 ===</option>
        </select><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        <select name = "favorite_genre3">
            <option value="none">=== 장르3 선택 ===</option>
            <option value="none">=== 장르3 선택 ===</option>
            <option value="none">=== 장르3 선택 ===</option>
            <option value="none">=== 장르3 선택 ===</option>
        </select>
    </div>
    </form>
    
     <div class = "sign_up_check" >
        <input type = "checkbox" id = "check_all"/> 전체 약관에 동의합니다 <br>
        <input type = "checkbox" name = "check"> 만 14세 이상입니다 <br>
        <input type = "checkbox" name = "check"> 왓챠피디아 서비스 이용약관에 동의합니다(필수) <br>
        <input type = "checkbox" name = "check"> 왓챠 서비스 이용약관에 동의합니다(필수) <br>
        <input type = "checkbox" name = "check"> 개인정보 수집 및 이용에 대한 안내에 동의합니다(필수) <br>
        <input type = "checkbox" name = "check"> 신작 알림 이벤트 정보 수신에 동의합니다(선택)
    </div>
    <div class="sign_up_btn" >
        <a class = "submit" href="Login.jsp" style="text-decoration:none"> 계정 생성하기 </a> <br>
        <br>
        
    </div>
    <p class="text">결제 정보요? 충분히 둘러보시고 입력해도 늦지 않아요</p>
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
</body>
</html>