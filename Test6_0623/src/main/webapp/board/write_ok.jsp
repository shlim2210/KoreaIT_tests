<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="board" class="com.koreait.db.BoardDTO"/>
	<jsp:useBean id="dao" class="com.koreait.db.BoardDAO"/>
	<jsp:useBean id="dt" class="com.koreait.board.Data"/>
	<jsp:setProperty property="b_title" name="board"/>
	<jsp:setProperty property="b_content" name="board"/>
<%
	if(session.getAttribute("userid") == null){
%> 
	<script>
		alert('로그인 후 이용하세요');
		location.href='../login.jsp';
	</script>
<%
	}
	if(dt.prepare((String)session.getAttribute("userid"), (String)session.getAttribute("name"), board.getB_title(), board.getB_content())!= 0){
		response.sendRedirect("list.jsp");
	}else{
		out.print("<script>alert('에러발생!');history.back();</script>");
	}
%>