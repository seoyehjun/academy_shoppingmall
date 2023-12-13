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

		<p><input name="members_address" placeholder="주소" required></p>
		<p><input name="members_detailed_address" placeholder="상세주소" required></p>
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
			alert("번호가 다릅니다.");
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



</body>
</html>