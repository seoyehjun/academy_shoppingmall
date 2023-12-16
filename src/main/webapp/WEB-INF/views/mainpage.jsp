<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="${cpath}/resources/css/mainpage.css">
</head>
<body>
    <main>
        <section class="banner">
            <div class="slide">
                <a href="#"><img src="/resources/img/image1.jpg"></a>
                <a href="#"><img src="/resources/img/image2.jpg"></a>
                <a href="#"><img src="/resources/img/image3.jpg"></a>
                <a href="#"><img src="/resources/img/image4.jpg"></a>
            </div>
        </section>

        <section class="daily">
            <div>
                <c:forEach var="row" items="${list }">
                    <tr>
                        <td><img src="/resources/img/${row.img_url }"></td>
                    </tr>
                </c:forEach>
            </div>
        </section>

        <section class="popular">
            <div>
                <c:forEach var="row" items="${list }">
                    <tr>
                        <td>${row.img_url }</td>
                    </tr>
                </c:forEach>
            </div>
        </section>

        <section class="new product">
            <div>
                <c:forEach var="row" items="${list }">
                    <tr>
                        <td>${row.img_url }</td>
                    </tr>
                </c:forEach>
            </div>
        </section>

    </main>
</body>
</html>