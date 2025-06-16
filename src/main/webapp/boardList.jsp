<%@page import="model.BoardDo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style>
	.lists{
		cursor : pointer;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="bdao" class="model.BoardDao"></jsp:useBean>
	<% 
		ArrayList<BoardDo> boards = bdao.getAllBoards();
	%>
	<div class="container">
		<h2>BoardList.jsp</h2>
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">Title</th>
		      <th scope="col">Id</th>
		    </tr>
		  </thead>

		  <tbody>
			  <%
			  	for(int i = 0; i < boards.size(); i++){
			  		BoardDo bdo = boards.get(i);
			  %>
			  		<tr class="lists" onclick="location.href='board.jsp?num=<%=bdo.getNum() %>'">
				      <th scope="row"><%=i+1 %></th>
				      <td><%=bdo.getTitle() %></td>
				      <td><%=bdo.getId() %></td>
			    	</tr>
			  <%
			  	}
			  %>
		  </tbody>
		</table>
		<input type="button" value="Create" onclick="location.href='boardForm.jsp'">
	</div>
</body>
</html>