<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>MultiStudio - Multiple Streaming Studio</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/7bdf505d8f.js" crossorigin="anonymous"></script>

    <!-- Libraries Stylesheet -->
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet"/>

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <script src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script>

        function fnGetList(sGetToken) {

            var $getval = $("#search_box").val();

            if ($getval == "") {

                alert("검색어를 입력하세요.");

                $("#search_box").focus();

                return;

            }

            $("#get_view").empty();

            $("#nav_view").empty();

            //https://developers.google.com/youtube/v3/docs/search/list

            var order = "relevance";

            var maxResults = "5";

            var key = "AIzaSyAfJQyw0LqcMkaJi0hCw35NUPyjV7Br-4g";


            var sTargetUrl = "https://www.googleapis.com/youtube/v3/search?part=snippet&order=" + order

                + "&q=" + encodeURIComponent($getval) + "&key=" + key + "&maxResults=" + maxResults;

            console.log(sGetToken);

            if (sGetToken != null) {

                sTargetUrl += "&pageToken=" + sGetToken + "";

            }

            console.log(sTargetUrl);

            $.ajax({

                type: "POST",

                url: sTargetUrl,

                dataType: "jsonp",

                success: function (jdata) {

                    console.log(jdata);


                    $(jdata.items).each(function (i) {

                        //console.log(this.snippet.channelId);

                        $("#get_view").append('<tr><td><img class="tnail" src="http://img.youtube.com/vi/' + this.id.videoId + '/mqdefault.jpg" width="180" height="120"></td><td><a href="https://youtu.be/' + this.id.videoId + '">' + '<span>' + this.snippet.title + '</span></a></td></tr>');

                    }).promise().done(function () {

                        if (jdata.prevPageToken) {

                            $("#nav_view").append('<button class="btn btn-primary m-2" onclick="fnGetList(\'' + jdata.prevPageToken + '\')"><</button>');

                        }

                        if (jdata.nextPageToken) {

                            $("#nav_view").append('<button class="btn btn-primary m-2" onclick="fnGetList(\'' + jdata.nextPageToken + '\')">></button>');

                        }

                    });

                },

                error: function (xhr, textStatus) {

                    console.log(xhr.responseText);

                    alert("에러");

                    return;

                }

            });

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


    <!-- Sidebar Start -->
    <div class="sidebar pe-4 pb-3">
        <nav class="navbar bg-light navbar-light">
            <a href="index" class="navbar-brand mx-4 mb-3">
                <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>MultiStudio</h3>
            </a>
            <div class="navbar-nav w-100">
                <a href="/index" class="nav-item nav-link"><i class="fa fa-youtube-play"
                                                              aria-hidden="false"></i>Main</a>
                <a href="/MultiStudio/MultiStudio" class="nav-item nav-link"><i class="fa fa-youtube-play"
                                                                                aria-hidden="false"></i>MultiStudio</a>
                <a href="/notice/NoticeList" class="nav-item nav-link"><i class="fa fa-book" aria-hidden="false"></i>Notice</a>
                <a href="/Search2" class="nav-item nav-link active"><i class="fa fa-search" aria-hidden="false"></i>Search</a>
            </div>
        </nav>
    </div>
    <!-- Sidebar End -->


    <!-- Content Start -->
    <div class="content">
        <!-- Navbar Start -->
        <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
            <a href="/index" class="navbar-brand d-flex d-lg-none me-4">
                <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
            </a>
            <a href="#" class="sidebar-toggler flex-shrink-0">
                <i class="fa fa-bars"></i>
            </a>
            <form class="d-none d-md-flex ms-4">
                <form name="form1" method="post" onsubmit="return false;">
                    <input class="form-control border-0" type="search" placeholder="Search" id="search_box"
                           target="search_box_t">
                    <button type="button" class="btn btn-primary m-2" onclick="fnGetList();">Go!</button>
                </form>
            </form>
            </form>
            <div class="navbar-nav align-items-center ms-auto">

                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <i class="fa fa-cog fa-fw"></i>
                        <span class="d-none d-lg-inline-flex">
                                Setting
                            </span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                        <a href="Setting" class="dropdown-item">My Profile</a>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Navbar End -->


        <!-- Form Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="row_Search bg-light rounded align-items-center justify-content-center mx-0">
                <div class="col-md-9">
                    <form name="form1" method="post" onsubmit="return false;">
                        <form class="form-control border-0" id="search_box_t"></form>
                    </form>
                    <div>
                        <table class="table table-borderless" id="get_view"></table>
                    </div>
                    <div id="nav_view"></div>
                </div>
            </div>
        </div>
        <!-- Form End -->


        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light rounded-top p-4">
                <div class="row">
                    <div class="col-12 col-sm-6 text-center text-sm-start">
                        &copy; <a href="#">MultiST</a>, All Right Reserved.
                    </div>
                    <div class="col-12 col-sm-6 text-center text-sm-end">
                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                        Designed By <a href="https://htmlcodex.com">HTML Codex</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->
    </div>
    <!-- Content End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
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