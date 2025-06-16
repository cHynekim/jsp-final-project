<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="bdao" class="model.BoardDao"></jsp:useBean>
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		bdao.deleteBoard(num);
		response.sendRedirect("boardList.jsp");
	%>
</body>
</html>