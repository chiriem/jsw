<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>ȸ������ ȭ��</title>
    <script type="text/javascript">
        //ȸ������ ������ ��ȿ�� üũ�ϱ�
        function doRegUserCheck(f) {

            if (f.user_id.value == "") {
                alert("���̵� �Է��ϼ���.");
                f.user_id.focus();
                return false;
            }
        }
    </script>
</head>
<body>

<h1>ȸ������ ȭ��</h1>
<br/>
<br/>
<form name="f" method="post" action="/SingleStudio/insertYtaddress" onsubmit="return doRegUserCheck(this);">
    <table border="1">
        <col width="150px">
        <col width="150px">
        <col width="150px">
        <col width="150px">
        <tr>
            <td>���̵�</td>
            <td><input type="text" name="user_id" style="width:150px"/></td>
            <td>�ּ�</td>
            <td><input type="text" name="yt_address" style="width:150px"/></td>
        </tr>
    </table>
    <input type="submit" value="�Է�"/>
</form>
</body>
</html>

