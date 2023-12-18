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
                <div class="bestlist">
                    <c:forEach var="imageName" items="${imageList}">
                            <%-- 이미지를 불러올 경로 설정 --%>
                            <c:set var="imagePath" value="/springboot/" />

                            <%-- 이미지 표시 --%>
                            <img src="${imagePath}${imageName}" alt="Image">
                            <br/>
                        </c:forEach>
                </div>
            </div>
            
            <div>
                <h4>new list</h4>
                <div class="outerlist">
                    16장씩 나열
                </div>
            </div>

        </section>


    </main>
</body>
</html>