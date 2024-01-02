<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cpath"  value="${pageContext.request.contextPath}"  />
<c:set var="mywishlist"  value="${ mywishlist }"  />
<%--<c:set var="myProductsList"  value="${cartMap.myProductsList}"  />--%>

<c:set  var="totalGoodsPrice" value="0"/>
<c:set  var="totalGoodsNum" value="0" />  <!--주문 개수 -->
<c:set  var="totalDeliveryPrice" value="0" /> <!-- 총 배송비 -->
<c:set  var="totalDiscountedPrice" value="0" /> <!-- 총 할인금액 -->

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${cpath}/resources/css/mypage.css">

<head>


    <c:if test="${message=='remove_Cart'}">
        <script>
            window.onload=function()//페이지 로딩과 동시에 실행되는 함수
            {
                init();
            }

            function init()
            {
                alert("찜목록 삭제");
                <c:remove var="message"/>
            }
        </script>
    </c:if>


</head>

<style>
    td
    {
        padding-left: 30px;
        padding-right: 30px;
    }
</style>

<body>
<div class="button_container">
 <button class="custom-btn btn-16" onclick="location.href='/mypage/myCartList' ">장바구니</button>
</div>

<table class="list_view">
    <tbody align=center >

    <tr >
        <th>이미지</th>
        <th>상품명</th>
        <th>사이즈/컬러</th>
        <th>정가</th>
        <th>수량</th>
        <th>삭제</th>
        <th> </th>
    </tr>

    <c:choose>

    <c:when test="${ empty mywishlist }">

        <tr>
            <td colspan=8 class="fixed">
                <strong>찜목록이 없습니다.</strong>
            </td>
        </tr>

    </c:when>

    <c:otherwise>

    <tr>
        <form name="frm_order_all_cart">
            <c:forEach var="item" items="${ mywishlist }" varStatus="cnt">

                <td class="goods_image">
                    <c:set var="imagePath" value="/springboot/" />
                    <c:forEach items="${img}" var="img" begin="0" end="0">
                        <div><img class="thumbnails" src="${imagePath}${item.products_idx}/${img.img_url}" alt="Product Image"/></div>
                    </c:forEach>
                </td>



            <td>
                <h2>
                    <a href="${cpath}/goods/goodsDetail.do?goods_id=${item.products_idx }">${item.products_name }</a>
                </h2>
            </td>

            <td class="price">
                <span>${item.size_product}/${item.color}</span>
            </td>

            <td class="price">
                <span>${item.products_price }원</span>
            </td>




            <td><!--POST 방식으로 넘기고 싶다면 자바스크립트를 이용해야한다-->
                <a class="custom-btn btn-5" href="javascript:delete_wish_elements('${item.favorites_idx}');">
                    삭제
                </a>
            </td>

            <td>
                <a class="btn-gradient green small" href="javascript:toCartfromWish('${item.favorites_idx}');">
                    장바구니 추가
                </a>
            </td>
        </form>
    </tr>
    </c:forEach>

    </tbody>
</table>
<div class="clear"></div>
</c:otherwise>
</c:choose>

<br><br>


</body>



<script>

    function delete_wish_elements(favorites_idx)
    {
        var favorites_idx=Number(favorites_idx);
        var formObj=document.createElement("form");
        var i_cart = document.createElement("input");

        i_cart.setAttribute("hidden",true);
        i_cart.name="favorites_idx";
        i_cart.value=favorites_idx;

        formObj.appendChild(i_cart);
        document.body.appendChild(formObj);
        formObj.method="post";
        formObj.action="${cpath}/mypage/removeWish";
        formObj.submit();
    }
    function toCartfromWish(favorites_idx)
    {
        var favorites_idx=Number(favorites_idx);
        var formObj=document.createElement("form");
        var i_cart = document.createElement("input");

        i_cart.setAttribute("hidden",true);
        i_cart.name="favorites_idx";
        i_cart.value=favorites_idx;

        formObj.appendChild(i_cart);
        document.body.appendChild(formObj);
        formObj.method="post";
        formObj.action="${cpath}/mypage/toCartfromWish";
        formObj.submit();
    }

</script>