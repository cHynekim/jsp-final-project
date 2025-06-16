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
		<!-- Board Header -->
		<div class="row g-3 align-items-center">
			<!-- title -->
		 	<div class="col-auto">
		   		<label for="inputPassword6" class="col-form-label">Title</label>
		 	</div>
		 	<div class="col-auto">
		   		<span id="passwordHelpInline" class="form-text">
		     		<%=board.getTitle() %>
		   		</span>
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
		<!-- Board Body -->
		<div class="container" style="min-height:300px">
			<%=board.getCont() %>
		</div>
		<!-- Board Body end -->
		<hr>
		<!-- Board Footer -->
		<footer class="row g-3 align-items-center">
			<div class="col-auto">
		   		<label for="inputPassword6" class="col-form-label">Password</label>
		 	</div>
		 	<div class="col-auto">
		   		<input type="password" name="pw" class="form-control" size="25" placeholder="enter password to modify..."
		   			   style="font-size:12px" id="pw">
		 	</div>
		 	<div class="col-auto">
		   		<button type="button" class="btn btn-primary" disabled
				    onclick="location.href='boardMod.jsp?num=<%=board.getNum() %>'" >Modify
				</button>
		 	</div>   
		 	<div class="col-auto">
		   		<button type="button" class="btn btn-danger" disabled
				    onclick="location.href='boardDelProc.jsp?num=<%=board.getNum() %>'" >Delete
				</button>
		 	</div> 
		 	<a href="boardList.jsp">Show All...</a>  	
		</footer>
	</div>
	<script>
		let btns = document.getElementsByTagName('button');
		let input = document.getElementById('pw');
		
		input.onkeydown = (e) => {
			if(e.keyCode === 13){
				if(input.value === "<%=board.getPw() %>"){
					for(let i = 0; i < btns.length; i++)
						btns[i].disabled = false;
				}
				else{
					for(let i = 0; i < btns.length; i++)
						btns[i].disabled = true;
				}
			}
		}
	</script>
</body>
</html>