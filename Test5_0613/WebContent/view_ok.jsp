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
	String p_userpw = "";
	
	try{
		conn = Dbconn.getConnection();
		if(conn != null){
			sql = "select p_userpw from tb_post where p_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				p_userpw = rs.getString("p_userpw");
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}

	if(p_userpw.equals("")){
%>
		<script>
			location.href = "view.jsp?p_idx=<%=p_idx%>";
		</script>
<%
		}else{
%>
		<script>
			const ispw = prompt("비밀번호를 입력하세요");
			if(ispw==<%=p_userpw%>){
				location.href = "view.jsp?p_idx=<%=p_idx%>";
			}else{
				alert("비밀번호가 틀렸습니다.");
				history.back();
			}
		</script>
<%		
		}
%>