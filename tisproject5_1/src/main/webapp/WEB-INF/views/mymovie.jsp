<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--jsp파일 내용 그대로 html로 옴긴 파일입니다.-->
<html>
<head>
	<link rel="stylesheet" href="resources/css/style.css?after"> 
	<link rel="stylesheet" href="resources/css/mymovie.css?after"> 
    <link rel="stylesheet" href="resources/css/mypage.css?after">
<style>
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
	margin:0;
}

</style>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    </head>
    <body>
    <script src="resources/script/jquery.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="resources/script/mymovie.js" defer></script>
        <div id = "root">
<!--             <div class="popupback">
                <div class="window">
                    <div class="popup">
                        <section class="popuptitlebox">
                            <h3 class="popuptitle">이용권을 선택해주세요</h3>
                            <h4 class="popuptitle">언제든지 해지할 수 있고, 무료 이용 기간에는 과금이 되지 않습니다. </h4>
                            <p class="popuptitle">단, 무료이용기간이 지난뒤에는 자동으로 결제됩니다.</p>
                                <ul class="popupcontent">
                                  <li class="popupcontentli"></li>
                                  <li class="popupcontentli">월 요금</li>
                                  <li class="popupcontentli">동시 재생이 가능한 수</li>
                                  <li class="popupcontentli">지원하는 최대 화질</li>
                                  <li class="popupcontentli">HDR 10+의 선명한 화질</li>
                                  <li class="popupcontentli">저장 가능한 다운로드 영상 수</li>
                                  <li class="popupcontentli">TV, 폰, 태블릿, PC에서 재생</li>
                                </ul>  
		                            <div class="popupbutton">
			                            <form action="Rankup.do" method="post">
			                                <button id="check_module">결제완료</button></form><button id="closepop">창 닫기</button>
		                            </div>    
                            </section>
                    </div>
                </div>
            </div> -->
            <div class="content">
<!--                 <header>
                    <nav class="leftmenu">
                        <a class="logolink" href="#">
                            <img src="resources/img/logo.png" class="logoimg" >	
                        </a>
<section class="leftsction">
         <ul class="leftmenubuttonul">
            <li class="leftmenubuttonli">
               <a href="home.do">영상 보기</a>
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
            <li class="leftmenubuttonli">
               <a href="#">관리자페이지</a>
            </li>               
         </ul>
      </section>
				</nav>
			</header> -->
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
                <table class="lockerbox">
                    <tr>
                        <th colspan="5"><h1>추천영상</h1></th>
                    </tr>
                    <tr>
                    	<c:forEach items="${TitleVO }" var ="titleVO">
                           	<td><a href="videoInfo.do?titleNo=${titleVO.titleNo}"><img src='${titleVO.poster}'></a></td> 
                    	</c:forEach>
                    </tr>
                </table>
                <table class="lockerbox">
                    <tr>
                        <th colspan="5"><h1>내 보관함 </h1></th>
                    </tr>
                    <tr>
                        <c:forEach items="${TitleVO2 }" var ="titleVO2">
                       		<td><a href="videoInfo.do?titleNo=${titleVO2.titleNo }">
                       		<img src='${titleVO2.poster}'></a></td> 
                    	</c:forEach>
                    </tr>
                </table>
			</main>		
		</div>
		<footer>
			<nav class="footbar">
                <div class="money">
				    <h5>첫 2주 무료체험 이벤트! 모든 작품, 무제한 감상하세요. 마음에 들지 않으면 클릭 한 번으로 언제든 해지할 수 있어요</h5>
                    <button id="payment">결제하기</button> <button id="close">닫 기</button> 
                </div>    
			</nav>
		</footer>
	</div>
	<script>

/*     function payment(){
    	if(${vo.rank}!=1){
        	document.querySelector(".popupback").className="popupback show";
    
        	//혹시나 중복결제 방지
    	}else{
    		alert("이미 결제가 완료되었습니다.");
    		document.querySelector(".footbar").className="footbar off";
    	}
    } */

    function closepop(){
        document.querySelector(".popupback").className="popupback";
    }

    function close(){
        document.querySelector(".footbar").className="footbar off";
    }
    


    
    //이미 결제한 유저는 결제 팝업창이 뜨지 않음
	if(${vo.rank}==1){
		close()
	}

	/* document.querySelector("#payment").addEventListener("click",payment); */
    document.querySelector("#close").addEventListener("click", close);
    document.querySelector("#closepop").addEventListener("click",closepop);
    document.querySelector("#payment").addEventListener("click",close);
	
	</script>
</body>

</html>
