<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">

    <style type="text/css">
        .content {
            margin-top: 50px;
        }

        .title {
            margin-bottom: 50px;
        }

        .copyright {
            margin-top: 100px;
        }
        #progress, #alert, #aws-link  {
            visibility: hidden;
        }
    </style>
    <title>Image And Audio Uploader | IT15555854</title>
</head>
<body>
	<div id="progress" class="progress">
    	<div id="progress-bar" class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
         style="width: 0%">
         </div>
	</div>

	<div class="container">
    <div id="alert" class="alert alert-dismissible fade show" role="alert">
        <h5 id="alert-heading" class="alert-heading">Upload Completed!</h5>
        <p id="message"></p>
        <p><a id="aws-link" target="_blank" href="#"></a></p>
        
        <p>
        	<ul style="list-style-type: none;" id="object">
        	</ul>
        </p>
        
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    
    
    
    
    <div class="content">
        <div class="row">
            <div class="col-10 offset-1 col-sm-8 offset-sm-2 col-md-6 offset-md-3 align-self-center">
                <h1 class="text-center title">Image / Audio Uploader</h1>

                <form method="POST" action="/upload" enctype="multipart/form-data">
                    <div class="input-group mb-3">
                        <input type="file" id="file" name="file" accept="image/*" class="form-control form-control-lg"
                               placeholder="Click to select image to upload"
                               aria-label="Click to select image to upload" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button id="upload" class="btn btn-outline-secondary1 btn-primary btn-lg" type="submit">
                                Upload
                            </button>
                        </div>
                    </div>
                </form>
                <p class="text-right text-muted">Maximum supported image size is 10MB</p>
     
                <form method="POST" action="/upload2" enctype="multipart/form-data">
                    <div class="input-group mb-3">
                        <input type="file" id="file2" name="file" accept="audio/*" class="form-control form-control-lg"
                               placeholder="Click to select audio to upload"
                               aria-label="Click to select audio to upload" aria-describedby="basic-addon2">
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

<div class="container">
        <div class="text-center mt-5">
            <p>Convert recorded audio to:</p>
            <select id="encodingTypeSelect">
                <option value="wav">Waveform Audio (.wav)</option>
                <option value="mp3">MP3 (MPEG-1 Audio Layer III) (.mp3)</option>
                <option value="ogg">Ogg Vorbis (.ogg)</option>
            </select>
            <div id="controls">
                <button id="recordButton">Record</button>
                <button id="stopButton" disabled>Stop</button>
            </div>
            <div id="formats"></div>
            <pre>Log</pre>
            <pre id="log"></pre>

            <pre>Recordings</pre>
            <ol style="list-style-type: none;" id="recordingsList"></ol>

        </div>
    </div>

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




</body>
</html>