<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="com.koreait.db.MemberDTO" id="member"/>
<jsp:useBean class="com.koreait.db.MemberDAO" id="memdao"/>

<%
	String userid = request.getParameter("userid");
	member.setUserid(userid);
	if(memdao.idCheck(member)){
		out.print("no");	// 중복 아이디가 있는 경우
	}else{
		out.print("ok");	// 중복 아이디가 없는 경우
	}
%>