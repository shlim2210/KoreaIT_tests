<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.pc.db.Dbconn" %>

<%
	request.setCharacterEncoding("UTF-8");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "";

	String p_idx = request.getParameter("p_idx");
	
	String p_title = null;
	String p_regdate = null;
	String p_userid = null;
	String p_name = null;
	String p_content = null;
	int p_hit = 0;

	try{
		conn = Dbconn.getConnection();
		if(conn != null){
			sql = "update tb_post set p_hit = p_hit +1 where p_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_idx);
			pstmt.executeUpdate();
			
			sql = "select * from tb_post where p_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				p_userid = rs.getString("p_userid");
				p_name = rs.getString("p_name");
				p_title = rs.getString("p_title");
				p_content = rs.getString("p_content");				
				p_regdate= rs.getString("p_regdate");
				p_hit = rs.getInt("p_hit");
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글보기</title>
<script>

	function replyDel(re_idx){
		if(confirm('삭제하시겠습니까?')){
			location.href='reply_del_ok.jsp?re_idx='+re_idx+'&p_idx=<%=p_idx%>';
		}
	}
</script>
</head>
<body>
	<h2>글보기</h2>
	<table border="1" width="600">
		<tr>
			<th width="100">제목</th>
			<td><%=p_title %></td>
		</tr>
		<tr>
			<th>날짜</th>
			<td><%=p_regdate%></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><%=p_userid %></td>
		</tr>
				<tr>
			<th>이름</th>
			<td><%=p_name%></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=p_hit %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%=p_content %></td>
		</tr>	
		<tr>
			<td colspan="2">

				<input type="button" value="수정" onclick="location.href='edit.jsp?p_idx=<%=p_idx%>'">
				<input type="button" value="삭제" onclick="location.href='delete_ok.jsp?p_idx=<%=p_idx%>'">			
				<input type="button" value="리스트" onclick="location.href='list.jsp'">
			</td>
		</tr>
	</table>
	<hr>
	<form method="post" action="reply_ok.jsp">
		<p>댓글</p>
		<input type = "hidden" value="<%=p_idx%>" name="p_idx">
		<input type="text" name="re_name" placeholder="이름" size="10" maxlength="10"> : <input type = "text" name = "re_content" placeholder="내용" size="20" maxlength="20"> <input type="submit" value="확인">
	</form>
<% 
		sql = "select * from tb_replyPost where re_postidx=? order by re_idx desc";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, p_idx);
		rs = pstmt.executeQuery();
	
		while(rs.next()){
			int re_idx = rs.getInt("re_idx");
			String re_name = rs.getString("re_name");
			String re_content = rs.getString("re_content");
			String re_regdate = rs.getString("re_regdate");	
%>
			<p><%=re_name%> : <%=re_content %> [<%=re_regdate %>] <input type="button" value="삭제" onclick="replyDel('<%=re_idx %>')"> </p>
<%
	}
%>
</body>
</html>