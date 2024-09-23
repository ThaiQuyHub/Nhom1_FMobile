<%--
  Created by IntelliJ IDEA.
  User: Hieu
  Date: 13/09/2024
  Time: 09:24 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <style>
        body {
            background-image: url("https://www.shopify.com/retail/order-history-why-keeping-track-of-customers-previous-orders-can-help-you-make-more-sales");
        }
        a {
            text-decoration: none;
        }
        .avatar-wrapper {
            position: relative;
            width: 150px;
            height: 150px;
            overflow: hidden;
            border-radius: 50%;
            cursor: pointer;
        }
        .avatar-wrapper img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .avatar-wrapper input[type="file"] {
            position: absolute;
            left: 0;
            top: 0;
            opacity: 0;
            width: 100%;
            height: 100%;
            cursor: pointer;
        }

        .form-group {
            font-size: 20px;
        }

        .btn {
            font-size: 15px;
        }

        input {
            height: 30px;
        }

        table td, table th {
            vertical-align: middle; /* Đảm bảo tất cả nội dung căn giữa theo chiều dọc */
        }

        input[type="checkbox"] {
            position: relative;
            top: 5px;
            transform: translateY(-1px); /* Điều chỉnh nhỏ để căn chỉnh tốt hơn */
            margin: 0; /* Loại bỏ khoảng trống không cần thiết */
        }

        .logout_btn:hover {
            opacity: 0.9;
        }

        .modal-xl {
            max-width: 70%;
            width: 70%;
            height: 500px;
        }
        .modal-body {
            max-height: 100vh;
            overflow-y: auto;
        }
        /* Increase form control size */
        .form-control {
            padding: 0.75rem;
            font-size: 1.1rem;
        }
        /* Increase label font size */
        .form-label {
            font-size: 1.2rem;
        }
        /* ---------------------------Main-------------------------- */
        .view-account{
            margin-top:50px;
        }
        .view-account .pro-label {
            border: 1px solid #0066cc;
            background: #0066cc;
            color: #fff;
            font-size: 13px;
            padding: 4px 5px;
            position: relative;
            top: -5px;
            margin-left: 10px;
            display: inline-block
        }

        .view-account .side-bar {
            padding-bottom: 30px
        }

        .view-account .side-bar .user-info {
            text-align: center;
            margin-bottom: 15px;
            padding: 30px;
            color: #616670;
            border-bottom: 1px solid #f3f3f3
        }

        .view-account .side-bar .user-info .img-profile {
            width: 120px;
            height: 120px;
            margin-bottom: 15px;
        }

        .view-account .side-bar .user-info .meta li {
            margin-bottom: 10px
        }

        .view-account .side-bar .user-info .meta li span {
            display: inline-block;
            width: 100px;
            margin-right: 5px;
            text-align: right
        }

        .view-account .side-bar .user-info .meta li a {
            color: #616670
        }

        .view-account .side-bar .user-info .meta li.activity {
            color: #a2a6af
        }

        .view-account .side-bar .side-menu {
            text-align: center
        }

        .view-account .side-bar .side-menu .nav {
            display: inline-block;
            margin: 0 auto
        }

        .view-account .side-bar .side-menu .nav>li {
            font-size: 14px;
            margin-bottom: 0;
            border-bottom: none;
            display: inline-block;
            float: left;
            margin-right: 15px;
            margin-bottom: 15px
        }

        .view-account .side-bar .side-menu .nav>li:last-child {
            margin-right: 0
        }

        .view-account .side-bar .side-menu .nav>li>a {
            display: inline-block;
            color: #9499a3;
            padding: 5px;
            border-bottom: 2px solid transparent
        }

        .view-account .side-bar .side-menu .nav>li>a:hover {
            color: #616670;
            background: none
        }

        .view-account .side-bar .side-menu .nav>li.active a {
            color: #40babd;
            border-bottom: 2px solid #40babd;
            background: none;
            border-right: none
        }

        .theme-2 .view-account .side-bar .side-menu .nav>li.active a {
            color: #6dbd63;
            border-bottom-color: #6dbd63
        }

        .theme-3 .view-account .side-bar .side-menu .nav>li.active a {
            color: #497cb1;
            border-bottom-color: #497cb1
        }

        .theme-4 .view-account .side-bar .side-menu .nav>li.active a {
            color: #ec6952;
            border-bottom-color: #ec6952
        }

        .view-account .side-bar .side-menu .nav>li .icon {
            display: block;
            font-size: 24px;
            margin-bottom: 5px
        }

        .view-account .content-panel {
            padding: 30px
        }

        .view-account .content-panel .title {
            margin-bottom: 15px;
            margin-top: 0;
            font-size: 18px
        }

        .view-account .content-panel .fieldset-title {
            padding-bottom: 15px;
            border-bottom: 1px solid #eaeaf1;
            margin-bottom: 30px;
            color: #616670;
            font-size: 20px
        }

        .view-account .content-panel .avatar .figure img {
            float: right;
            width: 64px
        }

        .view-account .content-panel .content-header-wrapper {
            position: relative;
            margin-bottom: 30px
        }

        .view-account .content-panel .content-header-wrapper .actions {
            position: absolute;
            right: 0;
            top: 0
        }

        .view-account .content-panel .content-utilities {
            position: relative;
            margin-bottom: 30px
        }

        .view-account .content-panel .content-utilities .btn-group {
            margin-right: 5px;
            margin-bottom: 15px
        }

        .view-account .content-panel .content-utilities .fa {
            font-size: 16px;
            margin-right: 0
        }

        .view-account .content-panel .content-utilities .page-nav {
            position: absolute;
            right: 0;
            top: 0
        }

        .view-account .content-panel .content-utilities .page-nav .btn-group {
            margin-bottom: 0
        }

        .view-account .content-panel .content-utilities .page-nav .indicator {
            color: #a2a6af;
            margin-right: 5px;
            display: inline-block
        }

        .view-account .content-panel .mails-wrapper .mail-item {
            position: relative;
            padding: 10px;
            border-bottom: 1px solid #f3f3f3;
            color: #616670;
            overflow: hidden
        }

        .view-account .content-panel .mails-wrapper .mail-item>div {
            float: left
        }

        .view-account .content-panel .mails-wrapper .mail-item .icheck {
            background-color: #fff
        }

        .view-account .content-panel .mails-wrapper .mail-item:hover {
            background: #f9f9fb
        }

        .view-account .content-panel .mails-wrapper .mail-item:nth-child(even) {
            background: #fcfcfd
        }

        .view-account .content-panel .mails-wrapper .mail-item:nth-child(even):hover {
            background: #f9f9fb
        }

        .view-account .content-panel .mails-wrapper .mail-item a {
            color: #616670
        }

        .view-account .content-panel .mails-wrapper .mail-item a:hover {
            color: #494d55;
            text-decoration: none
        }

        .view-account .content-panel .mails-wrapper .mail-item .checkbox-container,
        .view-account .content-panel .mails-wrapper .mail-item .star-container {
            display: inline-block;
            margin-right: 5px
        }

        .view-account .content-panel .mails-wrapper .mail-item .star-container .fa {
            color: #a2a6af;
            font-size: 16px;
            vertical-align: middle
        }

        .view-account .content-panel .mails-wrapper .mail-item .star-container .fa.fa-star {
            color: #f2b542
        }

        .view-account .content-panel .mails-wrapper .mail-item .star-container .fa:hover {
            color: #868c97
        }

        .view-account .content-panel .mails-wrapper .mail-item .mail-to {
            display: inline-block;
            margin-right: 5px;
            min-width: 120px
        }

        .view-account .content-panel .mails-wrapper .mail-item .mail-subject {
            display: inline-block;
            margin-right: 5px
        }

        .view-account .content-panel .mails-wrapper .mail-item .mail-subject .label {
            margin-right: 5px
        }

        .view-account .content-panel .mails-wrapper .mail-item .mail-subject .label:last-child {
            margin-right: 10px
        }

        .view-account .content-panel .mails-wrapper .mail-item .mail-subject .label a,
        .view-account .content-panel .mails-wrapper .mail-item .mail-subject .label a:hover {
            color: #fff
        }

        .view-account .content-panel .mails-wrapper .mail-item .mail-subject .label-color-1 {
            background: #f77b6b
        }

        .view-account .content-panel .mails-wrapper .mail-item .mail-subject .label-color-2 {
            background: #58bbee
        }

        .view-account .content-panel .mails-wrapper .mail-item .mail-subject .label-color-3 {
            background: #f8a13f
        }

        .view-account .content-panel .mails-wrapper .mail-item .mail-subject .label-color-4 {
            background: #ea5395
        }

        .view-account .content-panel .mails-wrapper .mail-item .mail-subject .label-color-5 {
            background: #8a40a7
        }

        .view-account .content-panel .mails-wrapper .mail-item .time-container {
            display: inline-block;
            position: absolute;
            right: 10px;
            top: 10px;
            color: #a2a6af;
            text-align: left
        }

        .view-account .content-panel .mails-wrapper .mail-item .time-container .attachment-container {
            display: inline-block;
            color: #a2a6af;
            margin-right: 5px
        }

        .view-account .content-panel .mails-wrapper .mail-item .time-container .time {
            display: inline-block;
            text-align: right
        }

        .view-account .content-panel .mails-wrapper .mail-item .time-container .time.today {
            font-weight: 700;
            color: #494d55
        }

        .drive-wrapper {
            padding: 15px;
            background: #f5f5f5;
            overflow: hidden
        }

        .drive-wrapper .drive-item {
            width: 130px;
            margin-right: 15px;
            display: inline-block;
            float: left
        }

        .drive-wrapper .drive-item:hover {
            box-shadow: 0 1px 5px rgba(0, 0, 0, .1);
            z-index: 1
        }

        .drive-wrapper .drive-item-inner {
            padding: 15px
        }

        .drive-wrapper .drive-item-title {
            margin-bottom: 15px;
            max-width: 100px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis
        }

        .drive-wrapper .drive-item-title a {
            color: #494d55
        }

        .drive-wrapper .drive-item-title a:hover {
            color: #40babd
        }

        .theme-2 .drive-wrapper .drive-item-title a:hover {
            color: #6dbd63
        }

        .theme-3 .drive-wrapper .drive-item-title a:hover {
            color: #497cb1
        }

        .theme-4 .drive-wrapper .drive-item-title a:hover {
            color: #ec6952
        }

        .drive-wrapper .drive-item-thumb {
            width: 100px;
            height: 80px;
            margin: 0 auto;
            color: #616670
        }

        .drive-wrapper .drive-item-thumb a {
            -webkit-opacity: .8;
            -moz-opacity: .8;
            opacity: .8
        }

        .drive-wrapper .drive-item-thumb a:hover {
            -webkit-opacity: 1;
            -moz-opacity: 1;
            opacity: 1
        }

        .drive-wrapper .drive-item-thumb .fa {
            display: inline-block;
            font-size: 36px;
            margin: 0 auto;
            margin-top: 20px
        }

        .drive-wrapper .drive-item-footer .utilities {
            margin-bottom: 0
        }

        .drive-wrapper .drive-item-footer .utilities li:last-child {
            padding-right: 0
        }

        .drive-list-view .name {
            width: 60%
        }

        .drive-list-view .name.truncate {
            max-width: 100px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis
        }

        .drive-list-view .type {
            width: 15px
        }

        .drive-list-view .date,
        .drive-list-view .size {
            max-width: 60px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis
        }

        .drive-list-view a {
            color: #494d55
        }

        .drive-list-view a:hover {
            color: #40babd
        }

        .theme-2 .drive-list-view a:hover {
            color: #6dbd63
        }

        .theme-3 .drive-list-view a:hover {
            color: #497cb1
        }

        .theme-4 .drive-list-view a:hover {
            color: #ec6952
        }

        .drive-list-view td.date,
        .drive-list-view td.size {
            color: #a2a6af
        }

        @media (max-width:767px) {
            .view-account .content-panel .title {
                text-align: center
            }
            .view-account .side-bar .user-info {
                padding: 0
            }
            .view-account .side-bar .user-info .img-profile {
                width: 60px;
                height: 60px
            }
            .view-account .side-bar .user-info .meta li {
                margin-bottom: 5px
            }
            .view-account .content-panel .content-header-wrapper .actions {
                position: static;
                margin-bottom: 30px
            }
            .view-account .content-panel {
                padding: 0
            }
            .view-account .content-panel .content-utilities .page-nav {
                position: static;
                margin-bottom: 15px
            }
            .drive-wrapper .drive-item {
                width: 100px;
                margin-right: 5px;
                float: none
            }
            .drive-wrapper .drive-item-thumb {
                width: auto;
                height: 54px
            }
            .drive-wrapper .drive-item-thumb .fa {
                font-size: 24px;
                padding-top: 0
            }
            .view-account .content-panel .avatar .figure img {
                float: none;
                margin-bottom: 15px
            }
            .view-account .file-uploader {
                margin-bottom: 15px
            }
            .view-account .mail-subject {
                max-width: 100px;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis
            }
            .view-account .content-panel .mails-wrapper .mail-item .time-container {
                position: static
            }
            .view-account .content-panel .mails-wrapper .mail-item .time-container .time {
                width: auto;
                text-align: left
            }
        }

        @media (min-width:768px) {
            .view-account .side-bar .user-info {
                padding: 0;
                padding-bottom: 15px
            }
            .view-account .mail-subject .subject {
                max-width: 200px;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis
            }
        }

        @media (min-width:992px) {
            .view-account .content-panel {
                min-height: 800px;
                border-left: 1px solid #f3f3f7;
                margin-left: 200px
            }
            .view-account .mail-subject .subject {
                max-width: 280px;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis
            }
            .view-account .side-bar {
                position: absolute;
                width: 200px;
                min-height: 600px
            }
            .view-account .side-bar .user-info {
                margin-bottom: 0;
                border-bottom: none;
                padding: 30px
            }
            .view-account .side-bar .user-info .img-profile {
                width: 120px;
                height: 120px
            }
            .view-account .side-bar .side-menu {
                text-align: left
            }
            .view-account .side-bar .side-menu .nav {
                display: block
            }
            .view-account .side-bar .side-menu .nav>li {
                display: block;
                float: none;
                font-size: 14px;
                border-bottom: 1px solid #f3f3f7;
                margin-right: 0;
                margin-bottom: 0
            }
            .view-account .side-bar .side-menu .nav>li>a {
                display: block;
                color: #9499a3;
                padding: 10px 15px;
                padding-left: 30px
            }
            .view-account .side-bar .side-menu .nav>li>a:hover {
                background: #f9f9fb
            }
            .view-account .side-bar .side-menu .nav>li.active a {
                background: #f9f9fb;
                border-right: 4px solid #40babd;
                border-bottom: none
            }
            .theme-2 .view-account .side-bar .side-menu .nav>li.active a {
                border-right-color: #6dbd63
            }
            .theme-3 .view-account .side-bar .side-menu .nav>li.active a {
                border-right-color: #497cb1
            }
            .theme-4 .view-account .side-bar .side-menu .nav>li.active a {
                border-right-color: #ec6952
            }
            .view-account .side-bar .side-menu .nav>li .icon {
                font-size: 24px;
                vertical-align: middle;
                text-align: center;
                width: 40px;
                display: inline-block
            }
        }
    </style>
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
                    <a class="nav-link menu" aria-current="page" href="/home">Home</a>
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
        <div class="icon-cart mx-3">
            <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 20">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M6 15a2 2 0 1 0 0 4 2 2 0 0 0 0-4Zm0 0h8m-8 0-1-4m9 4a2 2 0 1 0 0 4 2 2 0 0 0 0-4Zm-9-4h10l2-7H3m2 7L3 4m0 0-.792-3H1" />
            </svg>
            <span>0</span>
        </div>
        <div class="navbar-nav ms-auto">
            <div id="userInfo">
                <div class="d-flex align-items-center">
                    <div class="icon-user mx-3">
                        <img class="logo-nav" style="background: #007bff" src="/client/img/avatar.jpg" alt="" />
                    </div>
                    <a style="background:#007bff; color: #fff; font-size: 15px" class="btn logout_btn" href="/home" onclick="logout()">Logout</a>
                </div>
            </div>
        </div>
        <div class="form-check form-switch dark-mode-toggle mx-5">
            <input class="form-check-input" type="checkbox" id="darkModeToggle" />
            <label class="form-check-label" for="darkModeToggle">Dark Mode</label>
        </div>
    </div>
