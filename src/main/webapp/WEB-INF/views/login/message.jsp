<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<script>
    let row = ${row};
    alert('${msg}');

    if (row != 0) {
        location.href = window.close();
    } else {
        history.back();
    }
</script>

</body>
</html>