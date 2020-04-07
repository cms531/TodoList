<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var todo_seq = ${todo_seq};
		var check = ${check};
		
		$("#closeBtn").click(function() {
			window.close();
		})
		
		$(".backBtn").click(function() {
				window.location.replace("moveTodo");
		})
			
		$("#updateBtn").click(function(){
			updateTodo(todo_seq);
		})
		
		
		if (todo_seq != null) {
			selectOneTodo(todo_seq);
		}
		
		function selectOneTodo(todo_seq){
			$.ajax({
				url : "selectOneTodo",
				type : "get",
				data : {
					todo_seq : todo_seq
				},
				success : function(result) {
					$("#title").val(result.title);
					$("#content").val(result.content);
					$("#name").val(result.userId);
				}
			})
		}
		
		function updateTodo(todo_seq){
			$.ajax({
				url : "updateTodo"
				,type : "post"
				,data : {
					todo_seq : todo_seq
					,title : $("#title").val()
					,content : $("#content").val()
				}
				,success:function(result){
					if(result == 'success'){
						location.reload();
					}else{
						alert("fail");
					}
				}
			
			})
		}
		
		
		
	})
	
</script>

</head>
<body>
	<c:if test="${todo_seq==-1}">
		<form action="insertTodo" method="post">
			<fieldset>
				<legend>글쓰기</legend>
				제목 : <input type="text" name="title" maxlength="20" required><br>
				&lt;내용&gt; <br>
				<textarea rows="10" cols="100" name="content" required></textarea><br> 
				<input type="submit" value="등록"> 
				<input type="reset" value="리셋"> <input type="button" id="closeBtn" value="돌아가기">
			</fieldset>
		</form>
	</c:if>

	<c:if test="${todo_seq!=-1 and check eq 'false'}">
		<fieldset>
		<legend >${userId}님의 글</legend>
			제목 : <input type="text" name="title" id="title" readonly><br>
			&lt;내용&gt; <br>
			<textarea rows="10" cols="100" name="content" id="content" readonly></textarea><br> 
			<input type="button" class="backBtn" value="돌아가기">
		</fieldset>
	</c:if>
	
	<c:if test="${todo_seq!=-1 and check eq 'true'}">
		<fieldset>
		<legend>${userId}님의 글</legend>
			제목 : <input type="text" name="title" id="title" ><br>
			&lt;내용&gt; <br>
			<textarea rows="10" cols="100" name="content" id="content" ></textarea><br> 
			<input type="button" value="수정" id="updateBtn" >
			<input type="button" class="backBtn" value="돌아가기">
		</fieldset>
	</c:if>


</body>
</html>