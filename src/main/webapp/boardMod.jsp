<%@page import="model.BoardDo"%>
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
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="bdao" class="model.BoardDao"></jsp:useBean>
	<% 
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDo board = bdao.getBoard(num);
	%>
	<div class="container">
		<form action="boardModProc.jsp" method="get">
			<!-- Board Header -->
			<div class="row g-3 align-items-center">
				<!-- title -->
		 		<div class="col-auto">
		   			<label for="inputPassword6" class="col-form-label">Title</label>
		 		</div>
		 		<div class="col-auto">
		   			<input type="text" name="title" value="<%=board.getTitle() %>" size="30"
		   			   	   class="form-control" aria-describedby="passwordHelpInline">
			 	</div>	
			 	<!-- Id -->
			 	<div class="col-auto">
			   		<label for="inputPassword6" class="col-form-label">ID</label>
			 	</div>
			 	<div class="col-auto">
			   		<span id="passwordHelpInline" class="form-text">
			     		<%=board.getId() %>
			   		</span>
			 	</div>		 	
			</div>
			<!-- Board Header end -->
			<hr>
			<!-- Contexts -->
			<div class="mb-3">
			 	<label for="exampleFormControlTextarea1" class="form-label"></label>
			 	<textarea class="form-control text-check" name="cont" id="context" rows="10"><%=board.getCont() %></textarea>
			</div>
			
			<!-- Submit btn -->
			<button type="submit" id="btn" class="btn btn-primary">Submit</button>
			
			<input type="hidden" name="num" value="<%=board.getNum() %>">
		</form>
	</div>
</body>
</html>