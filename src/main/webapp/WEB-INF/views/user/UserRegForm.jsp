<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>MultiStudio</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet"/>

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
    <meta charset="EUC-KR">
    <title>Sign Up</title>
    <script type="text/javascript">
        //ȸ������ ������ ��ȿ�� üũ�ϱ�
        function doRegUserCheck(f) {

            if (f.user_id.value == "") {
                alert("���̵� �Է��ϼ���.");
                f.user_id.focus();
                return false;
            }

            if (f.email.value == "") {
                alert("�̸��� �Է��ϼ���.");
                f.email.focus();
                return false;
            }

            if (f.user_nm.value == "") {
                alert("�̸��� �Է��ϼ���.");
                f.user_nm.focus();
                return false;
            }

            if (f.user_pw.value == "") {
                alert("��й�ȣ�� �Է��ϼ���.");
                f.user_pw.focus();
                return false;
            }

            if (f.user_pw2.value == "") {
                alert("��й�ȣȮ���� �Է��ϼ���.");
                f.user_pw2.focus();
                return false;
            }

            if (f.age.value == "") {
                alert("����⵵�� �Է��ϼ���.");
                f.age.focus();
                return false;
            }
        }
    </script>
</head>
<body>
<div class="container-xxl position-relative bg-white d-flex p-0">
    <!-- Spinner Start -->
    <div id="spinner"
         class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <!-- Sign Up Start -->
    <div class="container-fluid">
        <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
            <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                <div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
                    <form name="f" method="post" action="/user/insertUserInfo" onsubmit="return doRegUserCheck(this);">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <a href="/index" class="">
                                <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>MultiStudio</h3>
                            </a>
                            <h3>Sign Up</h3>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" name="user_nm" placeholder="User Name">
                            <label for="floatingText">Username</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" name="user_id" placeholder="user_id">
                            <label for="floatingInput">User id</label>
                        </div>
                        <div class="form-floating mb-4">
                            <input type="password" class="form-control" name="user_pw" placeholder="Password">
                            <label for="floatingPassword">Password</label>
                        </div>
                        <div class="form-floating mb-4">
                            <input type="password" class="form-control" name="user_pw2" placeholder="Password Check">
                            <label for="floatingPassword">Password Check</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" name="age" placeholder="2000">
                            <label for="floatingText">Birth year</label>
                        </div>
                        <button type="submit" class="btn btn-primary py-3 w-100 mb-4">Sign Up</button>
                        <p class="text-center mb-0">Already have an Account? <a href="/user/loginForm">Sign In</a></p>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Sign Up End -->
</div>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/lib/chart/chart.min.js"></script>
<script src="/lib/easing/easing.min.js"></script>
<script src="/lib/waypoints/waypoints.min.js"></script>
<script src="/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="/lib/tempusdominus/js/moment.min.js"></script>
<script src="/lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Template Javascript -->
<script src="/js/main.js"></script>
</body>
</html>

