<%@page import="com.awsTest.s3Upload.service.ETRIapiService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <!--   
    <link rel="stylesheet" href="../css/bootstrap.min.css">
	-->
    <!-- 
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    -->

    <link rel="stylesheet" href="../css/styles.css">

    <link rel="stylesheet2" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,400;0,600;1,200;1,400;1,600&display=swap" rel="stylesheet3">

    <title>Pictures, Sea</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
</head>

<body>

    <nav class="navbar navbar-expand-lg static-top ">
        <div class="container px-5">
            <a class="navbar-brand" href="/">Pictures, Sea</a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="navbar-brand" href="/introduce">Introduce</a>
                </li>
            </ul>
        </div>
    </nav>



    <section class="cta py-5 border-bottom">
        <div class="cta-content">

            <div id="progress" class="progress">
                <div id="progress-bar" class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%"></div>
            </div>

            <div class="container">
                <div id="alert" class="alert alert-dismissible fade show" role="alert">
                    <h5 id="alert-heading" class="alert-heading">Upload Completed!</h5>
                    <p id="message"></p>
                    <p>
                        <a id="aws-link" target="_blank" href="#"></a>
                    </p>

                    <ul style="list-style-type: none;" id="object"></ul>

                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>




                <div class="content">

                    <h1 class="text-white display-1 lh-1 mb-4 text-center title">Pictures, Sea</h1>

                    <div class="row">

                        <div class="col">
                            <h3 class="text-white text-center title">이미지를 선택해주세요!</h3>
                            <form method="POST" action="/upload" enctype="multipart/form-data">
                                <div class="input-group mb-3">
                                    <input type="file" id="file" name="file" onchange="readURL(this);" accept="image/*" class="form-control form-control-lg" placeholder="Click to select image to upload" aria-label="Click to select image to upload" aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button id="upload" class="btn btn-outline-secondary1 btn-primary btn-lg" type="submit">Image Upload</button>
                                    </div>
                                </div>
                            </form>
                            <p class="text-right text-muted">Maximum supported image size is 10MB</p>
                            <p class="text-right text-muted">The image uploaded will be rendered inside the box below.</p>
                            <div class="image-area mt-4">
                                <img id="imageResult" src="#" alt="" class="img-fluid rounded shadow-sm mx-auto d-block">
                            </div>


                        </div>

                        <div class="col">
                            <h3 class="text-white text-center title">녹음 파일을 선택해주세요!</h3>
                            <form method="POST" action="/upload2" enctype="multipart/form-data">
                                <div class="input-group mb-3">
                                    <input type="file" id="file2" name="file" accept="audio/*" class="form-control form-control-lg" placeholder="Click to select audio to upload" aria-label="Click to select audio to upload" aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button id="upload2" class="btn btn-outline-secondary1 btn-primary btn-lg" type="submit">
                                            Audio Upload
                                        </button>
                                    </div>
                                </div>
                            </form>

                            <div class="container h-50">
                                <div class="text-center mt-5">
                                    <!-- <p>Convert recorded audio to:</p> -->
                                    <select id="encodingTypeSelect">
                                        <option value="wav">Waveform Audio (.wav)</option>
                                    </select>

                                    <div id="controls">
                                        <button id="recordButton">Record</button>
                                        <button id="stopButton" disabled>Stop</button>
                                    </div>
                                    <div id="formats"></div>
                                    <pre id="log"></pre>

                                    <pre>Recordings</pre>
                                    <ol style="list-style-type: none;" id="recordingsList"></ol>

                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>

        </div>


    </section>

    <div class="h-50 bg-light">
    	<div class="content">
			<h3 class="text-center title lh-1 mb-4">이 아래에 선택한 이미지의 Object 들이 출력됩니다.</h3>
			<p id="audioName" style="display:none"></p>
		</div>
    </div>


    <div class="container h-50" id="contentPanel" style="display: none">
        <div class="row align-middle" id="objectCardListEx">

            <div class="col-md-6 col-lg-4 column" id="objectCard1">
                <div class="card gr-1">
                    <div class="txt">
                        <h2>Car</h2>
                        <p>Visual communication and problem-solving</p>
                    </div>
                    <div class="more">
                        <a href="#">more</a>
                    </div>
                </div>
            </div>


            <div class="col-md-6 col-lg-4 column" id="objectCard2">
                <div class="card gr-2">
                    <div class="txt">
                        <h2>Footwear</h2>
                        <p>How design is implemented on the web.</p>
                    </div>
                    <div class="more">
                        <a href="#">more</a>
                    </div>
                </div>
            </div>


            <div class="col-md-6 col-lg-4 column" id="objectCard3">
                <div class="card gr-3">
                    <div class="txt">
                        <h2>Sunset</h2>
                        <p>User Interface and User Experience Design.</p>
                    </div>
                    <div class="more">
                        <a href="#">more</a>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="container h-50">
        <div class="row align-middle" id="objectCardList"></div>
    </div>


    <div id="getText" style="display: none;">
    
        <div class="box box-down cyan" style="width: 800px;" id=specifyCard1>
            <div class="txt">
                <h2>Supervisor</h2>
                <p>Monitors activity to identify project roadblocks</p>
                <img src="https://assets.codepen.io/2301174/icon-supervisor.svg" alt="">
            </div>
        </div>

        <div class="box box-down red" style="width: 800px;" id="specifyCard2">
        	<div class="txt">
                <h2>Supervisor</h2>
                <p>Monitors activity to identify project roadblocks</p>
                <img src="https://assets.codepen.io/2301174/icon-team-builder.svg" alt="">
            </div>
        </div>

        <div class="box box-down blue" style="width: 800px;" id="specifyCard3">
        	<div class="txt">
                <h2>Supervisor</h2>
                <p>Monitors activity to identify project roadblocks</p>
                <img src="https://assets.codepen.io/2301174/icon-calculator.svg" alt="">
            </div>
        </div>

        <div class="box box-down orange" style="width: 800px;" id="specifyCard4">
        	<div class="txt">
                <h2>Supervisor</h2>
                <p>Monitors activity to identify project roadblocks</p>
                <img src="https://assets.codepen.io/2301174/icon-karma.svg" alt="">
            </div>
        </div>

    </div>


    <div id="justBlank" style="height: 200px; visibility: hidden;">
        INNER TEXT
    </div>

    <section class="bg-light border-bottom" id="plz">
    </section>
    
    <footer class="py-5 bg-dark">
            <div class="px-5"><p class="m-0 text-center text-white small">Copyright &copy; Senior Project 2021</p></div>
    </footer>





    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>

    <!-- Audio 녹음 -->
    <script src="../js/WebAudioRecorder.min.js"></script>
    <script src="../js/app.js"></script>

    <!-- ajax 화면 바꾸기 및 Rekognition 띄우기 -->
    <script src="../js/ajaxLoad.js"></script>

    <!-- 업로드할 이미지 프리뷰 -->
    <script type="text/javascript" src="../js/previewImage.js"></script>

    <script type="text/javascript" src="../js/informationCard.js"></script>
</body>

</html>
