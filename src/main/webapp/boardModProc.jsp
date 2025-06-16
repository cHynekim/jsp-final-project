<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="bdo" class="model.BoardDo"></jsp:useBean>
	<jsp:setProperty property="num" name="bdo"/>
	<jsp:setProperty property="title" name="bdo"/>
	<jsp:setProperty property="cont" name="bdo"/>
	
	<jsp:useBean id="bdao" class="model.BoardDao"></jsp:useBean>
	<%
		int num = bdao.updateBoard(bdo);
		response.sendRedirect("board.jsp?num=" + num);
	%>
</body>
</html>