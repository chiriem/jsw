<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%
    //Controller �� ����� �������� �α��� �� �� ������
    String SS_USER_ID = CmmUtil.nvl((String) session.getAttribute("SS_USER_ID"));
    String res = CmmUtil.nvl((String) request.getAttribute("res"));
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>�α׾ƿ��Ǿ����ϴ�.</title>
    <%
        String msg = "";
        if (res.equals("0")) {
            msg = SS_USER_ID + "�α׾ƿ� �Ϸ�!";
        } else if (res == null) {
            msg = "�ٶ��ϴ�" + res;
        } else {
            msg = "�ý��ۿ� ������ �߻��Ͽ����ϴ�. ��� �� �ٽ� �õ��Ͽ� �ֽñ� �ٶ��ϴ�" + res;
        }
    %>
</head>
<body>
<%=msg %>
<a href="/index">go</a>
</body>
</html>