</nav>
<%--Main--%>
<div class="container">
    <div class="view-account">
        <section class="module">
            <div class="module-inner">
                <div class="side-bar">
                    <div class="user-info">
                        <div class="form-group d-flex flex-column align-items-center">
                            <div class="avatar-wrapper mb-3">
                                <img id="avatar" class="img-fluid" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="Avatar">
                                <input type="file" id="avatarInput" accept="image/*">
                            </div>
                            <button id="updateImage" class="btn btn-primary mt-auto">Update Image</button>
                        </div>
                    </div>
                    <nav class="side-menu">
                        <ul class="nav">
                            <li><a href="#" style="color: #007bff;" id="profileLink"><span class="fa fa-user mx-2"></span>Profile</a></li>
                            <li><a href="#" style="color: #007bff;" id="purchaseHistoryLink"><span class="fa fa-cog mx-2"></span>Purchase History</a></li>
                            <li><a href="/home" style="color: #007bff;"><span class="fa-solid fa-house mx-2"></span>Home</a></li>
                        </ul>
                    </nav>
                </div>
                <div id="contentDisplay"></div>
            </div>
        </section>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    //--------------------------- Display noi dung tuong ung----------------------
    document.addEventListener('DOMContentLoaded', function() {
        const profileLink = document.getElementById('profileLink');
        const purchaseHistoryLink = document.getElementById('purchaseHistoryLink');
        const contentDisplay = document.getElementById('contentDisplay');

        // HTML content for Profile
        const profileContent = `
                <div class="content-panel">
                    <h2 class="title">Profile<span class="pro-label label label-warning">PRO</span></h2>
                     <form class="form-horizontal">
            <fieldset class="fieldset">
                <h3 class="fieldset-title" style="color: #007bff;">Personal Info</h3>
            </fieldset>
            <fieldset class="fieldset mb-5">
                <div class="form-group">
                    <label class="col-md-2 col-sm-3 col-xs-12 control-label">Full Name</label>
                    <div class="col-md-10 col-sm-9 col-xs-12">
                        <p id="displayFullName">${user.fullName}</p>
                        <hr>
                    </div>
                </div>
                <%--<div class="form-group">--%>
                <%--    <label class="col-md-2 col-sm-3 col-xs-12 control-label mt-3">Phone</label>--%>
                <%--    <div class="col-md-10 col-sm-9 col-xs-12">--%>
                <%--        <p id="displayPhone">${user.phone}</p>--%>
                <%--        <hr>--%>
                <%--    </div>--%>
                <%--</div>--%>
                <%--<div class="form-group">--%>
                <%--    <label class="col-md-2 col-sm-3 col-xs-12 control-label mt-3">Address</label>--%>
                <%--    <div class="col-md-10 col-sm-9 col-xs-12">--%>
                <%--        <p id="displayAddress">${user.address}</p>--%>
                <%--        <hr>--%>
                <%--    </div>--%>
                <%--</div>--%>
            </fieldset>
            <div class="form-group mt-5">
                <div class="col-md-10 col-sm-9 col-xs-12 col-md-push-2 col-sm-push-3 col-xs-push-0 mt-3">
                    <button type="button" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#updateProfileModal">
                        Update Profile
                    </button>
                </div>
            </div>
        </form>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="updateProfileModal" tabindex="-1" aria-labelledby="updateProfileModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fs-3" id="updateProfileModalLabel">Update Profile</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="updateProfileForm">
                        <div class="mb-4">
                            <label for="fullName" class="form-label">Full Name</label>
                            <input type="text" class="form-control form-control-lg" id="fullName" value="Nguyen Ngoc Quy">
                        </div>
                        <div class="mb-4">
                            <label for="phone" class="form-label">Phone</label>
                            <input type="tel" class="form-control form-control-lg" id="phone" value="0763254524">
                        </div>
                        <div class="mb-4">
                            <label for="address" class="form-label">Address</label>
                            <input type="text" class="form-control form-control-lg" id="address" value="3/240 Le Duan - TP Hue">
                        </div>
                        <div class="mb-4">
                            <label for="createDay" class="form-label">Create Day</label>
                            <input type="date" class="form-control form-control-lg" id="createDay" value="1990-07-26">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-lg" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary btn-lg" id="saveChangesBtn">Save changes</button>
                </div>
            </div>
        </div>
    </div>
            `;

        // HTML content for Purchase History
        const purchaseHistoryContent = `
                <div class="content-panel">
                    <div class="row align-items-center">
                        <h3 class="title">FMobile</h3>
                        <div class="col-md-12">
                            <h1 class="mb-0">Order history</h1>
                        </div>
                        <div class="col-md-3">
                            <div class="input-group mt-5">
                                <span class="input-group-text text-primary">
                                    <a href="#"><i class="fa-solid fa-search"></i></a>
                                </span>
                                <input type="text" class="form-control text-primary" style="font-size: 15px;" placeholder="Search">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="input-group mt-5">
                                <span class="input-group-text border-1 text-primary">
                                    <i class="fa-solid fa-calendar"></i>
                                </span>
                                <input style="font-size: 15px;" type="date" class="form-control border-1" id="startDate" placeholder="From">
                                <span class="input-group-text border-1">to</span>
                                <input style="font-size: 15px;" type="date" class="form-control border-1" id="endDate" placeholder="To">
                            </div>
                        </div>
                    </div>
                    <div class="mt-5">
                        <table class="table table-responsive table-group-divider" style="font-size: 15px;">
                            <thead class="thead-light">
                                <tr>
                                    <th><input type="checkbox" class="bsn" id="selectAll"></th>
                                    <th>Order</th>
                                    <th>Product Name</th>
                                    <th>Description</th>
                                    <th>Date</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                        <tr class="delete-row-btn">
                                        <td><input type="checkbox" class="bso"></td>
                                        <td><a href="#">#10001</a></td>
                                        <td>First Last</td>
                                        <td>Admin theme, marketing theme</td>
                                        <td>01/01/2015</td>
                                        <td>$200.00</td>
                                        <td><button class="btn btn-outline-info" style="margin-right: 2px;"><i class="fa-solid fa-magnifying-glass"></i></button>
                                        <button class="btn btn-outline-danger delete-row-btn"><i class="fa-solid fa-delete-left"></i></button></td>
                                        </tr>
                                        <tr>
                                        <td><input type="checkbox" class="bso"></td>
                                        <td><a href="#">#10002</a></td>
                                        <td>Firstname Last</td>
                                        <td>Admin theme</td>
                                        <td>01/01/2015</td>
                                        <td>$100.00</td>
                                        <td><button class="btn btn-outline-info" style="margin-right: 2px;"><i class="fa-solid fa-magnifying-glass"></i></button>
                                        <button class="btn btn-outline-danger delete-row-btn"><i class="fa-solid fa-delete-left"></i></button></td>
                                        </tr>
                                        <tr>
                                        <td><input type="checkbox" class="bso"></td>
                                        <td><a href="#">#10003</a></td>
                                        <td>Name Another</td>
                                        <td>Personal blog theme</td>
                                        <td>01/01/2015</td>
                                        <td>$100.00</td>
                                        <td><button class="btn btn-outline-info" style="margin-right: 2px;"><i class="fa-solid fa-magnifying-glass"></i></button>
                                        <button class="btn btn-outline-danger delete-row-btn"><i class="fa-solid fa-delete-left"></i></button></td>
                                        </tr>
                                        <tr>
                                        <td><input type="checkbox" class="bso"></td>
                                        <td><a href="#">#10004</a></td>
                                        <td>One More</td>
                                        <td>Marketing theme, personal blog theme, admin theme</td>
                                        <td>01/01/2015</td>
                                        <td>$300.00</td>
                                        <td><button class="btn btn-outline-info" style="margin-right: 2px;"><i class="fa-solid fa-magnifying-glass"></i></button>
                                        <button class="btn btn-outline-danger delete-row-btn"><i class="fa-solid fa-delete-left"></i></button></td>
                                        </tr>
                                        <tr>
                                        <td><input type="checkbox" class="bso"></td>
                                        <td><a href="#">#10005</a></td>
                                        <td>Name Right Here</td>
                                        <td>Personal blog theme, admin theme</td>
                                        <td>01/02/2015</td>
                                        <td>$200.00</td>
                                        <td><button class="btn btn-outline-info" style="margin-right: 2px;"><i class="fa-solid fa-magnifying-glass"></i></button>
                                        <button class="btn btn-outline-danger delete-row-btn"><i class="fa-solid fa-delete-left"></i></button></td>
                                        </tr>
                                        <tr>
                                        <td><input type="checkbox" class="bso"></td>
                                        <td><a href="#">#10006</a></td>
                                        <td>First Last</td>
                                        <td>Admin theme, marketing theme</td>
                                        <td>01/01/2015</td>
                                        <td>$200.00</td>
                                        <td><button class="btn btn-outline-info" style="margin-right: 2px;"><i class="fa-solid fa-magnifying-glass"></i></button>
                                        <button class="btn btn-outline-danger delete-row-btn"><i class="fa-solid fa-delete-left"></i></button></td>
                                        </tr>
                                        <tr>
                                        <td><input type="checkbox" class="bso"></td>
                                        <td><a href="#">#10007</a></td>
                                        <td>Firstname Last</td>
                                        <td>Admin theme</td>
                                        <td>01/01/2015</td>
                                        <td>$100.00</td>
                                        <td><button class="btn btn-outline-info" style="margin-right: 2px;"><i class="fa-solid fa-magnifying-glass"></i></button>
                                        <button class="btn btn-outline-danger delete-row-btn"><i class="fa-solid fa-delete-left"></i></button></td>
                                        </tr>
                                        <tr>
                                        <td><input type="checkbox" class="bso"></td>
                                        <td><a href="#">#10008</a></td>
                                        <td>Name Another</td>
                                        <td>Personal blog theme</td>
                                        <td>01/01/2015</td>
                                        <td>$100.00</td>
                                        <td><button class="btn btn-outline-info" style="margin-right: 2px;"><i class="fa-solid fa-magnifying-glass"></i></button>
                                        <button class="btn btn-outline-danger delete-row-btn"><i class="fa-solid fa-delete-left"></i></button></td>
                                        </tr>
                                        <tr>
                                        <td><input type="checkbox" class="bso"></td>
                                        <td><a href="#">#10009</a></td>
                                        <td>One More</td>
                                        <td>Marketing theme, personal blog theme, admin theme</td>
                                        <td>01/01/2015</td>
                                        <td>$300.00</td>
                                        <td><button class="btn btn-outline-info" style="margin-right: 2px;"><i class="fa-solid fa-magnifying-glass"></i></button>
                                        <button class="btn btn-outline-danger delete-row-btn"><i class="fa-solid fa-delete-left"></i></button></td>
                                        </tr>
                                        <tr>
                                        <td><input type="checkbox" class="bso"></td>
                                        <td><a href="#">#10010</a></td>
                                        <td>Name Right Here</td>
                                        <td>Personal blog theme, admin theme</td>
                                        <td>01/02/2015</td>
                                        <td>$200.00</td>
                                        <td><button class="btn btn-outline-info" style="margin-right: 2px;"><i class="fa-solid fa-magnifying-glass"></i></button>
                                        <button class="btn btn-outline-danger delete-row-btn"><i class="fa-solid fa-delete-left"></i></button></td>
                                        </tr>
                                        <tr>
                                        <td><input type="checkbox" class="bso"></td>
                                        <td><a href="#">#10011</a></td>
                                        <td>First Last</td>
                                        <td>Admin theme, marketing theme</td>
                                        <td>01/01/2015</td>
                                        <td>$200.00</td>
                                        </tr>
                                        <tr>
                                        <td><input type="checkbox" class="bso"></td>
                                        <td><a href="#">#10012</a></td>
                                        <td>Firstname Last</td>
                                        <td>Admin theme</td>
                                        <td>01/01/2015</td>
                                        <td>$100.00</td>
                                        </tr>
                                        <tr>
                                        <td><input type="checkbox" class="bso"></td>
                                        <td><a href="#">#10013</a></td>
                                        <td>Name Another</td>
                                        <td>Personal blog theme</td>
                                        <td>01/01/2015</td>
                                        <td>$100.00</td>
                                        </tr>
                                        <tr>
                                        <td><input type="checkbox" class="bso"></td>
                                        <td><a href="#">#10014</a></td>
                                        <td>One More</td>
                                        <td>Marketing theme, personal blog theme, admin theme</td>
                                        <td>01/01/2015</td>
                                        <td>$300.00</td>
                                        </tr>
                                        <tr>
                                        <td><input type="checkbox" class="bso"></td>
                                        <td><a href="#">#10015</a></td>
                                        <td>Name Right Here</td>
                                        <td>Personal blog theme, admin theme</td>
                                        <td>01/02/2015</td>
                                        <td>$200.00</td>
                                        </tr>
                                        <tr>
                                        <td><input type="checkbox" class="bso"></td>
                                        <td><a href="#">#10016</a></td>
                                        <td>First Last</td>
                                        <td>Admin theme, marketing theme</td>
                                        <td>01/01/2015</td>
                                        <td>$200.00</td>
                                        </tr>
                                        <tr>
                                        <td><input type="checkbox" class="bso"></td>
                                        <td><a href="#">#10017</a></td>
                                        <td>Firstname Last</td>
                                        <td>Admin theme</td>
                                        <td>01/01/2015</td>
                                        <td>$100.00</td>
                                        </tr>
                                        <tr>
                                        <td><input type="checkbox" class="bso"></td>
                                        <td><a href="#">#10018</a></td>
                                        <td>Name Another</td>
                                        <td>Personal blog theme</td>
                                        <td>01/01/2015</td>
                                        <td>$100.00</td>
                                        </tr>
                                        <tr>
                                        <td><input type="checkbox" class="bso"></td>
                                        <td><a href="#">#10019</a></td>
                                        <td>One More</td>
                                        <td>Marketing theme, personal blog theme, admin theme</td>
                                        <td>01/01/2015</td>
                                        <td>$300.00</td>
                                        </tr>
                                        <tr>
                                        <td><input type="checkbox" class="bso"></td>
                                        <td><a href="#">#10020</a></td>
                                        <td>Name Right Here</td>
                                        <td>Personal blog theme, admin theme</td>
                                        <td>01/02/2015</td>
                                        <td>$200.00</td>
                                    </tbody>
                        </table>
                    </div>
                    <div>
                        <ul class="pagination pagination-lg">
                            <li class="page-item"><a class="page-link" href="#">Prev</a></li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">4</a></li>
                            <li class="page-item"><a class="page-link" href="#">5</a></li>
                            <li class="page-item"><a class="page-link" href="#">Next</a></li>
                        </ul>
                    </div>
                </div>
            `;

        // Function to display profile content
        function displayProfile() {
            contentDisplay.innerHTML = profileContent;
        }

        // Function to display purchase history content
        function displayPurchaseHistory() {
            contentDisplay.innerHTML = purchaseHistoryContent;
            setupPagination();
            setupSelectAll();

            const bulkDeleteButton = document.querySelector('.btn-outline-danger');
            if (bulkDeleteButton) {
                bulkDeleteButton.addEventListener('click', deleteSelectedRows);
            }

            // Add event listeners for individual delete buttons
            const rows = document.querySelectorAll('tbody tr');
            rows.forEach(row => {
                const deleteButton = row.querySelector('.delete-row-btn');
                if (deleteButton) {
                    deleteButton.addEventListener('click', () => deleteRow(row));
                }
            });
        }

        // ------------------------ Pagination ------------------------------
        function setupPagination() {
            const rowsPerPage = 8; // Số dòng trên mỗi trang
            const rows = document.querySelectorAll('tbody tr'); // Tất cả các dòng trong bảng
            const totalRows = rows.length;
            const totalPages = Math.ceil(totalRows / rowsPerPage); // Tổng số trang

            let currentPage = 1; // Trang hiện tại mặc định là trang 1

            function showPage(page) {
                currentPage = page;

                // Ẩn tất cả các dòng
                rows.forEach((row) => {
                    row.style.display = 'none';
                });

                // Hiển thị dòng thuộc trang hiện tại
                const startRow = (page - 1) * rowsPerPage;
                const endRow = startRow + rowsPerPage;
                for (let i = startRow; i < endRow && i < totalRows; i++) {
                    rows[i].style.display = '';
                }

                // Cập nhật trạng thái phân trang (hiển thị trang hiện tại)
                document.querySelectorAll('.pagination .page-item').forEach((item, index) => {
                    if (index === page) {
                        item.classList.add('active');
                    } else {
                        item.classList.remove('active');
                    }
                });
            }

            //-------------------- Tạo phân trang --------------------
            const pagination = document.querySelector('.pagination');
            const pageLinks = pagination.querySelectorAll('.page-item a'); // Lấy tất cả các số trang

            //-------------------- Gắn sự kiện click cho từng số trang -------------------
            pageLinks.forEach((link, index) => {
                link.addEventListener('click', function (e) {
                    e.preventDefault();
                    if (index === 0) { // 'Prev' được chọn
                        if (currentPage > 1) {
                            showPage(currentPage - 1);
                        }
                    } else if (index === pageLinks.length - 1) { // 'Next' được chọn
                        if (currentPage < totalPages) {
                            showPage(currentPage + 1);
                        }
                    } else {
                        showPage(index); // Chuyển đến số trang tương ứng
                    }
                });
            });

            // Hiển thị trang đầu tiên khi tải trang
            showPage(1);
        }

        // ------------------------ Select All ------------------------------
        function setupSelectAll() {
            const selectAllCheckbox = document.getElementById('selectAll');
            const rowCheckboxes = document.querySelectorAll('.bso');

            selectAllCheckbox.addEventListener('change', function() {
                rowCheckboxes.forEach(checkbox => {
                    checkbox.checked = this.checked;
                });
            });

            rowCheckboxes.forEach(checkbox => {
                checkbox.addEventListener('change', function() {
                    selectAllCheckbox.checked = Array.from(rowCheckboxes).every(cb => cb.checked);
                });
            });
        }

        // ------------------------ Delete Row ------------------------------
        function deleteRow(row) {
            if (confirm('Are you sure you want to delete this row?')) {
                row.remove();
                updateTableAfterDeletion();
            }
        }
        function deleteSelectedRows() {
            const selectedRows = Array.from(document.querySelectorAll('.bso:checked'))
                .map(checkbox => checkbox.closest('tr'));

            if (selectedRows.length === 0) {
                alert('No rows selected for deletion.');
                return;
            }

            if (confirm(`Are you sure you want to delete ${selectedRows.length} selected row(s)?`)) {
                selectedRows.forEach(row => {
                    row.remove();
                });

                // Reset select all checkbox
                document.getElementById('selectAll').checked = false;

                // Update pagination after deletion
                setupPagination();

                // Update the table display
                showPage(currentPage);

                alert(`${selectedRows.length} row(s) have been deleted.`);
            }
        }
        // Display profile content by default when the page loads
        displayProfile();

        // Event listener for Profile link
        profileLink.addEventListener('click', function(e) {
            e.preventDefault();
            displayProfile();
        });

        // Event listener for Purchase History link
        purchaseHistoryLink.addEventListener('click', function(e) {
            e.preventDefault();
            displayPurchaseHistory();
        });
    });

    // ------------------------ Xu ly ngay -----------------------
    document.getElementById('startDate').addEventListener('change', handleDateChange);
    document.getElementById('endDate').addEventListener('change', handleDateChange);

    function handleDateChange() {
        const startDate = document.getElementById('startDate').value;
        const endDate = document.getElementById('endDate').value;
        if (startDate && endDate) {
            // Xử lý dữ liệu với khoảng thời gian đã chọn
            console.log('Selected date range:', startDate, 'to', endDate);
        }
    }
    // ------------------------- Update Profile --------------------
    document.addEventListener('DOMContentLoaded', function() {
        const saveChangesBtn = document.getElementById('saveChangesBtn');
        const modal = new bootstrap.Modal(document.getElementById('updateProfileModal'));

        saveChangesBtn.addEventListener('click', function() {
            // Update the displayed information
            document.getElementById('displayFullName').textContent = document.getElementById('fullName').value;
            document.getElementById('displayPhone').textContent = document.getElementById('phone').value;
            document.getElementById('displayAddress').textContent = document.getElementById('address').value;

            const createDay = new Date(document.getElementById('createDay').value);
            document.getElementById('displayCreateDay').textContent = createDay.toLocaleDateString('en-GB');

            // Close the modal
            modal.hide();
        });
    });

    //--------------------------- Upload anh----------------------
    document.addEventListener('DOMContentLoaded', function() {
        const avatarInput = document.getElementById('avatarInput');
        const avatar = document.getElementById('avatar');
        const updateButton = document.getElementById('updateImage');

        // Lấy URL của avatar từ localStorage khi tải lại trang
        const savedAvatar = localStorage.getItem('avatar');
        if (savedAvatar) {
            avatar.src = savedAvatar;
        }

        avatarInput.addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    avatar.src = e.target.result;
                }
                reader.readAsDataURL(file);
            }
        });

        updateButton.addEventListener('click', function() {
            // Lưu URL của ảnh vào localStorage
            const currentAvatarSrc = avatar.src;
            localStorage.setItem('avatar', currentAvatarSrc);

            // Giả lập việc upload ảnh thành công
            alert('Image updated successfully!');
        });
    });

    //----------------------- Log in / Register---------------------
    // Check login state on page load
    document.addEventListener('DOMContentLoaded', function() {
        checkLoginState();
    });

    function checkLoginState() {
        const isLoggedIn = localStorage.getItem('isLoggedIn') === 'true';
        updateUI(isLoggedIn);
    }

    function updateUI(isLoggedIn) {
        if (isLoggedIn) {
            document.getElementById('guestButtons').classList.add('d-none');
            document.getElementById('userInfo').classList.remove('d-none');
        } else {
            document.getElementById('guestButtons').classList.remove('d-none');
            document.getElementById('userInfo').classList.add('d-none');
        }
    }

    function login() {
        // Simulate login process
        setTimeout(() => {
            localStorage.setItem('isLoggedIn', 'true');
            updateUI(true);
        }, 1000); // Delay to simulate API call
    }

    function register() {
        // Simulate registration process
        setTimeout(() => {
            localStorage.setItem('isLoggedIn', 'true');
            updateUI(true);
        }, 1000); // Delay to simulate API call
    }

    function logout() {
        // Simulate logout process
        localStorage.setItem('isLoggedIn', 'false');
        updateUI(false);
    }

    const darkModeToggle = document.getElementById("darkModeToggle");
    darkModeToggle.addEventListener("change", function () {
        document.body.classList.toggle("dark-mode", darkModeToggle.checked);
    });
//     ------------------------UserInfo-----------------
    $(document).ready(function() {
        $('#userAvatar').click(function() {
            $.ajax({
                url: '/user/info',
                type: 'GET',
                success: function(response) {
                    $('#displayFullName').text(response.fullName);
                },
                error: function() {
                    alert('Error fetching user information');
                }
            });
        });
    });
</script>
</body>
</html>


