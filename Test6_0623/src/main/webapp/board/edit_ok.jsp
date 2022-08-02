<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="board" class="com.koreait.db.BoardDTO" scope="request"/>
<jsp:useBean id="dao" class="com.koreait.db.BoardDAO"/>
<jsp:setProperty property="*" name="board"/>
<%
	if(session.getAttribute("userid") == null){
%>
	<script>
		alert('로그인 후 이용하세요');
		location.href='../login.jsp';
	</script>
<%
	}
	String userid = (String)session.getAttribute("userid");
	String name = (String)session.getAttribute("name");

	if(dao.edit(board)>=1){
		System.out.println("수정성공");
%>
		<script>
			alert('수정되었습니다');
			location.href='view.jsp?b_idx=<%=board.getB_idx()%>';
		</script>
<%
	}else{
%>
		<script>
			alet('오류 발생');
			history.back();
		</script>
<%
	}
%>