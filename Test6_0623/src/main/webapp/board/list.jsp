<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="com.koreait.db.BoardDAO" %>
<%@ page import="com.koreait.db.BoardDTO" %>  
<%@ page import="java.util.ArrayList" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	int totalCount = 0;	// 전체 글 개수
	int pagePerCount = 10; // 페이지당 글 개수
	int start = 0;	// mysql 시작 글번호
 
	String pageNum = request.getParameter("pageNum");
	if(pageNum != null && !pageNum.equals("")){
		start = (Integer.parseInt(pageNum)-1) * pagePerCount;
	}else{
		pageNum = "1";
		start = 0;
	}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
</head>
<body>
<h2>리스트</h2>
<p><a href='write.jsp'>글쓰기</a> | <a href="../login.jsp">돌아가기</a></p>
<table width="800" border="1">
	<tr>
		<th width="10%">번호</th>
		<th width="45%">제목</th>
		<th width="20%">글쓴이</th>
		<th width="10%">조회수</th>
		<th width="15%">날짜</th>
	</tr>
<%
	BoardDAO boardDAO = new BoardDAO();
	totalCount = boardDAO.totalCount();
	
	ArrayList<BoardDTO> list = boardDAO.boardList(start, pagePerCount);
	for(BoardDTO boardDTO:list){
%>
		<tr>
			<td><%=boardDTO.getB_idx() %></td>
			<td><a href="view.jsp?b_idx=<%=boardDTO.getB_idx()%>"><%=boardDTO.getB_title() %></a></td>
			<td><%=boardDTO.getB_userid() %> (<%=boardDTO.getB_name() %>)</td>
			<td><%=boardDTO.getB_hit() %></td>
			<td><%=boardDTO.getB_regdate() %></td>
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
		<td colspan="6">
		<c:forEach var="j" begin="1" end="<%=pageNums %>" step="1" >
			<a href='list.jsp?pageNum=${j}'>[${j}]</a>&nbsp;&nbsp;&nbsp;
		</c:forEach>
		</td>
	</tr>
</table>

</body>
</html>