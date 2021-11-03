<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Introduce</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles3.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
            <div class="container px-5">
                <a class="navbar-brand" href="/index">Pictures, Sea</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            </div>
        </nav>
        <!-- Header-->
        <header class="masthead text-center text-white">
            <div class="masthead-content">
                <div class="container px-5">
                    <h1 class="masthead-heading mb-0">Choose an image</h1>
                    <h2 class="masthead-subheading mb-0">Rate your pronunciation</h2>
                    <a class="btn btn-primary btn-xl rounded-pill mt-5" href="#scroll">Learn More</a>
                </div>
            </div>
        </header>
        <!-- Content section 1-->
        <section id="scroll">
            <div class="container px-5">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-6 order-lg-2">
                        <div class="p-3"><img class="img-fluid" src="assets/img/introduce_1.PNG" alt="..." /></div>
                    </div>
                    <div class="col-lg-6 order-lg-1">
                        <div class="p-5">
                            <h2 class="display-5">이미지를 선택하세요!</h2>
                            <p>사용자는 원하는 이미지를 선택합니다.<br/>선택된 이미지를 업로드 하면 이미지 속에서 파악 가능한 물체들을 카드 형식으로 출력합니다.<br/>사용자의 개인 정보 보호를 위해 이미지는 사이트에서 1일 이상 지나면 자동으로 삭제됩니다.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Content section 2-->
        <section>
            <div class="container px-5">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-6">
                        <div class="p-3"><img class="img-fluid" src="assets/img/introduce_2.PNG" alt="..." /></div>
                    </div>
                    <div class="col-lg-6">
                        <div class="p-5">
                            <h2 class="display-4">단어를 고르세요!</h2>
                            <p>이미지가 성공적으로 업로드 되면 사진과 같이 이미지 속 물체들에 대한 영어 단어 카드들이 동적으로 생성됩니다.<br/>영어 단어 카드들 중 하나를 골라 해당 카드의 More 버튼을 클릭 시 상세 카드가 아래에 출력됩니다.<br/>상세 카드에는 해당 카드를 특정 문장으로 발음해달라고 나와있습니다.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Content section 3-->
        <section>
            <div class="container px-5">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-6 order-lg-2">
                        <div class="p-3"><img class="img-fluid" src="assets/img/introduce_3.PNG" alt="..." /></div>
                    </div>
                    <div class="col-lg-6 order-lg-1">
                        <div class="p-5">
                            <h2 class="display-4">발음하세요!</h2>
                            <p>단어를 고르셨다면 이제 자신의 영어 발음을 뽐내세요!<br/>녹음 버튼을 눌러 사용자의 음성을 녹음합니다.<br/>녹음을 마칠 경우 자신의 발음을 먼저 체크하실 수 있습니다.<br/>사용자가 만족하실 만큼 반복해서 녹음이 가능합니다.<br/>이후 자신의 음성을 Download 버튼을 통해 저장하고 해당 음성 파일을 Audio Upload 버튼을 통해 업로드합니다.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Content section 4-->
        <section>
            <div class="container px-5">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-6">
                        <div class="p-3"><img class="img-fluid" src="assets/img/introduce_4.PNG" alt="..." /></div>
                    </div>
                    <div class="col-lg-6">
                        <div class="p-5">
                            <h2 class="display-4">준비되셨나요?</h2>
                            <p>이제 모든 준비가 끝났습니다!<br/>단어와 함께 자신의 음성 파일을 업로드 하셨다면 최하단의 상세페이지 속 Rating 버튼을 눌러 자신의 발음을 평가해보세요!</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Content section 5-->
        <section>
            <div class="container px-5">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-6 order-lg-2">
                        <div class="p-3"><img class="img-fluid" src="assets/img/introduce_5.PNG" alt="..." /></div>
                    </div>
                    <div class="col-lg-6 order-lg-1">
                        <div class="p-5">
                            <h2 class="display-4">영단어 공부와 함께 발음평가 까지!</h2>
                            <p>해당 페이지에서는 사용자가 고른 단어에 대한 한글 정의를 알려주며 사용자가 말했던 문장을 평가하여 1~5점 사이의 점수로 평가해드립니다.<br/>만약 0.0점이 나오셨다면 메인 페이지에서 새로고침 후 다시 시도해주시길 바랍니다.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-black">
            <div class="container px-5"><p class="m-0 text-center text-white small">Copyright &copy; Senier Project 2021</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <!--  <script src="js/scripts.js"></script> -->
    </body>
</html>