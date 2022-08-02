<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean class="com.koreait.db.MemberDTO" id="member" scope="request"/>
<jsp:setProperty property="*" name="member"/>
<jsp:useBean class="com.koreait.db.MemberDAO" id="memdao"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<%
	if(memdao.join(member) == 1){
%>
	<h2>회원가입 완료</h2>
<%
	}else{
%>
	<h2>회원가입 실패</h2>
<%
	}
%>
	<p>아이디 : <jsp:getProperty property="userid" name="member"/></p>
	<p>비밀번호 : <jsp:getProperty property="userpw" name="member"/></p>
	<p>이름 : <jsp:getProperty property="name" name="member"/></p>
	<p>휴대폰 번호 : <jsp:getProperty property="hp" name="member"/></p>
	<p>이메일 : <jsp:getProperty property="email" name="member"/></p>
	<p>취미 : 	
<%
		String hobbystr = "";
		for(String hobby : member.getHobby()){
			hobbystr = hobbystr + hobby + " ";
		}
%>	<%=hobbystr %></p>
	<p>주민등록번호 : <jsp:getProperty property="ssn1" name="member"/> - <jsp:getProperty property="ssn2" name="member"/></p>
	<p>우편번호 : <jsp:getProperty property="zipcode" name="member"/></p>
	<p>주소 : <jsp:getProperty property="address1" name="member"/></p>
	<p>상세주소 : <jsp:getProperty property="address2" name="member"/></p>
	<p>참고항목 : <jsp:getProperty property="address3" name="member"/></p>
	<p><a href='login.jsp'>로그인</a></p>
</body>
</html>