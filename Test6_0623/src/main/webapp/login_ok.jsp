<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="com.koreait.db.MemberDTO"/>
<jsp:setProperty property="*" name="member"/>
<jsp:useBean id="memdao" class="com.koreait.db.MemberDAO"/>
<%
	if(memdao.login(member) != null){
		session.setAttribute("userid", member.getUserid());
		session.setAttribute("name", member.getName());
		session.setAttribute("idx", member.getIdx());
%> 
		<script>
			alert('로그인 되었습니다');
			location.href='login.jsp';
		</script>
<%
	}else{
%>
		<script>
			alert('아이디 또는 비밀번호를 확인하세요');
			history.back();
		</script>
<%
	}
%>
