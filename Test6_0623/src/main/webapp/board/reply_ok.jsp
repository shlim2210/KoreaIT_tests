<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dt" class="com.koreait.board.Data"/>
<jsp:useBean id="board" class="com.koreait.db.BoardDTO"/>
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
	String re_userid = (String)session.getAttribute("userid");
	String re_name = (String)session.getAttribute("name");
	String re_content = request.getParameter("re_content");
	
	if(dt.repl(re_userid, re_name, re_content, board.getB_idx()) != 0){
%>
	<script>
	alert('등록되었습니다');
	location.href='view.jsp?b_idx=<%=board.getB_idx()%>';
	</script>	
<%
	}
%>