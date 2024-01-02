<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style type="text/css">
        .row {
            margin: 0px auto;
            width:700px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <h3 class="text-center">글쓰기</h3>
        <form method="post" action="/mypage/addinquiries">
            <table class="table table-hover">
                <tr>
                    <th class="danger text-right" width=15%>문의 종류</th>
                    <td>
                        <input type="text" size=10 name="inquiries_category" id="domain-txt" />

                        <select  id="domain-list" onChange="" title="직접입력">
                            <option value="상품문의">상품문의</option>
                            <option value="구매후기">구매후기</option>
                            <option value="입금배송문의">입금배송문의</option>
                            <option value="교환반품문의">교환반품문의</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th class="danger text-right" width=15%>제목</th>
                    <td width=85%>
                        <input type=text name="inquiries_title" size=45 class="input-sm">
                    </td>
                </tr>
                <tr>
                    <th class="danger text-right" width=15%>내용</th>
                    <td width=85%>
                        <textarea rows="10" cols="50" name="inquiries_content"></textarea>
                    </td>
                </tr>

                <tr>
                    <td colspan="2" class="text-center">
                        <input type=submit value=글쓰기 class="btn btn-sm btn-primary"
                                 onclick="javascript:addinquiries();">
                        <input type=button value=취소 class="btn btn-sm btn-primary"
                               onclick="javascript:history.back()">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>

<script>

    //도메인 직접 입력 or domain option 선택
    const domainListEl = document.querySelector('#domain-list')
    const domainInputEl = document.querySelector('#domain-txt')
    // select 옵션 변경 시
    domainListEl.addEventListener('change', (event) => {
        // option에 있는 도메인 선택 시

        // 선택한 도메인을 input에 입력하고 disabled
        //domainInputEl.value = event.target.value
        domainInputEl.value = domainListEl.value
        domainInputEl.disabled = false
    })
</script>

</html>