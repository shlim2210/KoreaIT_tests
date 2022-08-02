<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.pc.db.Dbconn" %>


<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "";
	String today = null;
	
	int totalCount = 0;	// 전체 글 개수
	int pagePerCount = 15; // 페이지당 글 개수
	int start = 0;	// mysql 시작 글번호
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum != null && !pageNum.equals("")){
		start = (Integer.parseInt(pageNum)-1) * pagePerCount;
	}else{
		pageNum = "1";
		start = 0;
	}
	
	try{
		conn = Dbconn.getConnection();
		if(conn != null){
			sql = "select count(p_idx) as total from tb_post";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				totalCount = rs.getInt("total");
			}
			
			sql = "select * from tb_post order by p_idx desc limit ?, ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, pagePerCount);
			rs = pstmt.executeQuery();
		}

	}catch(Exception e){
		e.printStackTrace();
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<h2>리스트</h2>
	<p><a href="write.jsp">글쓰기</a></p>
	<p>총 게시글 : <%=totalCount %> 개</p>
	<table width="1000" border="1">
		<tr>
			<th width="10%">번호</th>
			<th width="35%">제목</th>
			<th width="15%">아이디</th>
			<th width="15%">이름</th>
			<th width="10%">조회수</th>		
			<th width="15%">날짜</th>								
		</tr>
<% 
	while(rs.next()){
		String p_idx = rs.getString("p_idx");
		String p_title = rs.getString("p_title");
		String p_userid = rs.getString("p_userid");
		String p_name = rs.getString("p_name");
		String p_regdate = rs.getString("p_regdate").substring(0,10);
		String p_hit = rs.getString("p_hit");
		String p_userpw = rs.getString("p_userpw");

		String lockStr = "";
		
		if(!p_userpw.equals("")){
			lockStr = "<img src='lock.png' alt = '비밀글' style = 'width:12px' >";
		}
%>
		<tr>
			<td><%=p_idx%></td>
			<td><a href="view_ok.jsp?p_idx=<%=p_idx%>"><%=p_title%></a> <%=lockStr %></td>
			<td><%=p_userid%></td>
			<td><%=p_name%></td>
			<td><%=p_hit%></td>
			<td><%=p_regdate%></td>
		</tr>
<%
	}

	int pageNums = 0; // 총 페이지 수
	if(totalCount % pagePerCount == 0){
		pageNums = (totalCount / pagePerCount);
	}else{
		pageNums = (totalCount / pagePerCount) + 1;
	}
%>
	<tr>
		<th colspan="6">
<%
		for(int i=1; i<=pageNums; i++){
			out.print("<a href='list.jsp?pageNum=" + i + "'>[" + i + "]</a>&nbsp;&nbsp;&nbsp;");
		}
%>
		</th>
	</tr>
	</table>

</body>
</html>