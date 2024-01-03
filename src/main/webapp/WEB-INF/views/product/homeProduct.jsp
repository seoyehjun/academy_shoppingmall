<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link rel="stylesheet" href="${cpath}/resources/css/style.css">
<body>
	
	<div class="board">
		
		<c:forEach items="${list}" var="product" begin="0" end="0">
			 <c:forEach items="${img}" var="img" begin="0" end="0">
             <c:set var="imagePath" value="/springboot/" />
             <div><img src="${imagePath}${product.products_idx}/${img.img_url}" alt="Product Image" width="200px" height="740px"/></div>
             </c:forEach>
        </c:forEach>

		
	
		<div class="info">
			<h2>${list[0].products_name}</h2>
			<hr>
			<h5>[추천상품]/[Best]</h5>


			<c:if test ="${not empty list}">
				<tr>
					<th>판매가</th>
					<td>${list[0].products_price}</td>
				</tr>
				<br>
				<tr>
					<th>피팅 사이즈 :</th>
					<td>모델 FREE 사이즈 착용 <br> 178cm / 60kg 상의 95-100 / 하의 29-30<br>
						181cm / 68kg 상의 95-100 / 하의 29-30<br>
					</td>
				</tr>
				<br>
			</c:if>
			<form action="${cpath}/product2/orderProduct" method="POST" onsubmit="return validateForm();">
				<table>
					<tr> 
						<th>사이즈</th>
						<td><select class="box1" name="size_product">
								<option>사이즈를 선택하세요</option>
								<c:forEach var="i" begin="0" end="${num - 1}">
    							<option>${list[i].size_product}</option>
								</c:forEach> 
						</select>

						<td>
					</tr>
					<br> 
					<tr>
						<th>색상</th>
						<td><select class="box2" name="color">
								<option>상품 및 색상을 선택하세요</option>
								<c:forEach var="row" items="${color }">
		
								<option>${row.color }</option>
								</c:forEach>
						</select>

						<td>
					</tr>
					 <tr>
                         <th>수량</th>
                         <td>
                             <div class="quantity-container">
                                 <button type="button" onclick="decrementQuantity()">-</button>
                                 <input type="text" id="quantityInput" name="quantity" value="1" readonly>
                                 <button type="button" onclick="incrementQuantity()">+</button>
                             </div>
                         </td>
                     </tr>
				</table>
				<br> 

				<div>
                        <h3>수량 및 가격</h3>
                        <p>선택한 수량: <span id="selectedQuantity">1</span></p>
                        <p>총 가격: <span id="totalPrice">${list[0].products_price}</span></p>
                </div>

				<input name="products_idx" type="hidden" value="${list[0].products_idx}">

				 <div class="button">
			        <button type="submit" class="works" name="action" value="BUY">BUY IT NOW</button><br>	    
			        <button type="submit" class="works" name="action" value="ADD">ADD TO CART</button><br>
			        <button type="submit" class="works" name="action" value="WISH">WISH LIST</button><br>
			        
    			</div>
			</form>
		</div>
	</div>
	<script>
            function validateForm() {
                var sizeProduct = document.getElementsByName("size_product")[0].value;
                var color = document.getElementsByName("color")[0].value;

                if (sizeProduct === "사이즈를 선택하세요" || color === "상품 및 색상을 선택하세요") {
                    alert("색상과 사이즈를 선택해주세요.");
                    return false;
                }

                return true;
            }
        </script>
	<script>
        function updateTotalPrice() {
            var quantityInput = document.getElementById('quantityInput');
            var selectedQuantity = document.getElementById('selectedQuantity');
            var totalPriceSpan = document.getElementById('totalPrice');
            var unitPrice = ${list[0].products_price};

            var quantity = parseInt(quantityInput.value);
            selectedQuantity.innerText = quantity;

            var totalPrice = unitPrice * quantity;

            // 소수점 이하 값이 .00이면 삭제하고 아니면 그대로 표시
            var formattedTotalPrice = (totalPrice % 1 === 0) ? totalPrice.toFixed(0) : totalPrice.toFixed(2);

            // 총 가격 span 업데이트
            totalPriceSpan.innerText = formatPrice(formattedTotalPrice) + '원';
        }

        function formatPrice(price) {
            // 정수 부분만 남기고 소수 부분은 제거
            return price.replace(/\.00$/, '');
        }
    </script>

   <script>
       function decrementQuantity() {
           var quantityInput = document.getElementById('quantityInput');
           var currentQuantity = parseInt(quantityInput.value);

           if (currentQuantity > 1) {
               quantityInput.value = currentQuantity - 1;
               updateTotalPrice();
           }
       }

       function incrementQuantity() {
           var quantityInput = document.getElementById('quantityInput');
           var currentQuantity = parseInt(quantityInput.value);

           quantityInput.value = currentQuantity + 1;
           updateTotalPrice();
       }

       function formatPrice(price) {
           // 정수 부분만 남기고 소수 부분은 제거
           return price.toFixed(2).replace(/\.00$/, '');
       }

       function updateTotalPrice() {
           var quantityInput = document.getElementById('quantityInput');
           var selectedQuantity = document.getElementById('selectedQuantity');
           var totalPriceSpan = document.getElementById('totalPrice');
           var unitPrice = ${list[0].products_price};

           var quantity = parseInt(quantityInput.value);
           selectedQuantity.innerText = quantity;

           var totalPrice = unitPrice * quantity;
           totalPriceSpan.innerText = formatPrice(totalPrice) + '원';
       }

   </script>
	<div class="main">
        <div>
              <c:forEach items="${list}" var="product" begin="0" end="0">
                  <c:forEach items="${img}" var="img" begin="0" end="100">
                  <img class="main-1" src="${cpath }/springboot/${product.products_idx}/${img.img_url }" width="400px" height="500px">
                  </c:forEach>
              </c:forEach>
        </div>
	</div>

	<footer>
		<table class="table-2">
			<tr>
				<th>상품결제정보</th>
				<td>고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의 사용이나 타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다.<br>  
				<br><br>
				무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다.  
				주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며 입금되지 않은 주문은 자동취소 됩니다.</td>
			</tr>
			
			<tr>
				<th>배송정보</th>
				<td>유루이는 CJ대한통운 택배사를 이용하고 있습니다 ( 대표번호 1588 - 1255 )<br>
				배송기간은 주문 후 2-5일정도 소요되며 제작이 지연되는 경우 배송이 예정일보다 늦어질 수 있습니다.<br>
				(주말 및 공휴일은 배송이 되지 않기 때문에 배송기간에서 제외 됩니다)<br>
				<br>
				구매하시는 물품이 7만원 이상일 경우 배송료는 무료이며 7만원 이하일 경우 3000원의 배송료가 추가 됩니다.<br>
				제주도 및 산간지역은 추가로 배송료가 부과될 수 있습니다. </td>
			</tr>
			
			<tr>
				<th>교환 및 반품정보</th>
				<td>교환/반품 시에는 꼭 수령후 24시간 이내에 게시판 or 콜센터(02-790-9737) 로 접수 부탁드립니다.<br>



				절차없이 배송하시는 경우,<br>
				
				무통보 반송처리 되실 수 있으니 유의해주시기 바랍니다.<br>
				
				간혹 전화가 안되는 경우,<br>
				
				Q&A 게시판에 문의주시면 답변 도와드리겠습니다.<br>
				
				
				<br>
				제품은 물품 수령일을 기준으로 유루이에 7일 이내로 도착하여야 합니다.<br>
				
				<br>
				
				상품 수령을 한 날로부터 7일이내에 청약을 철회(교환/반품)를 할 수 있습니다.<br>
				<br>
				상담시간내에 고객센터로 또는 사이트 Q&A게시판에 철회의사를 남겨주세요.<br>
				배송비는 분실위험이 있기 때문에 무통장입금을 원칙으로 하고있습니다. ( 동봉된 배송비가 분실 될 시 책임지지 않습니다. )<br>
				
				<br>
				
				반품/교환 택배접수시 반드시 CJ대한통운 반품접수를 이용해주셔야하며, 타택배 이용시 선불로 보내주셔야 합니다.<br>
				<br>
				
				
				구매.소비자의 책임으로 상품이 훼손 또는 변형된 경우 반품이 불가능합니다.<br>
				<br>
				불량반품 후 불량사항이 소비자의 실수로 인한 훼손 또는 변형된<br>
				상품으로 판명될 경우 전자상거래에 의한 소비자 보호에 관한 법률에 의거 손해배상을 청구할 수 있습니다.<br>
				<br>
				의류에 부착된 택이나 투명봉투, 또는 봉투의 바코드 라벨이 제거/훼손된 경우 교환.반품.환불이 불가능합니다.<br>
				
				더 자세한 안내는 공지사항을 참고해주세요</td>
			</tr>
			
		</table>
		
		<div class="review">
			<ul>
				<li>닉네임</li>
				<li>작성내용</li>
			</ul>
			<c:forEach var="row" items="${review}">
			<ul>			

				<li>${row.members_idx}</li>
				<li>${row.inquiries_content}</li>
			 
			</ul>
			</c:forEach>
		</div>	
	<c:if test ="${not empty user}">	
	<form method="POST">
		<p><input name="inquiries_title" required value="구매후기" type="hidden"></p>
		<p><input name="inquiries_category" required value="구매후기" type="hidden"></p>
		<p><input name="members_idx" placeholder="작성자" required value="${user.members_idx }" type="hidden"></p>
		<p><textarea name="inquiries_content" required></textarea></p>
		<p><input name="products_idx" required value="4"></p>
		
		<button>작성</button>
	</form>
	</c:if>
	</footer>
	
	
</body>
</html>