<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="../header.jsp"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="myCartList"  value="${cartList}"  />
<%--<c:set var="myProductsList"  value="${cartMap.myProductsList}"  />--%>

<c:set  var="totalGoodsPrice" value="0"/>
<c:set  var="totalGoodsNum" value="0" />  <!--�ֹ� ���� -->
<c:set  var="totalDeliveryPrice" value="0" /> <!-- �� ��ۺ� -->
<c:set  var="totalDiscountedPrice" value="0" /> <!-- �� ���αݾ� -->

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<head>
 <script>

  function fn_order_all_cart_goods(){
//	alert("��� �ֹ��ϱ�");
   var order_goods_qty;
   var order_goods_id;
   var objForm=document.frm_order_all_cart;
   var cart_goods_qty=objForm.cart_goods_qty;
   var h_order_each_goods_qty=objForm.h_order_each_goods_qty;
   var checked_goods=objForm.checked_goods;
   var length=checked_goods.length;


   //alert(length);
   if(length>1){
    for(var i=0; i<length;i++){
     if(checked_goods[i].checked==true)
     {
      order_goods_id=checked_goods[i].value;
      order_goods_qty=cart_goods_qty[i].value;
      cart_goods_qty[i].value="";
      cart_goods_qty[i].value=order_goods_id+":"+order_goods_qty;
      //alert(select_goods_qty[i].value);
      console.log(cart_goods_qty[i].value);
     }
    }
   }else{
    order_goods_id=checked_goods.value;
    order_goods_qty=cart_goods_qty.value;
    cart_goods_qty.value=order_goods_id+":"+order_goods_qty;
    //alert(select_goods_qty.value);
   }

   objForm.method="post";
   objForm.action="${contextPath}/order/orderAllCartGoods.do";
   objForm.submit();
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


<table class="list_view">
  <tbody align=center >

  <tr style="background:#33ff00" >
   <td class="fixed" >����</td>
   <td colspan=2 class="fixed">��ǰ��</td>
   <td>����</td>
   <td>�ǸŰ�</td>
   <td>����</td>
   <td>�հ�</td>
   <td>�ֹ�</td>
 </tr>

 <c:choose>

  <c:when test="${ empty myCartList }">

   <tr>
   <td colspan=8 class="fixed">
    <strong>��ٱ��Ͽ� ��ǰ�� �����ϴ�.</strong>
   </td>
  </tr>

  </c:when>

  <c:otherwise>

 <tr>
  <form name="frm_order_all_cart">
   <c:forEach var="item" items="${myCartList }" varStatus="cnt">
  <%-- <c:set var="cart_goods_qty" value="${myCartList[cnt.count-1].cart_goods_qty}" />
    <c:set var="cart_id" value="${myCartList[cnt.count-1].cart_id}" /> --%>
    <input type = "text" id="cart_idx" value="${item.cart_idx}">

    <td>
     <input type="checkbox" name="checked_goods"  checked  value="${item.products_idx }"  onClick="calcGoodsPrice(${item.products_price },this)">
    </td>

    <td class="goods_image">
    <a href="${contextPath}/products/productsDetail?goods_id=${item.products_idx }">
     <img width="75" alt="" src="${contextPath}/thumbnails.do?goods_id=${item.products_idx}&fileName=${item.img_url}"  />
    </a>
   </td>

   <td>
    <h2>
     <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.products_idx }">${item.products_name }</a>
    </h2>
   </td>

   <td class="price">
    <span>${item.products_price }��</span>
   </td>

   <td>
    <input type='button' onclick='count("minus",${item.cart_idx},${cnt.count-1})' value='-'/>
    <input type="text" id="cart_goods_qty" name="cart_goods_qty" class="cart_goods_qty" size=3 value="${item.quantity}"><br><!--��ٱ��� ������ ���� <input>�����̴�.-->
    <input type='button' onclick='count("plus",${item.cart_idx},${cnt.count-1})' value='+'/>
    <a href="javascript:modify_cart_qty('${item.cart_idx }','${cnt.count-1 }');" >
     <img width=25 alt=""  src="${contextPath}/resources/image/btn_modify_qty.jpg">
    </a>
   </td>

   <td>
    <strong>
     <fmt:formatNumber  value="${item.quantity*item.products_price}" type="number" var="total_sales_price" />
      ${total_sales_price}��<!--��ٱ��� ������ �ݾ� ����-->
    </strong>
   </td>

    <%--
   <td>
    <a href="javascript:fn_order_each_goods('${item.goods_id }','${item.goods_title }','${item.goods_sales_price}','${item.goods_fileName}');">
     <img width="75" alt=""  src="${contextPath}/resources/image/btn_order.jpg">
    </a><br>
    <a href="#">
     <img width="75" alt=""
          src="${contextPath}/resources/image/btn_order_later.jpg">
    </a><br>
    <a href="#">
     <img width="75" alt=""
          src="${contextPath}/resources/image/btn_add_list.jpg">
    </A><br>
    <a href="javascript:delete_cart_goods('${cart_id}');"">
    <img width="75" alt=""
         src="${contextPath}/resources/image/btn_delete.jpg">
    </a>
   </td>
