<%--
  Created by IntelliJ IDEA.
  User: Hieu
  Date: 13/09/2024
  Time: 09:24 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="/css/styles.css">
<<<<<<< HEAD
    <style>
        #guestButtons, #userInfo {
            display: none;
        }
        .popup {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }
        .popup-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 500px;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label, input {
            margin-bottom: 10px;
        }
    </style>
    <script>
        // Kiểm tra trạng thái đăng nhập ngay khi trang bắt đầu tải
        (function() {
            var isLoggedIn = localStorage.getItem('isLoggedIn') === 'true';
            document.documentElement.classList.add(isLoggedIn ? 'logged-in' : 'logged-out');
        })();
    </script>
=======
>>>>>>> d358adf7717c9801ffd85c751589b68374d3a4a0
</head>

<body class="">
<div id="notification" style="
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #f8d7da;
    color: #721c24;
    padding: 15px 20px;
    border-radius: 5px;
    z-index: 1000;
    box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    font-size: 16px;
    text-align: center;
    max-width: 80%;
">
</div>
<!-- Nav -->
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <div class="container-fluid">
        <a href="#">
            <img class="logo-nav" src="/images/product/FMobileLogo.png" alt="" />
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse ml-5" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true"
                         xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="m4 12 8-8 8 8M6 10.5V19a1 1 0 0 0 1 1h3v-3a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3h3a1 1 0 0 0 1-1v-8.5" />
                    </svg>
                    <a class="nav-link menu" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true"
                         xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                         viewBox="0 0 24 24">
                        <path fill-rule="evenodd"
                              d="M5 4a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V4Zm12 12V5H7v11h10Zm-5 1a1 1 0 1 0 0 2h.01a1 1 0 1 0 0-2H12Z"
                              clip-rule="evenodd" />
                    </svg>
                    <a class="nav-link menu" href="#">Mobile</a>
                </li>
                <li class="nav-item">
                    <i class="fas fa-laptop"></i>
                    <a class="nav-link menu" href="#">Laptop</a>
                </li>
                <li class="nav-item">
                    <svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true"
                         xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M11 18h2M5.875 3h12.25c.483 0 .875.448.875 1v16c0 .552-.392 1-.875 1H5.875C5.392 21 5 20.552 5 20V4c0-.552.392-1 .875-1Z" />
                    </svg>
                    <a class="nav-link menu" href="#">Tablet</a>
                </li>
                <li class="nav-item">
                    <svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true"
                         xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                         viewBox="0 0 24 24">
                        <path fill-rule="evenodd"
                              d="M12 5a7 7 0 0 0-7 7v1.17c.313-.11.65-.17 1-.17h2a1 1 0 0 1 1 1v6a1 1 0 0 1-1 1H6a3 3 0 0 1-3-3v-6a9 9 0 0 1 18 0v6a3 3 0 0 1-3 3h-2a1 1 0 0 1-1-1v-6a1 1 0 0 1 1-1h2c.35 0 .687.06 1 .17V12a7 7 0 0 0-7-7Z"
                              clip-rule="evenodd" />
                    </svg>
                    <a class="nav-link menu" href="#">Accessories</a>
                </li>
                <form class="d-flex ml-5">
                    <div class="search-icon">
                        <input class="form-control search_nav" type="search" placeholder="Search"
                               aria-label="Search" style="font-size: 1.5rem" />
                        <svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true"
                             xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none"
                             viewBox="0 0 24 24">
                            <path stroke="currentColor" stroke-linecap="round" stroke-width="2"
                                  d="m21 21-3.5-3.5M17 10a7 7 0 1 1-14 0 7 7 0 0 1 14 0Z" />
                        </svg>
                    </div>
                </form>
            </ul>
        </div>
<<<<<<< HEAD
        <div class="icon-cart mx-3">
=======
        <div class="icon-cart">
>>>>>>> d358adf7717c9801ffd85c751589b68374d3a4a0
            <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 20">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M6 15a2 2 0 1 0 0 4 2 2 0 0 0 0-4Zm0 0h8m-8 0-1-4m9 4a2 2 0 1 0 0 4 2 2 0 0 0 0-4Zm-9-4h10l2-7H3m2 7L3 4m0 0-.792-3H1" />
            </svg>
            <span>0</span>
        </div>
<<<<<<< HEAD
        <div class="navbar-nav ms-auto">
            <div id="guestButtons" style="display: block">
                <button class="btn btn-outline-primary me-2 btn_login" style="border: none; font-size: 15px;" onclick="login()">Login</button>
                <button class="btn btn-primary" style="font-size: 15px;" onclick="openPopup()">Register</button>
