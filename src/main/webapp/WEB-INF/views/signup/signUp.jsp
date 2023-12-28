<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../header.jsp" %>

<section>
	<h1>signUp 페이지</h1>
	
	
	<form method="post">
		<p><input name="members_id" placeholder="아이디" required></p>
		<p><input name="members_password" type="password" placeholder="패스워드" required></p>
		<p><input name="members_nickname" placeholder="닉네임" required></p>

		<div id="mail_input" name="mail_input">
			<input type="text" name="members_email" id="members_email" placeholder="이메일 입력">
			<button type="button" id="sendBtn" name="sendBtn" onclick="sendNumber()">인증번호 발송</button>
		</div>

		<div id="mail_number" name="mail_number" style="display: none">
			<input type="text" name="number" id="number" placeholder="인증번호 입력">
			<button type="button" name="confirmBtn" id="confirmBtn" onclick="confirmNumber()">이메일 인증</button>
		</div>
		<br>
		<input type="text" id="Confirm" name="Confirm" style="display: none" value="">


		<div class="form-group">
			<h3>주소</h3>
			<div style="display: flex; align-items: center;">
				<input class="form-control" style="width: 40%;" placeholder="우편번호"
					   name="members_address_number" id="members_address_number" type="text" readonly="readonly">
				<button type="button" class="btn btn-default" onclick="execPostCode();">
					<i class="fa fa-search"></i> 우편번호 찾기</button>
			</div>
			<div style="margin-top: 5px;">
				<input class="form-control" placeholder="도로명 주소"
					   name="members_address" id="members_address" type="text" readonly="readonly" />
			</div>
			<div style="margin-top: 5px;">
				<input class="form-control" placeholder="상세주소"
					   name="members_detailed_address" id="members_detailed_address" type="text" />
			</div>
			<div style="margin-top: 5px;">
				<input class="form-control" placeholder="참고항목"
					   name="members_address_building" id="members_address_building" type="text" />
			</div>

		<p><input name="members_phone_number" placeholder="전화번호" required></p>
		<p><input name="members_name" placeholder="이름" required></p>
		<p><input name="members_ssn" placeholder="주민번호" required></p>
		
		<button>회원가입</button>
		<button type="button" onclick="printAllInputValues()">모든 입력 데이터 출력</button>
	</form>

	
	
</section>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function sendNumber(){
		$("#mail_number").css("display","block");
		$.ajax({
			url:"/mail",
			type:"post",
			dataType:"json",
			data:{"mail" : $("#members_email").val()},
			success: function(data){
				alert("인증번호 발송");
				$("#Confirm").attr("value",data);
			},
			error: function (request, status, error){
                console.log("Error status: ", request.status);
                console.log("Error details: ", error);
				alert("발송에 실패했습니다.");
			}

		});
	}

	function confirmNumber(){
		var number1 = $("#number").val();
		var number2 = $("#Confirm").val();

		console.log(number1);
		console.log(number2);

		if(number1 === number2){
			alert("인증되었습니다.");
		}else{
			alert("인증에 실패하였습니다.");
		}
	}

	function printAllInputValues() {
		$("input").each(function() {
			var inputName = $(this).attr('name'); // 현재 input 요소의 name
			var inputValue = $(this).val();       // 현재 input 요소의 값
			console.log(inputName + ": " + inputValue);
		});
	}


</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execPostCode() {
		new daum.Postcode({
			oncomplete: function (data) {
				var addr = '';
				var extraAddr = '';

				if (data.userSelectedType === 'R') {
					addr = data.roadAddress;
				} else {
					addr = data.jibunAddress;
				}

				if (data.userSelectedType === 'R') {
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					document.getElementById("members_address_building").value = extraAddr;
				} else {
					document.getElementById("members_address_building").value = '';
				}

				document.getElementById("members_address_number").value = data.zonecode;
				document.getElementById("members_address").value = addr;
				document.getElementById("members_detailed_address").focus();
			}
		}).open();
	}
</script>



</body>
</html>