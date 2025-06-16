<%@page import="java.lang.ProcessBuilder.Redirect"%>
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
	<jsp:setProperty property="*" name="bdo"/>
	
	<jsp:useBean id="bdao" class="model.BoardDao"></jsp:useBean>
	<%
		bdao.insertBoard(bdo);
		response.sendRedirect("boardList.jsp");
	%>
</body>
</html>