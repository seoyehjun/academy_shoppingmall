<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>



<h1>배송 현황</h1>
 <div style = "text-decoration: underline">
  ${myorderdetail[0].orders_status }
 </div>
 
<h1>1. 주문 상세정보</h1>
<table class="list_view" style="width:80%">
 <tbody align=center>
  <tr style="background: #008080">
   <td>주문 번호</td>
   <td>주문 일자</td>
   <td>썸네일</td>
   <td>주문상품명</td>
   <td>수량</td>
   <td>옵션,사이즈</td>
   <td>주문금액</td>
   <td>배송비</td>
   <td>주문금액합계</td>
   <td>예상적립금</td>
   
  </tr>
	<c:forEach var="item" items="${myorderdetail}" varStatus="cnt">
  <tr>
   
   <td>${item.orders_idx }</td>
   
   <td>${item.orders_date }</td>
   
   <%--상품 이미지(링크연결) --%>
   <td class="godds_image">
    <a href="${cpath }/product/homeProduct?productIdx=${item.products_idx}">
    <%--프로젝트 내 resources폴더에 공백 이미지 추가 --%>
     <IMG width="75" alt="" src="${cpath }/mypage/thumbnails?products_idx=${item.products_idx }&fileName=${item.img_url }">
    </a>
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
<h1>2.배송지 정보 및 주문자 정보</h1>
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
	  ${myorderdetail[0].orders_recipient_address}
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