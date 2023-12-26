<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<head>
	<meta charset="utf-8">
	<c:if test="${message=='cancel_order'}">
		<script>
			window.onload=function()//페이지 로딩과 동시에 실행되는 함수
			{
				init();
			}

			function init()
			{
				alert("주문을 취소했습니다.");
			}
		</script>
	</c:if>
	<script>
		function fn_cancel_order(order_idx)
		{
			var answer=confirm("주문을 취소하시겠습니까?");
			if(answer==true)
			{
				var formObj=document.createElement("form");//form태그 만들고
				var i_order_idx = document.createElement("input");//안에 input태그 넣는다.

				i_order_idx.name="orders_idx";
				i_order_idx.value=order_idx;

				formObj.appendChild(i_order_idx);
				document.body.appendChild(formObj);
				formObj.method="post";
				formObj.action="${cpath}/mypage/cancelMyOrder";
				formObj.submit();
			}
		}

		function delete_cart_goods(cart_idx)
		{
			var cart_idx=Number(cart_idx);
			var formObj=document.createElement("form");
			var i_cart = document.createElement("input");
			i_cart.name="cart_idx";//input태그의 이름은 cart_idx 컨트롤러에서 RequestParam으로 받아보자
			i_cart.value=cart_idx;

			formObj.appendChild(i_cart);
			document.body.appendChild(formObj);
			formObj.method="post";
			formObj.action="${cpath}/cart/removeCart";
			formObj.submit();
		}
	</script>
</head>

<body>

<a href="/mypage/myDetailInfo"> 내정보 수정 </a>
<%--orders 와 orders_details를 조인해서 같은 VO로 묶어서 가져와라 --%>
<br><br>
	<table class="list_view">
		<tbody align=center>
			
			<tr style="background: #008080">
				<td>주문번호</td>
				<td>주문일자</td>
				<td>주문상품</td>
				<td>주문상태</td>
				<td>주문취소</td>
			</tr>
		<c:set var="orders_status" value="${order.Orders_status }"/>	
		<c:choose><%--주문한상품이 있을경우 or 없을경우 --%>
			<c:when test="${ empty myOrderList }"><%--주문 상품이 없을 경우 --%>
			<tr>
				<td colspan=5 class="fixed">
					<strong>주문한 상품이 없습니다. </strong>
				</td>
			</tr>
			</c:when>
			
			<c:otherwise><%--주문 상품이 존재할 경우 --%>
			 <c:forEach var="order" items="${ myOrderList }" varStatus="i"><%--myOrderList에는 O_P_OD_vo의 리스트 있다.  --%>
			  <c:choose>
				<c:when test="${pre_orders_idx != order.orders_idx}">
		
		    <tr><%--실제 상품 --%>
		    
		     <td><%--주문번호 --%>
		      <a href="${cpath }/mypage/myOrderDetail?orders_idx=${order.orders_idx}"><span>${order.orders_idx }</span></a>
		      <%--컨트롤러에서 받아서 주문 상세페이지 띄워주자 --%>
		     </td>
		     
		     <td>
		      <span>${order.orders_date }</span>
		     </td><%-- 주문 시간 --%>
		     
		     
		     <td align="left"><%--주문row의 상품title --%>
		      <strong>
				  <c:forEach var="order2" items="${myOrderList}" varStatus="j">
					  <c:if  test="${order.orders_idx ==order2.orders_idx}" >
						  <a href="${cpath }/product/homeProduct?productIdx=${order2.products_idx}">${order2.products_name }/${order.quantity }개</a><br>
					  </c:if>
				  </c:forEach>
		      </strong>

		     </td>     
		     
		     <td>
		      <c:choose>
		      	<c:when test="${order.orders_status =='배송 준비중' }">
				  배송 준비중
		      	</c:when>
		      	<c:when test="${order.orders_status =='delivering' }">
		      	 배송중
		      	</c:when>
		      	<c:when test="${order.orders_status =='finished_delivering' }">
		      	 배송 완료
		      	</c:when>
		      	<c:when test="${order.orders_status =='주문취소됨' }">
		      	 주문취소
		      	</c:when>
		      	<c:when test="${order.orders_status =='returning_goods' }">
		      	 반품 완료
		      	</c:when>
		      </c:choose>
		     </td>
		     
		     <td><%--배송 취소 기능 --%>
		      	<c:choose>
		      	 <c:when test="${order.orders_status=='배송 준비중' }">
		      	  <input type="button" onClick="fn_cancel_order('${order.orders_idx}')" value="주문취소"/>
		      	 </c:when>
		      	 <c:otherwise>
		      	  <input type="button" onClick="fn_cancel_order('${order.orders_idx}')" value="주문취소" disabled />
		      	 </c:otherwise>
		      	</c:choose>
		     </td>
		     
		     
		    </tr><%--실제 상품 row --%>

			   <c:set  var="pre_orders_idx" value="${order.orders_idx}" />
			  </c:when>
			 </c:choose>
		    </c:forEach>
			
			</c:otherwise><%--주문 상품이 존재할 경우 --%>
		</c:choose> <%--주문상품 있냐 없냐 여부 --%> 
		</tbody>
	</table>
	
	<hr>
	
	<h1>
	
	</h1>


</body>
</html>