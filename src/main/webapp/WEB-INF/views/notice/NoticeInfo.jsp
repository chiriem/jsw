<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="kopo.poly.dto.NoticeDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%
    NoticeDTO rDTO = (NoticeDTO) request.getAttribute("rDTO");

//공지글 정보를 못불러왔다면, 객체 생성
    if (rDTO == null) {
        rDTO = new NoticeDTO();

    }

    String ss_user_id = CmmUtil.nvl((String) session.getAttribute("SESSION_USER_ID"));

//본인이 작성한 글만 수정 가능하도록 하기(1:작성자 아님 / 2: 본인이 작성한 글 / 3: 로그인안함)
    int edit = 1;

//로그인 안했다면....
    if (ss_user_id.equals("")) {
        edit = 3;

//본인이 작성한 글이면 2가 되도록 변경
    } else if (ss_user_id.equals(CmmUtil.nvl(rDTO.getUser_id()))) {
        edit = 2;

    }

    System.out.println("user_id : " + CmmUtil.nvl(rDTO.getUser_id()));
    System.out.println("ss_user_id : " + ss_user_id);

%>
<%
    String SS_USER_ID = (String) session.getAttribute("SS_USER_ID");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>게시판 글보기</title>

    <!-- head Start -->
    <style type="text/css">
        .table_style {
            width: 300px; /* 전체 테이블 폭 지정 */
        }

        .table_style ul {
            clear: left;
            margin: 0; /*ul 에 대한 ie, ff 차이를 없애기 위해 0 으로 설정 */
            padding: 0; /*ff 는 속성에 기본 margin, padding 이 설정된 경우가 았음*/
            list-style-type: none; /* ul li 태그 사용으로 인한 disc 를 안보이도록*/
        }

        /*
        테이블 상단 보더를 만들때 아래와 같이 :first-child 선택자를 사용하는것이
        좀더 범용적인 방법이지만 IE는 IE7 이후부터만 이를 제공합니다.

        .table_style ul:first-child{
        border-top: 1px solid #000;
        }
        */
        .table_style .header {
            font-weight: bold; /*th 와 같은 볼드 효과를 만듬*/
            text-align: center; /*th 와 같은 중앙 정렬 효과를 만듬*/
            border-top: 1px solid #000; /*테이블의 상단 보더를 만듬*/
        }

        /*
        만약 첫 컬럼에 th와 같은 제목 효과를 주고자 한다면
        위에 th 속성을 구현하기 위해 사용한 두개의 속성을 없애고

        .table_style ul li:first-child {
        font-weight: bold;
        text-align: center;
        }
        와 같이 사용하면 됩니다.
        */

        .table_style ul li {
            float: left;
            margin: 0; /* 테이블 속성에 사용하던 cellspacing 과 동일 */
            padding: 2px 1px; /* 테이블 속성에 사용하던 cellpadding 과 동일 */
            border-bottom: 1px solid #000; /*테이블의 하단 보더를 만듬*/
            border-left: 1px solid #000; /*테이블의 좌측 보더를 만듬*/
        }

        /*
        각 컬럼에의 개별 폭을 지정함
        총 합(padding 과 margin 포함)이 테이블의 총 폭보다 넓으면 디자인이 깨짐
        적절하게 보일수 있도록 조정이 필요함(다른 트릭이 있을법도 한대 아직..;;;;)
        */
        .table_style ul .column1 {
            width: 60px;
        }

        .table_style ul .column2 {
            width: 160px;
        }

        .table_style ul .column3 {
            width: 70px;
            border-right: 1px solid #000; /*테이블의 우측 보더를 만듬*/
        }
    </style>
    <!-- head end -->

    <script type="text/javascript">

        //수정하기
        function doEdit() {
            if ("<%=edit%>" == 2) {
                location.href = "/notice/NoticeEditInfo?nSeq=<%=CmmUtil.nvl(rDTO.getNotice_seq())%>";

            } else if ("<%=edit%>" == 3) {
                alert("로그인 하시길 바랍니다.");

            } else {
                alert("본인이 작성한 글만 수정 가능합니다.");

            }
        }


        //삭제하기
        function doDelete() {
            if ("<%=edit%>" == 2) {
                if (confirm("작성한 글을 삭제하시겠습니까?")) {
                    <%--location.href="/notice/NoticeDelete?nSeq=<%=CmmUtil.nvl(rDTO.getNotice_seq())%>";--%>
                    //location.href="/notice/NoticeDelete";

                    let f = document.getElementById("f");


                    f.action = "/notice/NoticeDelete";
                    f.submit();

                }

            } else if ("<%=edit%>" == 3) {
                alert("로그인 하시길 바랍니다.");

            } else {
                alert("본인이 작성한 글만 삭제 가능합니다.");

            }
        }

        //목록으로 이동
        function doList() {
            location.href = "/notice/NoticeList";

        }

    </script>
</head>
<body>
<form id="f" method="post">
    <input type="hidden" name="nSeq" value="<%=CmmUtil.nvl(rDTO.getNotice_seq())%>"/>
</form>

<div class="table_style">
    <ul class="header">
        <li class="column1">제목</li>
        <li class="column1"><%=CmmUtil.nvl(rDTO.getTitle())%>
        </li>
    </ul>
    <ul>
        <li class="column1">공지글 여부</li>
        <li class="column1">예<input type="radio" name="noticeYn" value="1"
                <%=CmmUtil.checked(CmmUtil.nvl(rDTO.getNotice_yn()), "1") %>/>
            아니오<input type="radio" name="noticeYn" value="2"
                    <%=CmmUtil.checked(CmmUtil.nvl(rDTO.getNotice_yn()), "2") %>/>
        </li>
    </ul>
    <ul>
        <li class="column1">작성일</li>
        <li><%=CmmUtil.nvl(rDTO.getReg_dt())%>
        </li>
        <li class="column1">조회수</li>
        <li><%=CmmUtil.nvl(rDTO.getRead_cnt())%>
        </li>
    </ul>
    <ul>
        <li class="column1">
            <%=CmmUtil.nvl(rDTO.getContents()).replaceAll("\r\n", "<br/>") %>
        </li>
    </ul>
    <ul>
        <li class="column1">
            <a href="javascript:doEdit();">[수정]</a>
            <a href="javascript:doDelete();">[삭제]</a>
            <a href="javascript:doList();">[목록]</a>
        </li>
    </ul>
</div>
</body>
</html>