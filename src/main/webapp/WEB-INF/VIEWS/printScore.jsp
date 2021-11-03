<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Rating Score</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Google fonts-->
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link href="https://fonts.googleapis.com/css2?family=Newsreader:ital,wght@0,600;1,600&amp;display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,500;0,600;0,700;1,300;1,500;1,600;1,700&amp;display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,400;1,400&amp;display=swap" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles2.css" rel="stylesheet" />
</head>

<body id="page-top">
	<!-- 대충 있어보이는 섹션-->
	<header>
		<section class="cta">
			<div class="cta-content">
				<div class="container px-5">
					<h2 class="text-white display-1 lh-1 mb-4">
						Learn easy <br/> Say Loud
					</h2>
				</div>
			</div>
		</section>
	</header>

	<section class="bg-light">
		<div class="container px-5">
			<div
				class="row gx-5 align-items-center justify-content-center justify-content-lg-between">
				<div class="col-12 col-lg-5">
					<h2 class="display-4 lh-1 mb-4"><c:out value='${objName}'></c:out></h2>
					<p class="lead fw-normal text-muted mb-5 mb-lg-0"><c:out value='${translateText}'></c:out></p>
				</div>
				<div class="col-sm-8 col-md-6">

					<div class="px-5 px-sm-0">
						<img class="img-fluid rounded-circle"
							src="https://source.unsplash.com/u8Jn2rzYIps/900x900" alt="..." />
					</div>
				</div>
			</div>
		</div>
	</section>




	<!-- Quote/testimonial aside
			점수 출력이 되는 부분
	-->
	<aside class="text-center bg-gradient-primary-to-secondary">
		<div class="container px-5">
			<div class="row gx-5 justify-content-center">
				<div class="col-xl-8">
					<div class="h2 fs-1 text-white mb-4">Your Speaking Score is</div>
						<h2 class="display-4 lh-1 mb-4"><c:out value='${scoreStr}'></c:out></h2>
						<h3 class="font-alt"> 1.00 (MIN) ~ 5.00 (MAX)</h3>
				</div>
			</div>
		</div>
	</aside>
	
	<!-- 그저 디자인을 위해... 넣은 부분-->
	<section id="features">
		<div class="container px-5">
		</div>
	</section>
	
	<!-- App features section-->
	<section id="features">
		<div class="container px-5">
			<div class="row gx-5 align-items-center">
				<div class="col-lg-8 order-lg-1 mb-5 mb-lg-0">
					<div class="container-fluid px-5">
						<div class="row">
							<!-- Feature item-->
							<div class="text-center">
								<img src="assets/img/thinking.png" alt="..." style="height: 5rem" />
								<h3 class="font-alt">만약 발음 점수가 지나치게 낮게 나온 경우? (EX-0.0)</h3>
								<p class="text-muted mb-0">다시 녹음하고 파일을 업로드 후 Rating 해보세요!</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 order-lg-0">
					<!-- Features section device mockup-->
					<div class="features-device-mockup">
						<svg class="circle" viewBox="0 0 100 100"
							xmlns="http://www.w3.org/2000/svg">
                            <defs>
                                <linearGradient id="circleGradient" gradientTransform="rotate(45)">
                                    <stop class="gradient-start-color" offset="0%"></stop>
                                    <stop class="gradient-end-color" offset="100%"></stop>
                                </linearGradient>
                            </defs>
                            <circle cx="50" cy="50" r="50"></circle>
                        </svg>
						<svg class="shape-1 d-none d-sm-block" viewBox="0 0 240.83 240.83" xmlns="http://www.w3.org/2000/svg">
                            <rect x="-32.54" y="78.39" width="305.92" height="84.05" rx="42.03" transform="translate(120.42 -49.88) rotate(45)"></rect>
                            <rect x="-32.54" y="78.39" width="305.92" height="84.05" rx="42.03" transform="translate(-49.88 120.42) rotate(-45)"></rect>
                        </svg>
						<svg class="shape-2 d-none d-sm-block" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
                            <circle cx="50" cy="50" r="50"></circle>
                        </svg>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- SNS Sharing  
		참고 : https://catchdream.tistory.com/149 
	-->
	<section id="features">
		<div class="container px-5">
			<div class="row gx-5 justify-content-center text-center">
				<div class="col-xl-8">
					<button class="btn btn-info" onclick="snsShare('twitter','${objName}','${scoreStr}')">
	                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-twitter" viewBox="0 0 16 16">
	                        <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"></path>
	                    </svg>
	                    Twitter Share
	                </button>
	                
	                <button class="btn btn-primary" onclick="snsShare('facebook','${objName}','${scoreStr}')">
	                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
						  <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"/>
						</svg>
	                    FaceBook Share
	                </button>
	                
	                <button class="btn btn-warning" onclick="snsShare('addurl','${objName}','${scoreStr}')">
	                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard-check" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
						  <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z"/>
						  <path d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z"/>
						</svg>
	                    Add Url
	                </button>
				</div>
			</div>
		</div>
	</section>


	<!-- Footer-->
	<footer class="bg-black text-center py-5">
		<div class="container px-5">
			<div class="text-white-50 small">
				<div class="mb-2">&copy; Senior Project 2021. All RightsReserved.</div>
			</div>
		</div>
	</footer>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha384-tsQFqpEReu7ZLhBV2VZlAu7zcOV+rXbYlF2cqB8txI/8aZajjp4Bqd+V6D5IgvKT"
		crossorigin="anonymous"></script>
		
	<script src="../js/snsSharing.js"></script>	
		
	<script type="text/javascript"
		src="https://pagead2.googlesyndication.com/pagead/show_ads.js">
</body>

</html>