
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CreatePage</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	checkId = false; //전역변수
	$(function(){
		$("#moveLoginBtn").click(function(){
			window.location.replace("moveLogin");
		})
		
		$("#checkBtn").click(function(){
			var userId  = $("#Id").val();
			if(userId.length < 2){
				alert("아이디 형식에 맞추어서 입력해주세요");
				return false;
			}else{
				checkUserId();
			}
		})
		
		$("#Id").change(function(){
			checkId = false;
		})
		
		$("#createBtn").click(function(){
			var userId  = $("#Id").val();
			var userPw = $("#Pw").val();
			var userPw2 = $("#Pw2").val();
			
			var userName = $("#Name").val();
			if(userId.length < 2){
				alert("아이디는 2~15자리입니다.");
				return false;
			}
			if(userPw.length < 2){
				alert("비밀번호는 2~20자리입니다.");
				return false;
			}
			if(userPw2.length == 0 ){
				alert("비밀번호확인에 입력해주세요");
				return false;
			}
			if(userPw2 != userPw){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			if(userName.length <= 0){
				alert("이름을 입력해주세요");
				return false;
			}
			if(checkId==true){
				$("#createForm").submit();
			}else{
				alert("아이디 중복확인을 해주세요");
			}
		})
	})	
	
	function checkUserId(){
			var userId  = $("#Id").val();
			$.ajax({
				url : "checkUserId"
				,type : "get"
				,data : {
					userId : userId
				}
				,success:function(result){
					if(result == 'success'){
						alert("사용가능한 아이디입니다.");
						checkId= true;
					}else{
						alert("이미 존재하는 아이디입니다.");
						return false;
					}
				}
			})
		}
	
	
</script>

</head>
<body>
	<form id="createForm" action="createAccount" method="post" >
	<fieldset>
		<legend><h2>회원가입</h2></legend>
		<label>아이디 : <input type="text" name="userId" id="Id" minlength="2" maxlength="15" required  > </label>
		<input type="button" value="중복확인" id="checkBtn"  > <br>
		<label>비밀번호 : <input type="password" id="Pw" name="userPw" minlength="2" maxlength="20"  required > </label><br>
		<label>비밀번호 확인 : <input type="password" id="Pw2" maxlength="20"  required > </label><br>
		<label>이름 : <input type="text" id="Name" name="userName"  required >  </label><br>
		<input type="button" value="가입" id="createBtn"  >
		<button type="button" id="moveLoginBtn">뒤로가기</button>
	</fieldset>
	</form>

</body>
</html>