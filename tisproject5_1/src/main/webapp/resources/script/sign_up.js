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
   
//    function namePopup() { window.open("nameCheck.jsp", "a", "width=400, height=300, left=100, top=50"); }
//    function idPopup() { window.open("idCheck.jsp", "a", "width=400, height=300, left=100, top=50"); }
    
   
    function gender(){
        f=document.writeForm;
        var check1=document.gender.checked;
        
        if(!check1){
            alert("개인 정보 수집정책에 동의 해주세요");
            return;
        }
        f.action="_.php";
        f.submit();
     
    }


//    function sign_up_btn(){
//
//    	 var pw = $("#password").val();
//    	 var num = pw.search(/[0-9]/g);
//    	 var eng = pw.search(/[a-z]/ig);
//    	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
//
//    	 if(pw.length < 10 || pw.length > 20){
//    	  alert("10자리 ~ 20자리 이내로 입력해주세요.");
//    	  return false;
//    	  
//    	 }else if(pw.search(/\s/) != -1){
//    	  alert("비밀번호는 공백 없이 입력해주세요.");
//    	  return false;
//    	  
//    	 }else if(num < 0 || eng < 0 || spe < 0 ){
//    	  alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
//    	  return false;
//    	  
//    	 }else {
//    		console.log("통과"); 
//    	    return true;
//    	 }
//
//    	}
    

    $(document).ready(function(){
		
		$("#clifrm").on("click", function(){
			if($("#nickname").val()==""){
				alert("닉네임을 입력해주세요.");
				$("#nickname").focus();
				return false;
			}
			if($("#userId").val()==""){
				alert("아이디를 입력해주세요.");
				$("#userId").focus();
				return false;
			}
			if($("#email").val()==""){
				alert("이메일을 입력해주세요.");
				$("#email").focus();
				return false;
			}
			if($("#password").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#password").focus();
				return false;
			}
			if($("#birthday").val()==""){
				alert("생일을 입력해주세요.");
				$("#birthday").focus();
				return false;
			}
			
			if(!$("input:checked[id = 'm']").is(":checked")){ alert("성별을 체크해주세요."); $("#gender").focus(); return; }
			if(!$("input:checked[id = 'm']").is(":checked")){ alert("성별을 체크해주세요."); $("#gender").focus(); return; }
			
			
			
			var nameCheckResult = $("#nameCheck").val();
			if(nameCheckResult == "1"){
				alert("닉네임 중복확인 버튼을 눌러주세요.");
				return false;
			}else if(nameCheckResult == "0"){
				$("#regForm").submit();

			}
			
			var idCheckResult = $("#idCheck").val();
			if(idCheckResult == "1"){
				alert("아이디 중복확인 버튼을 눌러주세요.");
				return false;
			}else if(idCheckResult == "0"){
				$("#regForm").submit();

			}
			
 
			
		});
		function Checkpw(){
			var pw = $("#password").val();
			if (!/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$/.test(pw)){
				alert ("비밀번호를 확인해주세요.");
				return false;
			} else {
				console.log("비번 통과")
			}
		}
		
		
		
		//이름 중복  (아이디 중복일 경우 = 1 , 중복이 아닐경우 = 0)
		$("#nameCheck").click(function() {
			
			var result = 0; 
			var nickname =  $("#nickname").val(); 
			var param = {"nickname": nickname};
			
			console.log(nickname);
			
			$.ajax({
				type : "POST",
				url : "/nameCheck.do",
				contentType:"application/json; charset=utf-8",
				dataType : "json",
				data :  JSON.stringify(param),
				success : function(data){
					if(data.result == 0){ 
						alert("사용가능한 닉네임입니다.");
						console.log("노중복");
					}else{
						/* $("#nameCheck").attr("data.result", "1"); */
						alert("중복된 닉네임입니다.");
						console.log("중복");
					}
				},
	            error:function(){
	                alert("에러");
	            }
			});
		});
		
		
		//아이디 중복
		$("#idCheck").click(function() {
			
			var result = 0;
			var userId =  $("#userId").val(); 
			var param = {"userid": userId};
			
			console.log(userId);
			
			$.ajax({
				type : "POST",
				url : "/idCheck.do",
				contentType:"application/json; charset=utf-8",
				dataType : "json",
				data :  JSON.stringify(param),
				success : function(data){
					if(data.result == 0){
						alert("사용가능한 아이디입니다.");
						console.log("노중복");
					}else {
						/* $("#idCheck").attr("result", "1"); */
						alert("중복된 아이디입니다.");
						console.log("중복");	
					}
				}
			});
		});
		
	})

	
    
    function clifrm(){
    	document.getElementById('regForm').submit();
    } 