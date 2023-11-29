<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
    <h1>KREAM</h1>
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

                <a href="../find/findID"><button>아이디 찾기</button></a>
                <a href="../find/findPW"><button>비밀번호 찾기</button></a>
            </article>

        </section>
</body>
</html>