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
				alert("���̵� �Է����ּ���");
				return false;
			}
			if(userName == ""){
				alert(" �̸��� �Է����ּ���");
				return false;
			}
			searchUser();
		})
		
		$(document).on('click','#updateBtn',function(){
			var userPw = $("#userPw").val();
			var userPw2 = $("#userPw2").val();
			if(userPw.length < 2){
				alert("��й�ȣ�� 2�ڸ� �̻� �Է����ּ���");
				return false;
			}
			if(userPw2 == ""){
				alert("��й�ȣ Ȯ���� �Է����ּ���");
				return false;
			}
			if(userPw != userPw2){
				alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
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
					alert("�Է������� Ʋ�Ȱų� �������� �ʴ� ���̵� �Դϴ�.");
				}
				
			}
		})
	}
	
	function printNewPw(result){
		var str = "";
		str += "<fieldset>";
		str += "<legend><h2>��й�ȣ ����</h2> </legend>";
		str += "<form id='updatePwForm' action='updatePw' method='post' >";
		str += "�� ��й�ȣ : <input type='password' name='userPw'  id='userPw' maxlength='20' ><br>";
		str += "��й�ȣ Ȯ�� : <input type='password' id='userPw2' maxlength='20' ><br>";
		str += "<input type='hidden' value='"+result.userId+"' name='userId' >";
		str += "<input type= 'button' value='��й�ȣ ����' id='updateBtn'>&nbsp;&nbsp;";
		str += "<input type= 'button' value='�������' id='backWindow'>";
		str +="</form>"
		str += "</fieldset>";
		$("#two").html(str);
	}

</script>
</head>
<body>
<div id="first">
	<fieldset>
	<legend><h2>��й�ȣ ã��</h2> </legend>
	<form id="searchForm" action="searchUser" method="post">
		<label>���̵� : <input type="text" name="userId" id="userId" required ></label><br>
		<label>�̸� : <input type="text" name="userName" id="userName" required ></label><br>
		<input type="button" value="��й�ȣ ã��" id="searchBtn" >
		<input type="button" value="���ư���" id="backBtn" >
	</form>
	</fieldset>
</div>
<div id="two">
</div>

</body>
</html>