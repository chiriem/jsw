<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>회원가입 화면</title>
    <script type="text/javascript">
        //회원가입 정보의 유효성 체크하기
        function doRegUserCheck(f) {

            if (f.user_id.value == "") {
                alert("아이디를 입력하세요.");
                f.user_id.focus();
                return false;
            }
        }
    </script>
</head>
<body>

<h1>회원가입 화면</h1>
<br/>
<br/>
<form name="f" method="post" action="/user/insertUserInfo" onsubmit="return doRegUserCheck(this);">
    <table border="1">
        <col width="150px">
        <col width="150px">
        <col width="150px">
        <col width="150px">
        <tr>
            <td>아이디</td>
            <td><input type="text" name="user_id" style="width:150px"/></td>
            <td>이름</td>
            <td><input type="text" name="user_nm" style="width:150px"/></td>
        </tr>
    </table>
    <input type="submit" value="회원가입"/>
</form>
</body>
</html>

