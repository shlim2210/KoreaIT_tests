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
	
	try{
		conn = Dbconn.getConnection();
		if(conn != null){
			sql = "delete from tb_replyPost where re_postidx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_idx);
			pstmt.executeUpdate();
			
			sql = "delete from tb_post where p_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_idx);
			pstmt.executeUpdate();
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<script>
	alert("삭제되었습니다.");
	location.href = "list.jsp";
</script>