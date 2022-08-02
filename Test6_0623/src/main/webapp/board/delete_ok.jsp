<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="board" class="com.koreait.db.BoardDTO"/>
<jsp:useBean id="dao" class="com.koreait.db.BoardDAO"/>
<jsp:useBean id="reply" class="com.koreait.db.ReplyDTO"/>
<jsp:useBean id="redao" class="com.koreait.db.ReplyDAO"/>
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
	
	reply.setRe_boardidx(board.getB_idx());
	
	if(dao.delete(board, reply)>=1){
		System.out.println("삭제성공");
%>
		<script>
			alert('삭제되었습니다');
			location.href='list.jsp';
		</script>

<%
	}else{
%>
		<script>
			alet('오류 발생');
			history.back();
		</script>
<%
	}
%>