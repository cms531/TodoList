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
				alert("��й�ȣ�� �Է����ּ���");
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
					alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
					return false;
				}
			}
			
		})
	}
	
	function deleteCheck(){
		var result = confirm("������ Ż���Ͻðڽ��ϱ�?");
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
					alert("ȸ��Ż�� ����!!");
					window.location.replace("logout");
				}else{
					alert("ȸ��Ż�� ����!!");
				}
			}
			
		})
	}
	
</script>

</head>
<body>
	<fieldset>
	<legend><h2>ȸ��Ż��</h2></legend>
		<label>��й�ȣ : <input type="password" id="userPw" ></label><br>
		<input type="button" id="deleteBtn" value="Ż���ϱ�">&nbsp;&nbsp;
		<input type="button" id="backBtn" value="���ư���" >
	</fieldset>

</body>
</html>