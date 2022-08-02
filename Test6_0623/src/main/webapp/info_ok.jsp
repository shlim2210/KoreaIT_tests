<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean class="com.koreait.db.MemberDTO" id="member" scope="request"/>
<jsp:useBean class="com.koreait.db.MemberDAO" id="memdao"/>
<jsp:setProperty property="*" name="member"/>
<%
	if(session.getAttribute("userid") == null){
%>
	<script>
		alert('로그인 후 이용하세요');
		location.href='login.jsp';
	</script>
<%
	}
	member.setUserid((String)session.getAttribute("userid"));

	if(!memdao.pwCheck(member)){
%>
		<script>
			alert('비밀번호가 틀렸습니다');
			history.back();
		</script>
<%
	}else{
		if(memdao.edit(member) == 1){
%>
			<script>
				alert('수정되었습니다');
				location.href='login.jsp';
			</script>
<%
		}else{
%>
			<script>
				alert('실패했습니다!');
				history.back();
			</script>
<%
		}
	}
%>
