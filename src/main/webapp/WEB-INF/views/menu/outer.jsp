<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="../header.jsp"%>
<link rel="stylesheet" href="${cpath}/resources/css/menu.css">
</head>
<body>
    <main>
        <section class="outer">
            <div class="clothing-products">
                <c:forEach items="${list}" var="product" varStatus="status">
                    <!-- 4개의 상품마다 새로운 행 시작 -->
                    <c:if test="${status.index % 4 == 0}">
                        <div class="row">
                    </c:if>
                    <div class="product" onclick="redirectToProductDetail(${product.products_idx})">
                    <c:set var="imagePath" value="/springboot/" />
                            <div><img src="${imagePath}${product.products_idx}/${product.img_url}" alt="Product Image"/></div>
                        <div>${product.products_name}</div>
                        <div>${product.products_price}원</div>
                    </div>
                    <!-- 4개의 상품이 끝나면 행 종료 -->
                    <c:if test="${status.index % 4 == 3 || status.last}">
                        </div>
                    </c:if>
                </c:forEach>
            </div>

            <ul class="page">
                <c:if test="${p.prev }">
                    <li><a href="${cpath }/outer/page=${begin - 1 }">이전</a></li>
                </c:if>

                <c:forEach var="i" begin="${p.begin }" end="${p.end }">
                    <li><a href="${cpath }?page=${i }">${i }</a></li>
                </c:forEach>

                <c:if test="${p.next }">
                    <li><a href="${cpath }/outer/page=${end + 1 }">다음</a></li>
                </c:if>
            </ul>
        </section>
    </main>

    <script>
        function redirectToProductDetail(productIdx) {
            window.location.href = '/product/homeProduct?productIdx=' + productIdx;
        }
    </script>
</body>
</html>