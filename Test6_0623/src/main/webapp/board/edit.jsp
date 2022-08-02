<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="board" class="com.koreait.db.BoardDTO"/>
<jsp:useBean id="dao" class="com.koreait.db.BoardDAO"/>
<jsp:setProperty property="b_idx" name="board"/>
<%
	if(session.getAttribute("userid") == null){
%>
	<script>
		alert('로그인 후 이용하세요');
		location.href='../login.jsp';
	</script>
<% 
	}
	String userid = (String)session.getAttribute("userid");
	String name = (String)session.getAttribute("name");
	dao.view(board);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
</head>
<body>
	<h2>글수정</h2>
	<form method="post" action="edit_ok.jsp">
	<input type="hidden" name="b_idx" value="<%=board.getB_idx()%>">
		<p>작성자 : <%=name%>(<%=userid %>)</p>
		<p>제목 : <input type="text" name="b_title" value="<%=board.getB_title()%>"></p>
		<p>내용</p>
		<p><textarea style="width:300px; height:200px; resize:none;" name="b_content"><%=board.getB_content() %></textarea></p>
		<p><input type="submit" value="수정"> <input type="reset" value="재작성"> 
		<input type="button" value="돌아가기" onclick="history.back()"> 
		<input type="button" value="리스트" onclick="location.href='list.jsp'"></p>
	</form>
</body>
</html>