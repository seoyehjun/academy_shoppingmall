<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="${cpath}/resources/css/home.css">
</head>
<body>

    <section>
    	<h4>PW 찾기</h4>

    	<form action="${members_id}" method="POST">
    	    <p><input name="members_id" placeholder="userid" required>
    	    <p><input name="members_email" type="email" placeholder="users@email.com" required></p>

    		<button>전송</button>
            <button onClick="window.close()">닫기</button>
    	</form>

    </section>

</body>
</html>