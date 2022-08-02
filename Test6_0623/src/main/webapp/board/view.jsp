<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.koreait.db.ReplyDTO" %>
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
	reply.setRe_boardidx(board.getB_idx());
	
	dao.updateHit(board);
	dao.view(board);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글보기</title>
<script>
	function replyDel(re_idx){
		const yn = confirm('삭제하시겠습니까?');
		if(yn){
			location.href='reply_del_ok.jsp?re_idx='+re_idx+'&b_idx='+'<%=board.getB_idx()%>';
		}
	}
</script>
</head>
<body>
	<h2>글보기</h2>
	<table border="1" width="600">
		<tr>
			<td>제목</td><td><%=board.getB_title() %></td>
		</tr>
		<tr>
			<td>날짜</td><td><%=board.getB_regdate() %></td>
		</tr>
		<tr>
			<td>작성자</td><td><%=board.getB_name() %>(<%=board.getB_userid() %>)</td>
		</tr>
		<tr>
			<td>조회수</td><td><%=board.getB_hit()%></td>
		</tr>
		<tr>
			<td>내용</td><td><%=board.getB_content() %></td>
		</tr>
		<tr>
			<td colspan="2">
<%
		if(board.getB_userid().equals((String)session.getAttribute("userid"))){
%>
				<input type="button" value="수정" onclick="location.href='edit.jsp?b_idx=<%=board.getB_idx()%>'">
				<input type="button" value="삭제" onclick="location.href='delete_ok.jsp?b_idx=<%=board.getB_idx()%>'">
<%
		}
%>
				<input type="button" value="리스트" onclick="location.href='list.jsp'">
			</td>
		</tr>
	</table>
	<hr>
	<form method="post" action="reply_ok.jsp">
	<input type="hidden" name="b_idx" value="<%=board.getB_idx()%>">
		<%=session.getAttribute("name") %>(<%=session.getAttribute("userid") %>) 
		: <input type="text" name="re_content"> <input type="submit" value="확인">
	</form>
	
<%
	ArrayList<ReplyDTO> reList = new ArrayList<>();
	reList = redao.reList(reply);
	
	if(reList != null){
		for(ReplyDTO re : reList){
%>
			<p><%=re.getRe_name() %>(<%=re.getRe_userid() %>) : <%=re.getRe_content() %> [<%=re.getRe_regdate()%>]
<%
			if(re.getRe_userid().equals((String)session.getAttribute("userid"))){
%>
				<input type="button" value="삭제" onclick="replyDel('<%=re.getRe_idx()%>')"></p>
<%	
			}
		}
	}
%>
</body>
</html>