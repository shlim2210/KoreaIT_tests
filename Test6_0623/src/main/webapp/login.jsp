<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h2>로그인</h2>
	<c:choose>
		<c:when test="${userid eq null}">
			<form method="post" action="login_ok.jsp">
				<p>아이디 : <input type="text" name="userid"></p>
				<p>비밀번호 : <input type="password" name="userpw"></p>
				<p><input type="submit" value="로그인"></p>
			</form>
			<p>아직 회원이 아니신가요? <a href='member.jsp'>회원가입</a></p>
		</c:when>
		<c:otherwise>
			<p>${name}(${userid})님 환영합니다!</p>
			<p><a href='logout.jsp'>로그아웃</a> | <a href='info.jsp'>정보수정</a> | <a href='./board/list.jsp'>게시판</a></p>
		</c:otherwise>
	</c:choose>
</body>
</html>