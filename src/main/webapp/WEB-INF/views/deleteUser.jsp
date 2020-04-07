<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>DeleteUserPage</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#backBtn").click(function(){
			window.location.replace("moveTodo");
		})
		
		$("#deleteBtn").click(function(){
			var userPw = $("#userPw").val();
			if(userPw == ''){
				alert("비밀번호를 입력해주세요");
				return false;
			}
			deletePageSelectUser();
		})
	})
	
	function deletePageSelectUser(){
		$.ajax({
			url : "deletePageSelectUser"
			,type : "post"
			,data : {
				userPw : $("#userPw").val()
			}
			,success:function(result){
				if(result == 'success'){
					deleteCheck();
				}else{
					alert("비밀번호가 틀렸습니다.");
					return false;
				}
			}
			
		})
	}
	
	function deleteCheck(){
		var result = confirm("정말로 탈퇴하시겠습니까?");
		if(result){
			deleteUser();
		}
	}
	
	function deleteUser(){
		$.ajax({
			url : "deleteUser"
			,type : "post"
			,success:function(result){
				if(result == 'success'){
					alert("회원탈퇴 성공!!");
					window.location.replace("logout");
				}else{
					alert("회원탈퇴 실패!!");
				}
			}
			
		})
	}
	
</script>

</head>
<body>
	<fieldset>
	<legend><h2>회원탈퇴</h2></legend>
		<label>비밀번호 : <input type="password" id="userPw" ></label><br>
		<input type="button" id="deleteBtn" value="탈퇴하기">&nbsp;&nbsp;
		<input type="button" id="backBtn" value="돌아가기" >
	</fieldset>

</body>
</html>