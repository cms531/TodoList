<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#close").click(function(){
			window.close();
		})
	})
</script>

</head>
<body>
	<form action="insertTodo" method="post" >
		<fieldset>
		<legend>�۾���</legend>
		���� : <input type="text" name="title" ><br>
		&lt;����&gt; <br>
		<textarea rows="10" cols="100" name="content"></textarea><br>
		<input type="submit" value="���">
		<input type="reset" value="����">
		<input type="button" id="close" value="���ư���">
		</fieldset>
	</form>
</body>
</html>