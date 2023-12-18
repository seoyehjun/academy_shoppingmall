<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="header.jsp"%>

<%@ page import="java.util.List" %>
<%@ page import="com.example.shoppingmall_project.model.vo.ProductVO" %>

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

<%--        <section class="daily">--%>
<%--            <div>--%>
<%--                <c:forEach var="row" items="${list }">--%>
<%--                    <tr>--%>
<%--                        <td><img src="/resources/img/${row.img_url }"></td>--%>
<%--                    </tr>--%>
<%--                </c:forEach>--%>
<%--            </div>--%>
<%--        </section>--%>

<%--        <section class="popular">--%>
<%--            <div>--%>
<%--                <c:forEach var="row" items="${list }">--%>
<%--                    <tr>--%>
<%--                        <td>${row.img_url }</td>--%>
<%--                    </tr>--%>
<%--                </c:forEach>--%>
<%--            </div>--%>
<%--        </section>--%>

<%--        <section class="new product">--%>
<%--            <div>--%>
<%--                <c:forEach var="row" items="${list }">--%>
<%--                    <tr>--%>
<%--                        <td>${row.img_url }</td>--%>
<%--                    </tr>--%>
<%--                </c:forEach>--%>
<%--            </div>--%>
<%--        </section>--%>

<%--    idx 순으로 일딴 출력    --%>
        <div class="clothing-products">
            <c:forEach items="${list}" var="product" varStatus="status" begin="0" end="7">
                <!-- 4개의 상품마다 새로운 행 시작 -->
                <c:if test="${status.index % 4 == 0}">
                    <div class="row">
                </c:if>
                <div class="product" onclick="redirectToProductDetail(${product.products_idx})">
                    <div><img src="${product.img_url}" alt="Product Image"/></div>
                    <div>${product.products_name}</div>
                        <%--                <div>${product.color}</div>--%>
                        <%--                <div>${product.size_product}</div>--%>
                    <div>${product.products_price}원</div>
                </div>
                <!-- 4개의 상품이 끝나면 행 종료 -->
                <c:if test="${status.index % 4 == 3 || status.last}">
                    </div>
                </c:if>
            </c:forEach>
        </div>

        <script>
            function redirectToProductDetail(productIdx) {
                window.location.href = '/product/homeProduct?productIdx=' + productIdx;
            }
        </script>
    </main>
</body>
</html>