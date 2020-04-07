
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CreatePage</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	checkId = false; //��������
	$(function(){
		$("#moveLoginBtn").click(function(){
			window.location.replace("moveLogin");
		})
		
		$("#checkBtn").click(function(){
			var userId  = $("#Id").val();
			if(userId.length < 2){
				alert("���̵� ���Ŀ� ���߾ �Է����ּ���");
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
				alert("���̵�� 2~15�ڸ��Դϴ�.");
				return false;
			}
			if(userPw.length < 2){
				alert("��й�ȣ�� 2~20�ڸ��Դϴ�.");
				return false;
			}
			if(userPw2.length == 0 ){
				alert("��й�ȣȮ�ο� �Է����ּ���");
				return false;
			}
			if(userPw2 != userPw){
				alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
				return false;
			}
			if(userName.length <= 0){
				alert("�̸��� �Է����ּ���");
				return false;
			}
			if(checkId==true){
				$("#createForm").submit();
			}else{
				alert("���̵� �ߺ�Ȯ���� ���ּ���");
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
						alert("��밡���� ���̵��Դϴ�.");
						checkId= true;
					}else{
						alert("�̹� �����ϴ� ���̵��Դϴ�.");
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
		<legend><h2>ȸ������</h2></legend>
		<label>���̵� : <input type="text" name="userId" id="Id" minlength="2" maxlength="15" required  > </label>
		<input type="button" value="�ߺ�Ȯ��" id="checkBtn"  > <br>
		<label>��й�ȣ : <input type="password" id="Pw" name="userPw" minlength="2" maxlength="20"  required > </label><br>
		<label>��й�ȣ Ȯ�� : <input type="password" id="Pw2" maxlength="20"  required > </label><br>
		<label>�̸� : <input type="text" id="Name" name="userName"  required >  </label><br>
		<input type="button" value="����" id="createBtn"  >
		<button type="button" id="moveLoginBtn">�ڷΰ���</button>
	</fieldset>
	</form>

</body>
</html>