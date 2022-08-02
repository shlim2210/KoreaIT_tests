<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.pc.db.Dbconn" %>

<%
	request.setCharacterEncoding("UTF-8");
	String p_idx = request.getParameter("p_idx");
	String re_content = request.getParameter("re_content");
	String re_name = request.getParameter("re_name");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String sql="";
	
	if(re_name==""||re_content==""){
%>
		<script>
			alert("이름과 내용을 입력하세요.");
			history.back();
		</script>
<%
	}else{
		try{
			conn = Dbconn.getConnection();
			if(conn!=null){
				sql = "insert into tb_replyPost (re_name, re_content, re_postidx) values (?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,re_name);
				pstmt.setString(2,re_content);
				pstmt.setString(3,p_idx);
				pstmt.executeUpdate();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
%>
		<script>
			alert('등록되었습니다.');
			location.href = "view.jsp?p_idx=<%=p_idx%>";
		</script>
<%
	}
%>