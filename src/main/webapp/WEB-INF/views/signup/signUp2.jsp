<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../header2.jsp" %>

<section>
	<h1>회원가입 페이지</h1>
	
	
	<form method="post">
		<p><input name="members_id" placeholder="아이디" required></p>
		<p><input name="members_password" type="password" placeholder="패스워드" required></p>
		<p><input name="members_nickname" placeholder="닉네임" required></p>
		<p><input name="members_email" placeholder="이메일" required></p>
<%--		<p><input name="members_email_number" placeholder="이메일 인증번호" required></p>--%>
		<p><input name="members_address" placeholder="주소" required></p>
		<p><input name="members_detailed_address" placeholder="상세주소" required></p>
		<p><input name="members_phone_number" placeholder="전화번호" required></p>
		<p><input name="members_name" placeholder="이름" required></p>
		<p><input name="members_ssn" placeholder="주민번호" required></p>
		
		<button>회원가입</button>
	</form>
	
	
</section>

</body>
</html>