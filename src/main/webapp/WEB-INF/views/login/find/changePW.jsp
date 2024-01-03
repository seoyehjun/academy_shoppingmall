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
    <title>비밀번호 변경</title>
    <link rel="stylesheet" href="${cpath}/resources/css/home.css">
</head>
<body>

    <section>
        <h4>새로운 비밀번호 입력</h4>

        <form method="POST">
            <p><input name="members_password" type="hidden"  placeholder="새로운 비밀번호"></p>
            <p><input name="members_password" id="password1" type="password" placeholder="새로운 비밀번호" required></p>
            <button type="submit">변경</button>
        </form>
    </section>

    <script>
        function test() {
          var p1 = document.getElementById('password1').value;
          var p2 = document.getElementById('password2').value;
          if( p1 != p2 ) {
            alert("비밀번호가 일치 하지 않습니다");
            return false;
          } else{
            alert("비밀번호가 변경되었습니다");
            return true;
          }

        }
    </script>

</body>
</html>