<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>TodoListPage</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		var str = "";
		for(var i = 0 ; i < 10; i++){
			str += "<tr>" ;
			str += "<td>" + i + "</td>";
			str += "<td>" + i + "</td>";
			str += "</tr>" ;
		}
		$("#printList").append(str);
		
		$("#moveWrite").click(function(){
			window.location.href="<c:url value='dir��/file��.do' />";
		})
		
	})

</script>
</head>
<body>
	<h2>${sessionScope.userName}�� ȯ���մϴ�.</h2>
	<fieldset>
	<legend><h3>TODOLIST</h3></legend>
		<table border="1" bordercolor="blue" >
			<thead >
				<tr>
					<th>����</th>
					<th>��¥</th>
				</tr>
			</thead >
			<tbody id="printList" >
			</tbody>
		</table>
	</fieldset>
	<input type="button" value="�۾���" id="moveWrite" >
	
</body>
</html>