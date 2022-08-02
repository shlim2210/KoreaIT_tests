<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
	<h2>글쓰기</h2>
	<form method="post" action="write_ok.jsp" name="writeForm" id="writeForm">
		<p>아이디 : <input type="text" name="p_userid" id="p_userid" maxlength="10"></p>
		<p>이름 : <input type="text" name="p_name" id="p_name" maxlength="10"></p> 
		<p>제목 : <input type="text" name="p_title" id="p_title" maxlength="20"></p>
		<p>내용</p>
		<p><textarea style="width:300px; height:200px; resize:none;" name="p_content" id="p_content"></textarea></p>
		<p>비밀번호 : <input type="password" name="p_userpw" id="p_userpw" placeholder="비밀번호 설정시 숫자만 입력 가능" maxlength="8"></p>
		<p><input type="submit" value="등록">
		<input type="button" value="리스트" onclick="location.href='list.jsp'"></p>
	</form>
</body>
</html>
