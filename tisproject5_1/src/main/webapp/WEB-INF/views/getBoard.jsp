<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세보기</title>
<!-- ?after을 붙이면 프로젝트 내에서 css가 변경된 것을 적용시킨다. -->
<link rel="stylesheet" href="resources/css/reset.css?after">
<link rel="stylesheet" href="resources/css/header.css?after"> 
<link rel="stylesheet" href="resources/css/footer.css?after"> 
<link href="resources/css/getBoard.css?atter" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/script/replyJs.js" ></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="resources/script/footer.js" defer></script>
</head>
<body>
	  <div id="root">
      <div class="content">
        <!-- include header -->
        <%@ include file="includes/header.jsp" %>
        <main class="maincontent">
          <div id="btn_detail">
            <!-- 세션 아이디와 글을 작성한 DB의 id가 같을 시 수정 가능하게 한다. -->
            <c:set var="userid" value="${sessionScope.nickname}" />
            <a class="insert" href="insertBoard.jsp">게시물 등록</a>
            &nbsp;&nbsp;
            <c:if test="${userid == board.writer}">
              <a class="modify" href="modifyBoard.jsp">게시물 수정</a>
              &nbsp;&nbsp;
              <a class="delete" href="deleteBoard.do?bno=${board.bno}">게시물 삭제</a>
            </c:if>
            
            <!--  Test  -->
            <%-- <a class="insert" href="insertBoard.jsp">게시물 등록</a>
            &nbsp;&nbsp;
            <a class="modify" href="modifyBoard.jsp">게시물 수정</a>
            &nbsp;&nbsp;
            <a class="delete" href="deleteBoard.do?bno=${board.bno}">게시물 삭제</a> --%>
            
          </div>

          <div id="selectBoard">
            <table id="board_detail">
              <tr class="firstBoard">
                <%-- <th>제목</th>
                <td class="title">${board.title}</td> --%>
                <th colspan="4" class="title">${board.title}</th>
                
              </tr>
              <tr class="secondBoard">
                <th>작성자</th>
                <td colspan="3">${board.writer}</td>
              </tr>
              <tr class="thirdBoard">
                <!-- <th>내용</th> -->
                <td colspan="4">${board.content}<br><br><br><img src="${board.bFile }"></td>
              </tr>
              <tr class="fourthBoard">
                <th>등록일</th>
                <td ><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd" /></td>
                <th>조회수</th>
                <td class="cnt">${board.cnt}</td>
              </tr>
            </table>
            <br><br>
            <!-- 댓글 시작 -->
            <div class="reply-box">
              <h3 class="reply-header">댓글</h3>
              <div class="reply-body">
                  <ul class="reply-comments"></ul>
                  <div class="form-group">
                    <input class ="reply_bno" type="hidden" name="bno" value="${board.bno}" />
                    <input class ="replyer" type="hidden" name="replyer" value="${sessionScope.user}" />
                    <textarea class="replyContent" placeholder="댓글을 입력해 주세요." name="content" rows="3" ></textarea>
                  </div>
                  <br>
                  <button type="button" class="insertReply-btn">댓글 작성</button>
                  <!-- 수정 시 댓글 작성이 댓글 수정 완료 버튼으로 바뀐다. -->
                  <input type='hidden' class='updateComplete' value='댓글 수정완료' name='rno' /> <!-- onclick='updateContent()' -->
              </div>
            </div>
            <!-- 댓글 끝 -->
            <a href="getBoardList.do" class="list">글 목록</a>
          </div>
        </main>
        <!-- footer -->
      <%@ include file="includes/footer.jsp" %>
      </div>
      
    </div>
</body>
</html>