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
                <a href="#"><img src="/springboot//p1.jpg"></a>
                <a href="#"><img src="/springboot//p2.jpg"></a>
                <a href="#"><img src="/springboot//p3.jpg"></a>
                <a href="#"><img src="/springboot//p4.jpg"></a>
                <a href="#"><img src="/springboot//p5.jpg"></a>
            </div>
        </section>

        <h2 class="listname">New Product List</h2>
        <br>


        <div class="clothing-products">
            <c:forEach items="${list}" var="product" varStatus="status" begin="0" end="7">
                <!-- 4개의 상품마다 새로운 행 시작 -->
                <c:if test="${status.index % 4 == 0}">
                    <div class="row">
                </c:if>
                <div class="product" onclick="redirectToProductDetail(${product.products_idx})">
                    <c:forEach items="${img}" var="img" begin="0" end="2">
                    <c:set var="imagePath" value="/springboot/" />
                    <div><img src="${imagePath}${product.products_idx}/${img.img_url}" alt="Product Image"/></div>
                    </c:forEach>
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