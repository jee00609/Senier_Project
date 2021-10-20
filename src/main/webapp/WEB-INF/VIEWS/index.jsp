<%@page import="com.awsTest.s3Upload.service.ETRIapiService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<!--   
    <link rel="stylesheet" href="../css/bootstrap.min.css">
	-->
<!-- 
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    -->

<link rel="stylesheet" href="../css/styles.css">

<link rel="stylesheet2"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,400;0,600;1,200;1,400;1,600&display=swap"
	rel="stylesheet3">

<title>Pictures Sea</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
</head>

<body>

	<section class="bg-light py-5 border-bottom">

		<div id="progress" class="progress">
			<div id="progress-bar"
				class="progress-bar progress-bar-striped progress-bar-animated"
				role="progressbar" aria-valuenow="0" aria-valuemin="0"
				aria-valuemax="100" style="width: 0%"></div>
		</div>

		<div class="container">
			<div id="alert" class="alert alert-dismissible fade show"
				role="alert">
				<h5 id="alert-heading" class="alert-heading">Upload Completed!</h5>
				<p id="message"></p>
				<p id="audioName"></p>
				<p>
					<a id="aws-link" target="_blank" href="#"></a>
				</p>

				<ul style="list-style-type: none;" id="object"></ul>

				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>




			<div class="content">
				<div class="row">
					<div
						class="col-10 offset-1 col-sm-8 offset-sm-2 col-md-6 offset-md-3 align-self-center">
						<h1 class="text-center title">Image / Audio Uploader</h1>
						<form method="POST" action="/upload" enctype="multipart/form-data">
							<div class="input-group mb-3">
								<input type="file" id="file" name="file"
									onchange="readURL(this);" accept="image/*"
									class="form-control form-control-lg"
									placeholder="Click to select image to upload"
									aria-label="Click to select image to upload"
									aria-describedby="basic-addon2">
								<div class="input-group-append">
									<button id="upload"
										class="btn btn-outline-secondary1 btn-primary btn-lg"
										type="submit">Upload</button>
								</div>
							</div>
						</form>
						<p class="text-right text-muted">Maximum supported image size
							is 10MB</p>
						<p class="text-right text-muted">The image uploaded will be
							rendered inside the box below.</p>
						<div class="image-area mt-4">
							<img id="imageResult" src="#" alt=""
								class="img-fluid rounded shadow-sm mx-auto d-block">
						</div>

						<!--
                    <form method="POST" action="/upload2" enctype="multipart/form-data">
                        <div class="input-group mb-3">
                            <input type="file" id="file2" name="file" accept="audio/*" class="form-control form-control-lg" placeholder="Click to select audio to upload" aria-label="Click to select audio to upload" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button id="upload2" class="btn btn-outline-secondary1 btn-primary btn-lg" type="submit">
                                    Upload
                                </button>
                            </div>
                        </div>
                    </form>
					 -->
					 <form method="POST" action="/upload2" enctype="multipart/form-data">
                        <div class="input-group mb-3">
                            <input type="file" id="file2" name="file" accept="audio/*" class="form-control form-control-lg" placeholder="Click to select audio to upload" aria-label="Click to select audio to upload" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button id="upload2" class="btn btn-outline-secondary1 btn-primary btn-lg" type="submit">
                                    Upload
                                </button>
                            </div>
                        </div>
                    </form>
					</div>
				</div>
			</div>
		</div>

		<div class="container h-50">
			<div class="text-center mt-5">
				<!-- <p>Convert recorded audio to:</p> -->
				<select id="encodingTypeSelect">
					<option value="wav">Waveform Audio (.wav)</option>

					<!--
                <option value="mp3">MP3 (MPEG-1 Audio Layer III) (.mp3)</option>
                <option value="ogg">Ogg Vorbis (.ogg)</option>
                -->
				</select>

				<div id="controls">
					<button id="recordButton">Record</button>
					<button id="stopButton" disabled>Stop</button>
				</div>
				<div id="formats"></div>
				<!--
            <pre>Log</pre>
            -->
				<pre id="log"></pre>

				<pre>Recordings</pre>
				<ol style="list-style-type: none;" id="recordingsList"></ol>

			</div>
		</div>

	</section>


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
				<img src="https://assets.codepen.io/2301174/icon-supervisor.svg"
					alt="">
			</div>
		</div>

		<div class="box red" style="width: 800px;" id="specifyCard2">
			<h2>Team Builder</h2>
			<p>Scans our talent network to create the optimal team for your
				project</p>
			<img src="https://assets.codepen.io/2301174/icon-team-builder.svg"
				alt="">
		</div>

		<div class="box box-down blue" style="width: 800px;" id="specifyCard3">
			<h2>Calculator</h2>
			<p>Uses data from past projects to provide better delivery
				estimates</p>
			<img src="https://assets.codepen.io/2301174/icon-calculator.svg"
				alt="">
		</div>



		<div class="box orange" style="width: 800px;" id="specifyCard4">
			<h2>Karma</h2>
			<p>Regularly evaluates our talent to ensure quality</p>
			<img src="https://assets.codepen.io/2301174/icon-karma.svg" alt="">
		</div>

	</div>


	<div id="justBlank" style="height: 200px; visibility: hidden;">
		INNER TEXT</div>

	<!-- 	<form method="POST" action="/printScore" enctype="multipart/form-data">
		<section class="bg-light border-bottom" id="plz">
			<!--<c:out value='${score}'/>-->
	<!-- </section>
	</form>
	<form method="POST" action="/printScore" enctype="multipart/form-data">
		
	</form>
	
	-->
	<section class="bg-light border-bottom" id="plz">		
	</section>





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
