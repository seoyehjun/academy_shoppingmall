<!--https://kimvampa.tistory.com/267-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cpath"  value="${pageContext.request.contextPath}"  />
<c:set var="myCartList"  value="${cartList}"  />
<%--<c:set var="myProductsList"  value="${cartMap.myProductsList}"  />--%>

<c:set  var="totalGoodsPrice" value="0"/>
<c:set  var="totalGoodsNum" value="0" />  <!--주문 개수 -->
<c:set  var="totalDeliveryPrice" value="0" /> <!-- 총 배송비 -->
<c:set  var="totalDiscountedPrice" value="0" /> <!-- 총 할인금액 -->


<link rel="stylesheet" href="${cpath}/resources/css/mypage.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<head>

  <script>


   window.onload=function()//페이지 로딩과 동시에 실행되는 함수
   {
    <c:if test="${message=='remove_Cart'}">
    init();
    <c:remove var="message"/>


   }

   function init()
   {
    alert("장바구니 삭제");
   } </c:if>
  </script>


 <script>


  function fn_order_all_cart()
  {

   var formObj = document.createElement("form");
   document.body.appendChild(formObj);
   //	alert("모두 주문하기");
   var total_price = document.getElementsByName("total_price")[0].value;
   var checkbox=document.getElementsByName("checkbox");
   //var cart_list = [];

   var length = checkbox.length;
   console.log("length:"+length)
   var count =0;
   for(var i=0; i<length;i++)
   {

    if(checkbox[i].checked==true)
    {
     count= count+1;
     var temp_input = document.createElement("input");
     temp_input.setAttribute("value", checkbox[i].value+"");
     temp_input.setAttribute("hidden",true);
     // 임시 <input>태그 만들어서 value속성 정해준다.

     temp_input.name = "cart_list" ;
     // 임시 <input>태그의 name 속성 정해준다. --> cart_list라는 이름을 가진 input태그들을 밑의form태그에 붙여준다.

     formObj.appendChild(temp_input);
     // 임시 <input>태그들을 formObj태그에 붙여준다.(formOnject는 위에서 임시로 만든거임)

    }
   }
   if(count==0)
   {
    location.replace("/mypage/myCartList");
    alert("선택된 품목이 없습니다!");
    return;
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
<button class="custom-btn btn-16" onclick="location.href='/mypage/wishList' ">찜목록</button>
</div>
<br><br><br>
<table class="list_view">
  <tbody align=center >

  <tr>
   <th class="fixed" >구분</th>
   <th>이미지</th>
   <th>상품명</th>
   <th>정가</th>
   <th>수량</th>
   <th>합계</th>
   <th>주문</th>
 </tr>

 <c:choose>

  <c:when test="${ empty myCartList }">

   <tr>
   <td colspan=8 class="fixed">
    <strong>장바구니에 상품이 없습니다.</strong>
   </td>
  </tr>

  </c:when>

  <c:otherwise>
 <c:forEach var="item" items="${myCartList }" varStatus="cnt">
 <tr class="cart_row">
  <form name="frm_order_all_cart">

    <td>
     <input type="checkbox" name="checkbox" class="individual_cart_checkbox"  checked  value="${item.cart_idx }">
    </td>

    <td class="goods_image">
     <c:set var="imagePath" value="/springboot/" />
     <c:forEach items="${img}" var="img" begin="0" end="2">
      <div><img class="thumbnails" src="${imagePath}${item.products_idx}/${img.img_url}" alt="Product Image"/></div>
     </c:forEach>
   </td>

   <td>
    <h2>
     <a href="${cpath}/product/homeProduct?productIdx=${item.products_idx}">${item.products_name }</a>
    </h2>
   </td>

   <td class="price">
    <span>${item.products_price }원</span>
   </td>

   <td id="plusminus">
    <input type='button' onclick='count("plus",${item.cart_idx},${cnt.count-1})' value='+'/>
    <input type="text" id="cart_goods_qty" name="cart_goods_qty" class="cart_goods_qty" size=3 value="${item.quantity}"><br><!--장바구니 개개의 갯수 <input>형식이다.-->
    <input type='button' onclick='count("minus",${item.cart_idx},${cnt.count-1})' value='-'/>
   </td>

   <td>
    <strong>
     <!--<fmt:formatNumber  value="${item.quantity*item.products_price}" type="number" var="total_sales_price" />-->
     <input type="hidden" class="individual_total_price" value=${item.quantity*item.products_price}>
      ${item.quantity*item.products_price}원<!--장바구니 개개의 금액 총합-->
    </strong>
   </td>

    <td><!--a 태그를 사용해도 잘동작,하지만 button을 사용할거면 type="button"을 잊어선 안된다-->
     <button type="button" class="custom-btn btn-5" onclick="javascript:delete_cart_goods('${item.cart_idx}')"><span>삭제</span></button>
    </td>
  </form>


  <c:set  var="totalGoodsPrice" value="${totalGoodsPrice+item.products_price*item.quantity }" />
  <c:set  var="totalGoodsNum" value="${totalGoodsNum+1 }" />
    </tr>
   </c:forEach>

  </tbody>
 </table>
   <div class="clear"></div>
  </c:otherwise>
 </c:choose>

<br><br>


<table  width=80%   class="list_view" style="background:#cacaff">
 <tbody>
 <tr  align=center  class="fixed" >
  <td class="fixed">총 상품수 </td>
  <td>총 상품금액</td>
  <td>  </td>
  <td>총 배송비</td>
  <td>  </td>
  <td>최종 결제금액</td>
 </tr>

 <tr cellpadding=40  align=center >
  <td id="">
   <p id="p_totalGoodsNum" class="totalCount_span">${totalGoodsNum}개 </p>
  <!-- <input id="h_totalGoodsNum"type="hidden" value="${totalGoodsNum}"  />-->
  </td>

  <td>
   <span class="totalPrice_span"></span>
  <!-- <input id="h_totalGoodsPrice"type="hidden" value="${total_goods_price}" />-->
  </td>

  <td>
   <img width="25" alt="" src="${cpath}/resources/image/plus.png">
  </td>

  <td>
   <p id="p_totalDeliveryPrice">${totalDeliveryPrice }원  </p>
   <!--<input id="h_totalDeliveryPrice"type="hidden" value="${totalDeliveryPrice}" />-->
  </td>


  <td>
   <img width="25" alt="" src="${cpath}/resources/image/equal.png">
  </td>

  <td>
   <p id="p_final_totalPrice" class="finalTotalPrice_span">
   </p>
  <input id="h_final_totalPrice" name="total_price" type="hidden" value="${totalGoodsPrice+totalDeliveryPrice-totalDiscountedPrice}" />
  </td>

 </tr>
 </tbody>
</table>

<c:if test="${myCartList ne null}">

 <div class="button_position"><button class="custom-btn btn-16" onclick="javascript:fn_order_all_cart()" >모두 주문</button></div>
</c:if>

</body>



<script>
 $(document).ready(function(){
  setTotalInfo();
 })

 /* 체크여부에따른 종합 정보 변화 */
 $(".individual_cart_checkbox").on("change", function(){
  setTotalInfo($(".cart_info_td"));
 });

 function setTotalInfo()
 {
  //console.log('checkbox well executed');
  let totalPrice = 0;				// 총 가격
  let totalCount = 0;				// 총 갯수
  let totalKind = 0;				// 총 종류
  let totalPoint = 0;				// 총 마일리지
  let deliveryPrice = 0;			// 배송비
  let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)


  $(".cart_row").each(function(index, element)
  {
   if($(element).find(".individual_cart_checkbox").is(":checked") === true) {
    console.log('checkbox well executed');
    // 총 가격
    totalPrice += parseInt($(element).find(".individual_total_price").val());
    // 총 갯수
    totalCount += parseInt($(element).find(".cart_goods_qty").val());
    // 총 종류
    totalKind += 1;
    // 총 마일리지
    totalPoint += parseInt($(element).find(".individual_totalPoint_input").val());
   }
  });


  /* 배송비 결정 */
  if(totalPrice >= 30000)
  {
   deliveryPrice = 0;
  }
  else if(totalPrice == 0)
  {
   deliveryPrice = 0;
  }
  else
  {
   deliveryPrice = 3000;
  }

  finalTotalPrice = totalPrice + deliveryPrice;

  /* ※ 세자리 컴마 Javscript Number 객체의 toLocaleString() */

  // 총 가격
  $(".totalPrice_span").text(totalPrice.toLocaleString());
  // 총 갯수
  $(".totalCount_span").text(totalCount);
  // 총 종류
  $(".totalKind_span").text(totalKind);
  // 총 마일리지
  $(".totalPoint_span").text(totalPoint.toLocaleString());
  // 배송비
  $(".delivery_price").text(deliveryPrice);
  // 최종 가격(총 가격 + 배송비)
  $(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
 }


 function delete_cart_goods(cart_idx)
 {
  var cart_idx=Number(cart_idx);
  var formObj=document.createElement("form");
  var i_cart = document.createElement("input");
  i_cart.setAttribute("hidden",true);
  i_cart.name="cart_idx";
  i_cart.value=cart_idx;

  formObj.appendChild(i_cart);
  document.body.appendChild(formObj);
  formObj.method="post";
  formObj.action="${cpath}/mypage/removeCart";
  formObj.submit();// form 안에 있는 button태그는 기본적으로 submit이다.
 }

 function count(type,cart_idx, index)
 {
  // 결과를 표시할 element
  const resultElement = document.getElementsByClassName('cart_goods_qty')[index];
  // 현재 화면에 표시된 값
  var number = resultElement.value;

  // 더하기/빼기
  if(type === 'plus')
  {
   number = parseInt(number) + 1;
  }
  else if(type === 'minus' && number>1)
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
  }
  else
  {
   _cart_goods_qty=document.frm_order_all_cart.cart_goods_qty.value;
  }

  var cart_goods_qty=Number(_cart_goods_qty);//cart의 수량 변수 포메팅
  $.ajax(
          {
           type : "post",
           async : true, //false인 경우 동기식으로 처리한다.
           url : "${cpath}/mypage/modifyCartQty",
           data : {
            cart_idx:cart_idx,
            cart_goods_qty:cart_goods_qty
           },

           success : function(data, textStatus)
           {
            if(data.trim()=='modify_success')
            {
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