<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
    <section class="WebName">
        <img alt="" src="">
    </section>

    <section>
        <article class="login">
            <form method="POST">
                <p><input name="members_id" placeholder="users@email.com" required></p>
                <p><input name="members_password" type="password" placeholder="password" required></p>

                <button>로그인</button>
            </form>

            <button class="ID">아이디 찾기</button>
            <button class="PW">비밀번호 찾기</button>

            <c:if test="${not empty loginError}">
                <div style="color: red;">
                    ${loginError}
                </div>
            </c:if>
        </article>

    </section>

    <script>
        document.querySelector('.ID').onclick = () => {
            let popup = open('find/findID', '_blank',
            'top=100, right=100, width=500, height=200');
        }
        document.querySelector('.PW').onclick = () => {
            let popup = open('find/findPW', '_blank',
            'top=100, right=100, width=500, height=200');
        }
    </script>
</body>
</html>