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
		$.ajax({
			url : "selectAllTodo"
			,type : "get"
			,success : function(result){
				var str = "";
				var count = false;
				for(var i = 0 ; i < result.length; i++){
					str += "<tr>";
					str += "<td><a href='readTodo?todo_seq="+result[i].todo_seq+"&userId="+result[i].userId+" ' >"+result[i].title+"</a></td>";
					str += "<td>" + result[i].tododate + "</td>";
					str += "<td>" + result[i].userId + "</td>";
					if(result[i].userId == '${sessionScope.userId}'){
						str += "<td><input type='button' class='deleteBtn' value='삭제' attr-delete='"+result[i].todo_seq+ "' ></td>";
						count = true;
					}
					str += "</tr>";
				}
				$("#printList").html(str);
				if(count){
					$("#th").append("<th>삭제</th>");
				}
			}
		})
		
		$("#deleteBtn").click(function(){
			window.location.replace("moveDeleteUser");
		})
		
		$("#moveWrite").click(function(){
			window.location.replace("moveWrite");
		})
		
		$(document).on("click",".deleteBtn",function(){
			var todo_seq = $(this).attr('attr-delete');
			$.ajax({
				url : "deleteTodo"
				,type : "post"
				,data : {
					todo_seq : todo_seq
				}
				,success : function(result){
					if(result =='success'){
						location.reload();
					}else{
						alert(result);
					}
				}
			})
		})
	})
	

</script>
</head>
<body>
	<h2>${sessionScope.userName}님 환영합니다.</h2>
	<table>
		<tr>
			<td><form action="logout" method="get"><input type="submit" value="로그아웃" ></form></td>
			<td><input type="button" value="회원탈퇴" id="deleteBtn" ></td>
		</tr>
	</table>
	<fieldset>
	<legend><h3>TODOLIST</h3></legend>
		<table border="1" bordercolor="blue" >
			<thead >
				<tr id="th">
					<th>제목</th>
					<th>날짜</th>
					<th>작성자</th>
				</tr>
			</thead >
			<tbody id="printList" >
			</tbody>
		</table>
	</fieldset>
	<input type="button" value="글쓰기" id="moveWrite" >
	
</body>
</html>