<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../header.jsp" %>

<section>
	<h1>signUp 페이지</h1>
	
	
	<form method="post" action="">
		<p><input name="members_id" placeholder="아이디" required></p>
		<p><input name="members_password" type="password" placeholder="패스워드" required></p>
		<p><input name="members_nickname" placeholder="닉네임" required></p>

		<div id="mail_input" name="mail_input">
			<input type="text" name="mail" id="mail" placeholder="이메일 입력">
			<button type="button" id="sendBtn" name="sendBtn" onclick="sendNumber()">인증번호 발송</button>
		</div>

		<div id="mail_number" name="mail_number" style="display: none">
			<input type="text" name="number" id="number" placeholder="인증번호 입력">
			<button type="button" name="confirmBtn" id="confirmBtn" onclick="confirmNumber()">이메일 인증</button>
		</div>

		<p><input name="members_address" placeholder="주소" required></p>
		<p><input name="members_detailed_address" placeholder="상세주소" required></p>
		<p><input name="members_phone_number" placeholder="전화번호" required></p>
		<p><input name="members_name" placeholder="이름" required></p>
		<p><input name="members_ssn" placeholder="주민번호" required></p>
		
		<button>회원가입</button>
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
			data:{"mail" : $("#mail").val()},
			success: function(data){
				alert("인증번호 발송");
				$("#Confirm").attr("value",data);
			}
		});
	}

	function confirmNumber(){
		var number1 = $("#number").val();
		var number2 = $("#Confirm").val();

		if(number1 === number2){
			alert("인증되었습니다.");
		}else{
			alert("번호가 다릅니다.");
		}
	}
</script>



</body>
</html>