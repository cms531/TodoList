<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>search user</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#backBtn").click(function(){
			window.location.replace("moveLogin");
		})
		
		$(document).on("click","#backWindow",function(){
			location.reload();
		})
		
		
		$("#searchBtn").click(function(){
			var userId = $("#userId").val();
			var userName = $("#userName").val();
			if(userId == ""){
				alert("아이디를 입력해주세요");
				return false;
			}
			if(userName == ""){
				alert(" 이름을 입력해주세요");
				return false;
			}
			searchUser();
		})
		
		$(document).on('click','#updateBtn',function(){
			var userPw = $("#userPw").val();
			var userPw2 = $("#userPw2").val();
			if(userPw.length < 2){
				alert("비밀번호는 2자리 이상 입력해주세요");
				return false;
			}
			if(userPw2 == ""){
				alert("비밀번호 확인을 입력해주세요");
				return false;
			}
			if(userPw != userPw2){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			$("#updatePwForm").submit();
		})
		
	})
	
	
	function searchUser(){
		$.ajax({
			url : "searchUser"
			,type : "post"
			,data : {
				userId : $("#userId").val()
				,userName : $("#userName").val()
			}
			,success:function(result){
				if(result != ""){
					$("#first").html("");
					printNewPw(result);
				}else{
					alert("입력정보가 틀렸거나 존재하지 않는 아이디 입니다.");
				}
				
			}
		})
	}
	
	function printNewPw(result){
		var str = "";
		str += "<fieldset>";
		str += "<legend><h2>비밀번호 변경</h2> </legend>";
		str += "<form id='updatePwForm' action='updatePw' method='post' >";
		str += "새 비밀번호 : <input type='password' name='userPw'  id='userPw' maxlength='20' ><br>";
		str += "비밀번호 확인 : <input type='password' id='userPw2' maxlength='20' ><br>";
		str += "<input type='hidden' value='"+result.userId+"' name='userId' >";
		str += "<input type= 'button' value='비밀번호 변경' id='updateBtn'>&nbsp;&nbsp;";
		str += "<input type= 'button' value='변경취소' id='backWindow'>";
		str +="</form>"
		str += "</fieldset>";
		$("#two").html(str);
	}

</script>
</head>
<body>
<div id="first">
	<fieldset>
	<legend><h2>비밀번호 찾기</h2> </legend>
	<form id="searchForm" action="searchUser" method="post">
		<label>아이디 : <input type="text" name="userId" id="userId" required ></label><br>
		<label>이름 : <input type="text" name="userName" id="userName" required ></label><br>
		<input type="button" value="비밀번호 찾기" id="searchBtn" >
		<input type="button" value="돌아가기" id="backBtn" >
	</form>
	</fieldset>
</div>
<div id="two">
</div>

</body>
</html>