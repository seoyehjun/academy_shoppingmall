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

    <script>

        function fn_order_all_cart()
        {

            var formObj = document.createElement("form");
            document.body.appendChild(formObj);
            //	alert("모두 주문하기");
            var total_price = document.getElementsByName("total_price")[0].value;
            //  console.log("total_price"+total_price);
            var checkbox=document.getElementsByName("checkbox");
            //var cart_list = [];

            var length = checkbox.length;
            console.log("length:"+length)
            for(var i=0; i<length;i++)
            {

                if(checkbox[i].checked==true)
                {
                    //cart_list[i] = checkbox[i].value;
                    //cart_list.push(checkbox[i].value);

                    var temp_input = document.createElement("input");
                    temp_input.setAttribute("value", checkbox[i].value+"");
                    temp_input.setAttribute("hidden",true);
                    // 임시 <input>태그 만들어서 value속성 정해준다.

                    temp_input.name = "cart_list" ;
                    // 임시 <input>태그의 name 속성 정해준다.

                    formObj.appendChild(temp_input);
                    // 임시 <input>태그들을 formObj태그에 붙여준다.(formOnject는 위에서 임시로 만든거임)

                }
            }

            var temp_input2 = document.createElement("input");
            temp_input2.setAttribute("value", total_price);
            temp_input2.setAttribute("hidden", true);
            temp_input2.name = "total_price";
            formObj.appendChild(temp_input2);

            formObj.method="post";
            formObj.action="${cpath}/mypage/orderCartGoods";
            formObj.submit();
            console.log(formObj);
            //console.log("cart_list[0]:"+cart_list[0]);
            //console.log("cart_list[1]:"+cart_list[1]);

            /* $.ajax({
              type : "post",
              async : false, //false인 경우 동기식으로 처리한다.
              url : "${cpath}/product2/orderCartGoods",
    data : {
     cart_list:cart_list,
     total_price: total_price
    },
    dataType:"json",

    success : function(data, textStatus) {
     //alert(data);
     if(data.trim()=='modify_success'){
      alert("수량을 변경했습니다!!");
     }else{
      alert("다시 시도해 주세요!!");
     }

    },
    error : function(data, textStatus) {
     alert("에러가 발생했습니다."+data);
    },
    complete : function(data, textStatus) {
     //alert("작업을완료 했습니다");

    }
   }); //end ajax */


        }



    </script>

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
        <th class="fixed" >구분</th>
        <th>이미지</th>
        <th colspan=2 class="fixed">상품명</th>
        <th>정가</th>
        <th>수량</th>
        <th></th>
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
                <%-- <c:set var="cart_goods_qty" value="${mywishlist[cnt.count-1].cart_goods_qty}" />
                  <c:set var="cart_id" value="${mywishlist[cnt.count-1].cart_id}" /> --%>

            <td>
                <input type="checkbox" name="checkbox" class="individual_cart_checkbox"  checked  value="${item.favorites_idx }"  onClick="calcGoodsPrice(${item.products_price },this)">
            </td>

                <td class="goods_image">
                    <c:set var="imagePath" value="/springboot/" />
                    <c:forEach items="${img}" var="img" begin="0" end="2">
                        <div><img class="thumbnails" src="${imagePath}${item.products_idx}/${img.img_url}" alt="Product Image"/></div>
                    </c:forEach>
                </td>

            <td class="goods_image">
                <a href="${cpath}/products/productsDetail?goods_id=${item.products_idx }">
                    <img width="75" alt="" src="${cpath}/mypage/thumbnails?products_idx=${item.products_idx}&fileName=${item.img_url}"  />
                </a>
            </td>

            <td>
                <h2>
                    <a href="${cpath}/goods/goodsDetail.do?goods_id=${item.products_idx }">${item.products_name }</a>
                </h2>
            </td>

            <td class="price">
                <span>${item.products_price }원</span>
            </td>




            <td><!--POST 방식으로 넘기고 싶다면 자바스크립트를 이용해야한다-->
                <a href="javascript:delete_wish_elements('${item.favorites_idx}');">
                    삭제
                </a>
            </td>

            <td>
                <a href="javascript:toCartfromWish('${item.favorites_idx}');">
                    장바구니 추가
                </a>
            </td>

                <%--
               <td>
                <a href="javascript:fn_order_each_goods('${item.goods_id }','${item.goods_title }','${item.goods_sales_price}','${item.goods_fileName}');">
                 <img width="75" alt=""  src="${cpath}/resources/image/btn_order.jpg">
                </a><br>
                <a href="#">
                 <img width="75" alt=""
                      src="${cpath}/resources/image/btn_order_later.jpg">
                </a><br>
                <a href="#">
                 <img width="75" alt=""
                      src="${cpath}/resources/image/btn_add_list.jpg">
                </A><br>
                <a href="javascript:delete_cart_goods('${cart_id}');"">
                <img width="75" alt=""
                     src="${cpath}/resources/image/btn_delete.jpg">
                </a>
               </td>
            --%>
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
    function count(type,cart_idx, index)
    {
        // 결과를 표시할 element
        const resultElement = document.getElementsByClassName('cart_goods_qty')[index];
        // 현재 화면에 표시된 값
        var number = resultElement.value;

        console.log("전처리 이전:"+number);
        // 더하기/빼기
        if(type === 'plus')
        {
            number = parseInt(number) + 1;
        }
        else if(type === 'minus' && number>0)
        {
            number = parseInt(number) - 1;
        }
        console.log("전처리 이후:"+number);

        // 결과 출력
        resultElement.value = number;//input태그는 value속성을 써야한다. innertext이런걸 쓰면 안되더라.

        modify_cart_qty(cart_idx,index)

    }

    function modify_cart_qty(cart_idx,index)
    {
        //alert(index);
        // var length=document.frm_order_all_cart.cart_goods_qty.length;//카트 갯수임
        var length = document.getElementsByClassName("cart_goods_qty").length;
        console.log(parseInt(index));
        var _cart_goods_qty=33;
        if(length>1)
        { //카트에 제품이 한개인 경우와 여러개인 경우 나누어서 처리한다.
            _cart_goods_qty=document.getElementsByClassName("cart_goods_qty")[index].value;//cart가 여러개일 경우 해당하는 cart만 선택
            console.log(_cart_goods_qty);
            //(넘겨받은 index로)
        }
        else
        {
            _cart_goods_qty=document.frm_order_all_cart.cart_goods_qty.value;
            console.log("worng road");
        }

        var cart_goods_qty=Number(_cart_goods_qty);//cart의 수량 변수 포메팅
        //alert("cart_goods_qty:"+cart_goods_qty);
        console.log(cart_goods_qty);
        $.ajax(
            {
                type : "post",
                async : false, //false인 경우 동기식으로 처리한다.
                url : "${cpath}/mypage/modifyCartQty",
                data : {
                    cart_idx:cart_idx,
                    cart_goods_qty:cart_goods_qty
                },

                success : function(data, textStatus)
                {
                    //alert(data);
                    if(data.trim()=='modify_success')
                    {
                        // alert("수량을 변경했습니다!!");
                        location.reload();
                    }else
                    {
                        alert("다시 시도해 주세요!!");
                    }

                },
                error : function(data, textStatus)
                {
                    alert("에러가 발생했습니다."+data);
                },
                complete : function(data, textStatus)
                {
                    //alert("작업을완료 했습니다");
                }
            }
        ); //end ajax
    }
    function Calculator()
    {
        let total = Number(document.getElementById(""))
    }


</script>