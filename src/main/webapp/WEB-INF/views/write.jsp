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
		<legend>글쓰기</legend>
		제목 : <input type="text" name="title" ><br>
		&lt;내용&gt; <br>
		<textarea rows="10" cols="100" name="content"></textarea><br>
		<input type="submit" value="등록">
		<input type="reset" value="리셋">
		<input type="button" id="close" value="돌아가기">
		</fieldset>
	</form>
</body>
</html>