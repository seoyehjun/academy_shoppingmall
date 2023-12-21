<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="../header.jsp"%>
<link rel="stylesheet" href="${cpath}/resources/css/menu.css">
</head>
<body>
    <main>
        <section class="outer">
            <div class="best">
                <h4>best item</h4>
                <div class="outerlist" onclick="redirectToProductDetail(${product.products_idx}">
                    <c:forEach var="imageName" items="${menuList.img_url}">
                        <c:set var="imagePath" value="/springboot/"/>
                        <a href=""><img src="${imagePath}${imageName}" alt="Image"></a>
                        <br/>
                    </c:forEach>
                </div>
            </div>

        </section>
    </main>

    <script>
        function redirectToProductDetail(productIdx) {
            window.location.href = '/menu/outer?productIdx=' + productIdx;
        }
    </script>
</body>
</html>