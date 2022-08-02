<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.pc.db.Dbconn" %>
<%@ page import="java.util.regex.Pattern" %>
<%
	request.setCharacterEncoding("UTF-8");
	String p_idx = request.getParameter("p_idx");
	String p_userid = request.getParameter("p_userid");
	String p_name = request.getParameter("p_name");
	String p_title = request.getParameter("p_title");	
	String p_content = request.getParameter("p_content");
	String p_userpw = request.getParameter("p_userpw");
	String expPwText = "^[0-9]+$";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql="";
	
	if(p_title==""||p_content==""||p_userid==""||p_name==""){
%>
			<script>
				alert("아이디, 이름, 제목, 내용을 입력하세요.");
				history.back();
			</script>
<%
	}if(!Pattern.matches(expPwText, p_userpw)&&p_userpw!=""){
%>
		<script>
		alert("비밀번호 설정은 숫자만 입력 가능합니다");
			history.back();
		</script>
<%
	}else{
		try{
			conn = Dbconn.getConnection();
			if(conn!=null){
				sql="update tb_post set p_userid=?, p_name=?, p_title=?, p_content=?, p_userpw=? where p_idx=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, p_userid);
				pstmt.setString(2, p_name);
				pstmt.setString(3, p_title);
				pstmt.setString(4, p_content);
				pstmt.setString(5, p_userpw);
				pstmt.setString(6, p_idx);
				pstmt.executeUpdate();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
%>
		<script>
			alert("수정되었습니다.");
			location.href = "view.jsp?p_idx=<%=p_idx%>";
		</script>
<%
}
%>