--%>
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
  <td class="fixed">�� ��ǰ�� </td>
  <td>�� ��ǰ�ݾ�</td>
  <td>  </td>
  <td>�� ��ۺ�</td>
  <td>  </td>
  <td>���� �����ݾ�</td>
 </tr>

 <tr cellpadding=40  align=center >
  <td id="">
   <p id="p_totalGoodsNum">${totalGoodsNum}�� </p>
   <input id="h_totalGoodsNum"type="hidden" value="${totalGoodsNum}"  />
  </td>

  <td>
   <p id="p_totalGoodsPrice">
    <fmt:formatNumber  value="${totalGoodsPrice}" type="number" var="total_goods_price" />
    ${total_goods_price}��
   </p>
   <input id="h_totalGoodsPrice"type="hidden" value="${totalGoodsPrice}" />
  </td>

  <td>
   <img width="25" alt="" src="${contextPath}/resources/image/plus.png">
  </td>

  <td>
   <p id="p_totalDeliveryPrice">${totalDeliveryPrice }��  </p>
   <input id="h_totalDeliveryPrice"type="hidden" value="${totalDeliveryPrice}" />
  </td>


  <td>
   <img width="25" alt="" src="${contextPath}/resources/image/equal.png">
  </td>

  <td>
   <p id="p_final_totalPrice">
    <fmt:formatNumber  value="${totalGoodsPrice+totalDeliveryPrice-totalDiscountedPrice}" type="number" var="total_price" />
    ${total_price}��
   </p>
   <input id="h_final_totalPrice" type="hidden" value="${totalGoodsPrice+totalDeliveryPrice-totalDiscountedPrice}" />
  </td>

 </tr>
 </tbody>
</table>

<script>

    function count(type,cart_idx, index)
    {
        // ����� ǥ���� element
        const resultElement = document.getElementsByClassName('cart_goods_qty')[index];
        // ���� ȭ�鿡 ǥ�õ� ��
        var number = resultElement.value;

        console.log("��ó�� ����:"+number);
        // ���ϱ�/����
        if(type === 'plus')
        {
            number = parseInt(number) + 1;
        }
        else if(type === 'minus')
        {
            number = parseInt(number) - 1;
        }
        console.log("��ó�� ����:"+number);

        // ��� ���
        resultElement.value = number;//input�±״� value�Ӽ��� ����Ѵ�. innertext�̷��� ���� �ȵǴ���.

        modify_cart_qty(cart_idx,index)

    }

 function modify_cart_qty(cart_idx,index)
 {
  //alert(index);
 // var length=document.frm_order_all_cart.cart_goods_qty.length;//īƮ ������
  var length = document.getElementsByClassName("cart_goods_qty").length;
  console.log(parseInt(index));
  var _cart_goods_qty=33;
  if(length>1)
  { //īƮ�� ��ǰ�� �Ѱ��� ���� �������� ��� ����� ó���Ѵ�.
   _cart_goods_qty=document.getElementsByClassName("cart_goods_qty")[index].value;//cart�� �������� ��� �ش��ϴ� cart�� ����
   console.log(_cart_goods_qty);
   //(�Ѱܹ��� index��)
  }
  else
  {
   _cart_goods_qty=document.frm_order_all_cart.cart_goods_qty.value;
   console.log("worng road");
  }

  var cart_goods_qty=Number(_cart_goods_qty);//cart�� ���� ���� ������
  //alert("cart_goods_qty:"+cart_goods_qty);
  console.log(cart_goods_qty);
  $.ajax(
          {
           type : "post",
           async : false, //false�� ��� ��������� ó���Ѵ�.
           url : "${contextPath}/mypage/modifyCartQty",
           data : {
            cart_idx:cart_idx,
            cart_goods_qty:cart_goods_qty
           },

           success : function(data, textStatus)
           {
            //alert(data);
            if(data.trim()=='modify_success')
            {
            // alert("������ �����߽��ϴ�!!");
             location.reload();
            }else
            {
             alert("�ٽ� �õ��� �ּ���!!");
            }

           },
           error : function(data, textStatus)
           {
            alert("������ �߻��߽��ϴ�."+data);
           },
           complete : function(data, textStatus)
           {
            //alert("�۾����Ϸ� �߽��ϴ�");
           }
          }
  ); //end ajax
 }


</script>