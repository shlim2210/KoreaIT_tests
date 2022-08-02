<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.pc.db.Dbconn" %>
   
<%
	
    String p_idx = request.getParameter("p_idx");
    
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "";
	String p_userid = null;
	String p_name = null;
	String p_title = null;
	String p_content = null;
	String p_userpw = "";

	try{
		conn = Dbconn.getConnection();
		if(conn!=null){
			sql = "select * from tb_post where p_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				p_userid = rs.getString("p_userid");
				p_name = rs.getString("p_name");
				p_title = rs.getString("p_title");
				p_content = rs.getString("p_content");
				p_userpw = rs.getString("p_userpw");
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
<title>글 수정</title>
</head>
<body>
	<h2>글 수정</h2>
	<form method="post" action="edit_ok.jsp">
		<input type="hidden" name="p_idx" value="<%=p_idx%>">
		<p>아이디 : <input type="text" name="p_userid" value="<%=p_userid%>" maxlength="10"></p>
		<p>이름 : <input type="text" name="p_name" value="<%=p_name%>" maxlength="10"></p>
		<p>제목 : <input type="text" name="p_title" value="<%=p_title%>" maxlength="20"></p>
		<p>내용<p>
		<p><textarea style="width:300px; height: 200px; resize:none;" name = "p_content"><%=p_content%></textarea>
		<p>비밀번호 : <input type="password" name="p_userpw" value="<%=p_userpw%>" placeholder="비밀번호 설정시 숫자만 입력 가능" maxlength="8"></p>
		<p><input type="submit" value="수정">
		<input type="button" value="돌아가기" onclick="history.back()"> 
		 <input type="button" value="리스트" onclick="location.href='list.jsp'"></p>
	</form>
</body>
</html>