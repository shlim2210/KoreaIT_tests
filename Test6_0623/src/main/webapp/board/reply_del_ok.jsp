<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="board" class="com.koreait.db.BoardDTO"/>
<jsp:useBean id="reply" class="com.koreait.db.ReplyDTO"/>
<jsp:useBean id="redao" class="com.koreait.db.ReplyDAO"/>
<jsp:setProperty property="b_idx" name="board"/>
<jsp:setProperty property="re_idx" name="reply"/>
<%
	if(session.getAttribute("userid") == null){
%>
	<script>
		alert('로그인 후 이용하세요');
		location.href='../login.jsp';
	</script>
<% 
	}
	if(redao.reDelete(reply)>=1){
%>	
		<script>
			alert('삭제되었습니다');
			location.href='view.jsp?b_idx=<%=board.getB_idx()%>';
		</script>
<%	
	}
%>