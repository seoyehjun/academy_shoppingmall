<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<link rel="stylesheet" href="${cpath}/resources/css/mypage.css">

 <h1 class="od_title">배송 현황</h1>
 <div class="delivery_state" style = "text-decoration: underline">
  ${myorderdetail[0].orders_status }
 </div>
 

<table class="list_view" style="width:80%">

 <tbody align=center>
 <h1 class="od_title">1. 주문 상세정보</h1>
  <tr>
   <th>주문 번호</th>
   <th>주문 일자</th>
   <th>썸네일</th>
   <th>주문상품명</th>
   <th>수량</th>
   <th>옵션,사이즈</th>
   <th>주문금액</th>
   <th>배송비</th>
   <th>주문금액합계</th>
   <th>예상적립금</th>
   
  </tr>
	<c:forEach var="item" items="${myorderdetail}" varStatus="cnt">
  <tr>
   
   <td>${item.orders_idx }</td>
   
   <td>${item.orders_date }</td>
   
   <%--상품 이미지(링크연결) --%>
	  <td class="goods_image">
		  <c:set var="imagePath" value="/springboot/" />
		  <c:forEach items="${img}" var="img" begin="0" end="0">
			  <div><img class="thumbnails" src="${imagePath}${item.products_idx}/${img.img_url}" alt="Product Image"/></div>
		  </c:forEach>
	  </td>
   
   <td><%--상품 이름(링크연결) --%>
    <h2>
    <%--상품 이름을 받아오기 위해 조인구문을 사용해야한다 --%>
     <a href="${cpath }/product/homeProduct?productIdx=${item.products_idx}">${item.products_name}</a>
    </h2>
   </td>
   
   
	<td><%--수량 --%>
	 <h4>${item.quantity }개<h4>
	</td>
	
	<%--옵션 --%>
	<td>
	 <h2>${item.color}</h2>
	 <br>
	 <h2>${item.size_product }</h2>
	</td>
	
	<td><%--개당 가격 --%>
	 <h2>${item.products_price }</h2>
	</td>				
					
	<td><%--배송비 --%>
	 <h2>0원</h2>
	</td>
		
	<td><%--주문금액 합계 (가격 x 수량) --%>
	 <h2>${item.quantity * item.products_price}원 </h2>
	</td>
			
	<td><%--적립은 가격의 5% --%>
	 <h2>${item.quantity * item.products_price*0.05}원</h2>
	</td>		
	
  </tr>
	</c:forEach>
  
 </tbody>
</table>
<h1 class="od_title">2.배송지 정보 및 주문자 정보</h1>
 <div class="detail_table">
  <table>
   <tbody>
   
    <tr class="dot_line">
	 <td class="fixed_join">배송방법</td>
	  <td>
	      일반 택배<%--일반 택배로 고정 --%>
	  </td>
	</tr>
	
	<tr class="dot_line">
	 <td class="fixed_join">받으실 분</td>
	 <td>
	  ${myorderdetail[0].orders_recipient_name }
	 </td>
	</tr>
	
	<tr class="dot_line">
	 <td class="fixed_join">휴대폰번호</td>
	 <td>
	  ${myorderdetail[0].orders_recipient_phone }
	 </td>
	</tr>


	<tr class="dot_line">
	 <td class="fixed_join">주소</td>
	 <td>
	  ${myorderdetail[0].orders_address}
	 </td>
	 </tr>
	 
	<tr class="dot_line">
	 <td class="fixed_join">상세주소</td>
	 <td>
	  ${myorderdetail[0].orders_detailed_address}
	 </td>
    </tr>


   </tbody>
  </table>

 </div>



</body>
</html>