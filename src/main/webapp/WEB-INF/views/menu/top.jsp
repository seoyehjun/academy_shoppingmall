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
                <div class="outerlist">
                    <c:forEach var="imageName" items="${imageList}">
                        <c:set var="imagePath" value="/springboot/"/>
                        <img src="${imagePath}${imageName}" alt="Image">
                        <br/>
                    </c:forEach>
                </div>
            </div>

        </section>


    </main>
</body>
</html>