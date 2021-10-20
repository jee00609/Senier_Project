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
<link
	href="https://fonts.googleapis.com/css2?family=Newsreader:ital,wght@0,600;1,600&amp;display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,500;0,600;0,700;1,300;1,500;1,600;1,700&amp;display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,400;1,400&amp;display=swap"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles3.css" rel="stylesheet" />
</head>

<body id="page-top">
	<!-- 대충 있어보이는 섹션-->
	<header>
		<section class="cta">
			<div class="cta-content">
				<div class="container px-5">
					<h2 class="text-white display-1 lh-1 mb-4">
						Learn easy <br /> Say Loud
					</h2>
				</div>
			</div>
		</section>
	</header>

	<!-- Basic features section
	
	//음악 파일
	<c:out value='${audioName}'></c:out>
	
	-->
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




	<!-- Quote/testimonial aside-->
	<aside class="text-center bg-gradient-primary-to-secondary">
		<div class="container px-5">
			<div class="row gx-5 justify-content-center">
				<div class="col-xl-8">
					<div class="h2 fs-1 text-white mb-4">Your Speaking Score is</div>
					
					<!--
					<img src="assets/img/logo_transparent.png" alt="..." style="height: 25rem" />
					-->
						<h2 class="display-4 lh-1 mb-4"><c:out value='${scoreStr}'></c:out></h2>
						<h3 class="font-alt"> 1.00 (MIN) ~ 5.00 (MAX)</h3>
				</div>
			</div>
		</div>
	</aside>
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
                                <linearGradient id="circleGradient"
								gradientTransform="rotate(45)">
                                    <stop class="gradient-start-color"
								offset="0%"></stop>
                                    <stop class="gradient-end-color"
								offset="100%"></stop>
                                </linearGradient>
                            </defs>
                            <circle cx="50" cy="50" r="50"></circle>
                        </svg>
						<svg class="shape-1 d-none d-sm-block" viewBox="0 0 240.83 240.83"
							xmlns="http://www.w3.org/2000/svg">
                            <rect x="-32.54" y="78.39" width="305.92"
								height="84.05" rx="42.03"
								transform="translate(120.42 -49.88) rotate(45)"></rect>
                            <rect x="-32.54" y="78.39" width="305.92"
								height="84.05" rx="42.03"
								transform="translate(-49.88 120.42) rotate(-45)"></rect>
                        </svg>
						<svg class="shape-2 d-none d-sm-block" viewBox="0 0 100 100"
							xmlns="http://www.w3.org/2000/svg">
                            <circle cx="50" cy="50" r="50"></circle>
                        </svg>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- Footer-->
	<footer class="bg-black text-center py-5">
		<div class="container px-5">
			<div class="text-white-50 small">
				<div class="mb-2">&copy; Senier Project 2021. All Rights
					Reserved.</div>
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
	<script type="text/javascript"
		src="https://pagead2.googlesyndication.com/pagead/show_ads.js">
</body>

</html>