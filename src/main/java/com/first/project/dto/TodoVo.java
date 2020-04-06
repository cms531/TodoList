package com.first.project.dto;

public class TodoVo {
	private int todo_seq;
	private String userId;
	private String title;
	private String content;
	private String tododate;
	
	public TodoVo() {
		super();
	}

	public TodoVo(int todo_seq, String userId, String title, String content, String tododate) {
		super();
		this.todo_seq = todo_seq;
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.tododate = tododate;
	}

	public int getTodo_seq() {
		return todo_seq;
	}

	public void setTodo_seq(int todo_seq) {
		this.todo_seq = todo_seq;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTododate() {
		return tododate;
	}

	public void setTododate(String tododate) {
		this.tododate = tododate;
	}

	@Override
	public String toString() {
		return "TodoVo [todo_seq=" + todo_seq + ", userId=" + userId + ", title=" + title + ", content=" + content
				+ ", tododate=" + tododate + "]";
	}
	
}