<%--                vi du ve popup --%>
                <div id="registerPopup" class="popup">
                    <div class="popup-content">
                        <span class="close" onclick="closePopup()">&times;</span>
                        <h2>Register</h2>
                        <form id="registerForm" action="${pageContext.request.contextPath}/register" method="post">
                            <label for="fullname">Full Name:</label>
                            <input type="text" id="fullname" name="fullname" required>

                            <label for="phone">Phone:</label>
                            <input type="tel" id="phone" name="phone" required>

                            <label for="address">Address:</label>
                            <input type="text" id="address" name="address" required>

                            <label for="creationDate">Creation Day:</label>
                            <input type="date" id="creationDate" name="creationDate" required>

                            <button type="submit">Submit</button>
                        </form>
                    </div>
                </div>
<%--                --------------------------------%>
            </div>
            <div id="userInfo">
                <div class="d-flex align-items-center">
                    <div class="icon-user mx-3">
                        <a href="/UserPage"><img class="logo-nav" style="background: #007bff" src="/client/img/avatar.jpg" alt="user" /></a>
                    </div>
                    <a href="/home" class="btn btn-outline-danger" onclick="logout()">Logout</a>
                </div>
            </div>
        </div>
=======
        <div class="icon-user">
            <img class="logo-nav" src="/client/img/avatar.jpg" alt="" />
        </div>
        <button class="btn signin_btn" style="font-size: 1.3rem">
            Log In
        </button>
        <button class="btn btn-primary" style="margin-left: 5px; height: 34px; font-size: 1.3rem">
            Register
        </button>
>>>>>>> d358adf7717c9801ffd85c751589b68374d3a4a0
        <div class="form-check form-switch dark-mode-toggle mx-5">
            <input class="form-check-input" type="checkbox" id="darkModeToggle" />
            <label class="form-check-label" for="darkModeToggle">Dark Mode</label>
        </div>
    </div>
</nav>

<!-- Header -->
<div class="container">
    <div class="row header">
        <div class="col-md-6 header_baner">
            <h1 style="font-size: 6rem">
                Let's go to store. You have what you need.
            </h1>
            <a class="btn btn_header btn-primary">Get Started</a>
        </div>
        <!-- Anh truoc ngang -->
        <div id="bannerCarousel" class="carousel slide col-md-6" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="/images/product/galaxy z fold 4.jpg" class="d-block w-100 img-fluid" alt="Galaxy Z Fold 4" />
                </div>
                <div class="carousel-item">
                    <img src="/images/product/iphone-16-pro-fi.webp" class="d-block w-100 img-fluid" alt="Iphone 16" />
                </div>
                <div class="carousel-item">
                    <img src="/images/product/huaweinew.png" class="d-block w-100 img-fluid" alt="Huawei" />
                </div>
            </div>

            <!-- Controls -->
            <button class="carousel-control-prev" type="button" data-bs-target="#bannerCarousel"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#bannerCarousel"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>

            <!-- Indicators -->
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#bannerCarousel" data-bs-slide-to="0" class="active"
                        aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#bannerCarousel" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#bannerCarousel" data-bs-slide-to="2"
                        aria-label="Slide 3"></button>
            </div>
        </div>
    </div>
</div>
<<<<<<< HEAD
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // ----------------------------------Log in-----------------------------------------
    function updateUI(isLoggedIn) {
        document.documentElement.classList.remove('logged-in', 'logged-out');
        document.documentElement.classList.add(isLoggedIn ? 'logged-in' : 'logged-out');
        document.getElementById('guestButtons').style.display = isLoggedIn ? 'none' : 'block';
        document.getElementById('userInfo').style.display = isLoggedIn ? 'block' : 'none';
    }

    function checkLoginState() {
        const isLoggedIn = localStorage.getItem('isLoggedIn') === 'true';
        updateUI(isLoggedIn);
    }

    function login() {
        setTimeout(() => {
            localStorage.setItem('isLoggedIn', 'true');
            updateUI(true);
        }, 1000);
    }

    function register() {
        setTimeout(() => {
            localStorage.setItem('isLoggedIn', 'true');
            updateUI(true);
        }, 1000);
    }

    function logout() {
        localStorage.removeItem('isLoggedIn');
        updateUI(false);
    }
    // Kiểm tra trạng thái đăng nhập khi DOM đã sẵn sàng
    document.addEventListener('DOMContentLoaded', checkLoginState);
//     ------------------------------ popup ---------------------
    function openPopup() {
        document.getElementById("registerPopup").style.display = "block";
    }

    function closePopup() {
        document.getElementById("registerPopup").style.display = "none";
    }

    document.getElementById("registerForm").addEventListener("submit", function(event) {
        event.preventDefault();
        // Here you can add code to handle form submission
        console.log("Form submitted");
        closePopup();
    });

    // Close the popup if the user clicks outside of it
    window.onclick = function(event) {
        if (event.target == document.getElementById("registerPopup")) {
            closePopup();
        }
    }
</script>
=======
>>>>>>> d358adf7717c9801ffd85c751589b68374d3a4a0
