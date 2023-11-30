<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="${cpath}/resources/css/home.css">
</head>
<body>

    <section>
    	<h4>ID 찾기</h4>

    	<form action="find/findID" method="POST">
    		 <p><input name="members_email" type="email" placeholder="users@email.com" required></p>

    		 <button>전송</button>
    	</form>

    	<h4>PW 찾기</h4>

    	<form action="find/findPW" method="POST">
    		 <p><input name="members_id" placeholder="userid" required></p>
    		 <p><input name="members_email" type="email" placeholder="users@email.com" required></p>

    		 <button>전송</button>
    	</form>

    </section>

</body>
</html>