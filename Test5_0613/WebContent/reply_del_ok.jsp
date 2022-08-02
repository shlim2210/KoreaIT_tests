<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.pc.db.Dbconn" %>
<%
	
	String p_idx = request.getParameter("p_idx");
	String re_idx = request.getParameter("re_idx");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String sql = "";
	
	try{
		conn = Dbconn.getConnection();
		if(conn != null){
			sql = "delete from tb_replyPost where re_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, re_idx);
			pstmt.executeUpdate();
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<script>
	alert("댓글이 삭제되었습니다.");
	location.href="view.jsp?p_idx=<%=p_idx%>";
</script>