<<<<<<< HEAD
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>FMobile</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    />
    <style>
      * {
        box-sizing: border-box;
      }

      html {
        font-size: 62.5%;
      }

      body {
        font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande",
          "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
      }

      .logo-nav {
        font-size: 500px;
        width: 100px;
        transition: transform 0.3s ease-in-out;
      }

      .logo-nav:hover {
        transform: scale(1.1);
      }

      img:hover {
        opacity: 0.9;
        cursor: pointer;
      }

      .icon-button {
        background: none;
        border: none;
        padding: 0;
        font-size: 25px;
        color: #333;
        transition: color 0.3s ease;
      }

      .icon-button:hover {
        color: #007bff;
      }

      /* dark-mode */
      body.dark-mode .signin_btn {
        color: #fff;
      }

      body.dark-mode .icon-button {
        color: #fff;
      }

      body.dark-mode .icon-button:hover {
        color: #4da3ff;
      }

      /* img */
      /* .img {
        transition: 0.4s ease;
      }

      .img:hover > :not(:hover) {
        filter: blur(8px);
      } */

      .btn {
        width: 80px;
        height: 40px;
        line-height: 30px;
        border-radius: 10px;
      }

      .navbar {
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      }

      .btn-outline-success {
        color: white;
        border-color: #007bff;
        background-color: #0d6efd;
      }

      .btn-outline-success:hover {
        opacity: 0.8;
        background-color: #0d6efd;
      }

      .header {
        margin-top: 100px;
      }

      h1 {
        font-size: 4rem;
        font-weight: 700;
      }

      .header_baner {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
      }

      /* Navigation */
      .nav-link {
        font-size: 2rem;
      }

      .navbar-nav {
        display: flex;
        gap: 1rem;
        list-style: none;
      }

      .navbar-nav .nav-item {
        display: grid;
        place-content: center;
        margin: 0;
      }

      .navbar-nav .nav-link {
        color: #777676;
        font-weight: 200;
        position: relative;
        padding-bottom: 0.25rem;
      }

      .navbar-nav .nav-link::before {
        content: "";
        position: absolute;
        width: 100%;
        height: 2px;
        background: #777676;
        border-radius: 5px;
        transform: scale(0);
        transition: all 0.6s ease;
        bottom: 0;
        left: 0;
      }

      .navbar-nav .nav-link:hover::before {
        transform: scale(1);
      }

      body.dark-mode {
        background-color: #333;
        color: #fff;
      }

      body.dark-mode .navbar {
        background-color: #222 !important;
      }

      #newMobile,
      #best-selling,
      #tablet,
      #Advertisement,
      #Review,
      #Member {
        margin-top: 120px;
        margin-bottom: 50px;
      }

      .search_nav {
        width: 300px;
      }

      .product {
        transition: transform 0.3s ease;
      }

      .product:hover {
        transform: scale(1.1);
      }

      h3 {
        margin-top: 10px;
        font-size: 2rem;
        font-weight: 300;
      }

      p {
        font-size: 1.5rem;
        font-weight: 300;
      }

      .btn_header {
        margin-right: auto;
        margin-top: 10px;
        width: 80px;
        font-size: 10px;
        height: 40px;
      }

      .review_desc {
        font-size: 1.9rem;
      }

      .review_btn {
        margin-right: auto;
        font-size: 1.3rem;
      }

      .cate_desc {
        margin-top: 20px;
      }

      .grid-wrapper {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        grid-auto-rows: 100px;
        /* dien vao nhung cho trong */
        grid-auto-flow: dense;
        gap: 10px;
      }

      .grid-wrapper div img {
        height: 100%;
        width: 100%;
        object-fit: cover;
        border-radius: 10px;
      }

      .tall {
        /* tinh tu cho no dung */
        grid-row: span 2;
      }

      .wide {
        grid-column: span 2;
      }

      .big {
        grid-row: span 2;
        grid-column: span 2;
      }

      .logo-nav {
        height: 40px;
        transition: transform 0.3s ease-in-out;
      }

      .logo-nav:hover {
        transform: scale(1.1) rotate(5deg);
      }

      .logo {
        height: 200px;
        width: 200px;
        font-weight: bold;
        color: #007bff;
      }

      .landing_desc {
        font-size: 2rem;
      }

      .list-unstyled {
        font-size: 1.2rem;
      }

      .footer_btn {
        width: 80px;
      }

      footer {
        font-size: 0.9rem;
        color: #6c757d;
      }

      svg {
        width: 20px;
      }

      .icon-cart {
        position: relative;
        cursor: pointer;
      }

      .icon-cart span {
        position: absolute;
        background-color: red;
        width: 20px;
        height: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius: 50%;
        color: #fff;
        top: 50%;
        right: -12px;
        display: none;
      }

      .icon-cart span.visible {
        display: flex;
        /* Hiển thị span khi có lớp 'visible' */
      }

      .buttons button {
        text-align: center;
        font-size: 12px;
        color: #fff;
        width: 100px;
        padding: 10px;
        border: 0;
        outline: none;
        cursor: pointer;
        margin-top: 5px;
        border-radius: 20px;
      }

      /* Hiệu ứng khi nhấp vào nút Add To Cart */
      .addtocart {
        position: relative;
        overflow: hidden;
        transition: background-color 0.3s;
      }

      .addtocart:active {
        background-color: #e0a800 !important;
        /* Màu hơi tối hơn khi nhấn */
      }

      .addtocart:hover {
        background-color: #e0a800 !important;
        /* Màu hơi tối hơn khi hover */
      }

      /* Hiệu ứng gợn sóng */
      .addtocart::after {
        content: "";
        position: absolute;
        top: 50%;
        left: 50%;
        width: 5px;
        height: 5px;
        background: rgba(255, 255, 255, 0.5);
        opacity: 0;
        border-radius: 100%;
        transform: scale(1, 1) translate(-50%);
        transform-origin: 50% 50%;
      }

      @keyframes ripple {
        0% {
          transform: scale(0, 0);
          opacity: 1;
        }

        20% {
          transform: scale(25, 25);
          opacity: 1;
        }

        100% {
          opacity: 0;
          transform: scale(40, 40);
        }
      }

      .addtocart:focus:not(:active)::after {
        animation: ripple 1s ease-out;
      }

      /* Hiệu ứng bump cho số lượng giỏ hàng */
      .icon-cart span.animate {
        animation: bump 0.5s ease-out;
      }

      @keyframes bump {
        0% {
          transform: scale(1);
        }

        50% {
          transform: scale(1.2);
        }

        100% {
          transform: scale(1);
        }
      }

      /* cart */
      .cartTab {
        width: 400px;
        background-color: #353432;
        color: #eee;
        position: fixed;
        inset: 0 -400px 0 auto;
        display: grid;
        grid-template-rows: 70px 1fr 70px;
        transition: 0.5s;
      }

      body .showCart .cartTab {
        inset: 0 0 0 auto;
      }

      body .showCart .container {
        transform: translateX(-250px);
      }

      .container {
        transition: transform 0.5s;
      }

      .cartTab .btn {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        width: auto;
        height: auto;
      }

      .cartTab .btn button {
        background-color: #e8bc0e;
        border: none;
        font-family: Poppins;
        font-weight: 500;
        cursor: pointer;
      }

      .cartTab .btn .close {
        background-color: #eee;
        color: #353432;
      }

      .listCart .item img {
        width: 100%;
        height: auto;
        object-fit: cover;
      }

      .listCart .item {
        display: grid;
        grid-template-columns: 70px 1.5fr 50px 100px 20px;
        gap: 5px;
        text-align: center;
        align-items: center;
        margin-bottom: 10px;
      }

      .quantity span {
        display: inline-block;
        width: 15px;
        height: 15px;
        background-color: #eee;
        color: #555;
        border-radius: 50%;
        cursor: pointer;
      }

      .item .remove {
        color: red;
        cursor: pointer;
      }

      .listCart .quantity span:nth-child(2) {
        background-color: transparent;
        color: #eee;
      }

      .listCart .item:nth-child(even) {
        background-color: #eee1;
      }

      .listCart {
        overflow: auto;
      }

      .listCart ::-webkit-scrollbar {
        width: 0;
      }

      .cartTab .checkout {
        background-color: #e8bc0e;
        color: #353432;
      }

      body.showCart .cartTab {
        right: 0;
      }

      .listCart {
        overflow-y: auto;
        padding: 10px;
      }

      .search-icon {
        position: relative;
        width: 300px;
      }

      .search_nav {
        width: 100%;
        padding: 10px 40px 10px 15px;
        font-size: 1.5rem;
        border: 1px solid #ccc;
        border-radius: 5px;
      }

      .search-icon svg {
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        color: #666;
        cursor: pointer;
      }
      /* Images slide */
      #bannerCarousel {
        position: relative;
        width: 100%;
        max-width: 600px;
        margin: 0 auto;
        overflow: hidden;
      }
      .carousel-inner {
        display: flex;
        transition: transform 0.5s ease;
      }
      .carousel-item {
        min-width: 100%;
      }
      .carousel-item img {
        width: 100%;
        height: auto;
      }
      .carousel-control {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        background: rgba(0, 0, 0, 0.5);
        color: white;
        padding: 10px;
        text-decoration: none;
      }
      .carousel-control-prev {
        left: 10px;
      }
      .carousel-control-next {
        right: 10px;
      }
    </style>
  </head>

  <body class="">
    <!-- Nav -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
      <div class="container">
        <a href="#"
          ><img class="logo-nav" src="/img/FMobileLogo.png" alt="FMobile" />
        </a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNav"
          aria-controls="navbarNav"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse mx-5" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link menu" aria-current="page" href="#">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link menu" href="#">Mobile</a>
            </li>
            <li class="nav-item">
              <a class="nav-link menu" href="#">Laptop</a>
            </li>
            <li class="nav-item">
              <a class="nav-link menu" href="#">Tablet</a>
            </li>
            <li class="nav-item">
              <a class="nav-link menu" href="#">Accessories</a>
            </li>
            <form class="d-flex mx-5">
              <div class="search-icon">
                <input
                  class="form-control search_nav"
                  type="search"
                  placeholder="Search"
                  aria-label="Search"
                  style="font-size: 1.5rem"
                />
                <svg
                  class="w-6 h-6 text-gray-800 dark:text-white"
                  aria-hidden="true"
                  xmlns="http://www.w3.org/2000/svg"
                  width="24"
                  height="24"
                  fill="none"
                  viewBox="0 0 24 24"
                >
                  <path
                    stroke="currentColor"
                    stroke-linecap="round"
                    stroke-width="2"
                    d="m21 21-3.5-3.5M17 10a7 7 0 1 1-14 0 7 7 0 0 1 14 0Z"
                  />
                </svg>
              </div>
            </form>
          </ul>
        </div>
        <div class="icon-cart">
          <svg
            aria-hidden="true"
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 18 20"
          >
            <path
              stroke="currentColor"
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M6 15a2 2 0 1 0 0 4 2 2 0 0 0 0-4Zm0 0h8m-8 0-1-4m9 4a2 2 0 1 0 0 4 2 2 0 0 0 0-4Zm-9-4h10l2-7H3m2 7L3 4m0 0-.792-3H1"
            />
          </svg>
          <span>0</span>
        </div>
        <button class="btn signin_btn" style="font-size: 1.3rem">Log In</button>
        <button
          class="btn btn-primary"
          style="margin-left: 5px; height: 40px; font-size: 1.3rem"
        >
          Register
        </button>
        <div class="form-check form-switch dark-mode-toggle mx-5">
          <input class="form-check-input" type="checkbox" id="darkModeToggle" />
          <label
            class="form-check-label"
            style="width: 55px"
            for="darkModeToggle"
            >Dark Mode</label
          >
        </div>
      </div>
    </nav>
    <!-- Header -->
    <div class="container">
      <div class="row header">
        <div class="col-md-6 header_baner">
          <h1 style="font-size: 6rem">
            Let's go to store. You will everything you need.
          </h1>
          <a class="btn btn_header btn-primary">Get Started</a>
        </div>
        <!-- Anh truoc ngang -->
        <div
          id="bannerCarousel"
          class="carousel slide col-md-6"
          data-ride="carousel"
          data-interval="3000"
        >
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img
                src="/img/galaxy z fold 4.jpg"
                class="d-block w-100 img-fluid"
                alt="Galaxy Z Fold 4"
              />
            </div>
            <div class="carousel-item">
              <img
                src="/img/iphone-16-pro-fi.webp"
                class="d-block w-100 img-fluid"
                alt="Iphone 16"
              />
            </div>
            <div class="carousel-item">
              <img
                src="/img/huaweinew.png"
                class="d-block w-100 img-fluid"
                alt="Huawei"
              />
            </div>
          </div>

          <!-- Controls -->
          <a
            class="carousel-control-prev"
            href="#bannerCarousel"
            role="button"
            data-slide="prev"
          >
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a
            class="carousel-control-next"
            href="#bannerCarousel"
            role="button"
            data-slide="next"
          >
            <span
              class="carousel-control-next-icon mx-5"
              aria-hidden="true"
            ></span>
            <span class="sr-only">Next</span>
          </a>

          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li
              data-target="#bannerCarousel"
              data-slide-to="0"
              class="active"
            ></li>
            <li data-target="#bannerCarousel" data-slide-to="1"></li>
          </ol>
        </div>
      </div>
    </div>
    <!-- New Mobile -->
    <div class="container">
      <h1 class="text-center" id="newMobile">NEW MOBILE</h1>
      <div class="row">
        <div class="col-md-6">
          <div class="row">
            <div class="col-md-6">
              <a href="#" class="w-100"
                ><img
                  src="/img/galaxym55.jpg"
                  class="img-fluid product"
                  alt="Galaxy M55"
              /></a>
            </div>
            <div class="col-md-6 p-4">
              <h3>Galaxy M55</h3>
              <p class="font-heading text-action-1 mt-3" style="color: #007bff">
                $1200
              </p>
              <p>
                Disarticulation through wrist, secondary closure or scar
                revision
              </p>
              <div class="row">
                <div
                  class="buttons"
                  style="
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                  "
                >
                  <button class="buy bg-primary">Buy Now</button>
                  <button class="addtocart bg-warning">Add To Cart</button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="row">
            <div class="col-md-6">
              <a href="#" class="w-100"
                ><img
                  src="/img/iphone-16-pro-titan-trang.png"
                  class="img-fluid product"
                  alt="iPhone 16"
              /></a>
            </div>
            <div class="col-md-6 p-4">
              <h3>Iphone 16 Pro</h3>
              <p class="font-heading text-action-1 mt-3" style="color: #007bff">
                $1200
              </p>
              <p>
                Disarticulation through wrist, secondary closure or scar
                revision
              </p>
              <div class="row">
                <div
                  class="buttons"
                  style="
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                  "
                >
                  <button class="buy bg-primary">Buy Now</button>
                  <button class="addtocart bg-warning">Add To Cart</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6">
          <div class="row">
            <div class="col-md-6">
              <a href="#" class="w-100"
                ><img
                  src="/img/xiaomiredmi13.jpg"
                  class="img-fluid product mt-5"
                  alt="Xiaomi Redmi 13"
              /></a>
            </div>
            <div class="col-md-6 p-4 mt-5">
              <h3>Xiaomi Redmi 13</h3>
              <p class="font-heading text-action-1 mt-3" style="color: #007bff">
                $1200
              </p>
              <p>
                Disarticulation through wrist, secondary closure or scar
                revision
              </p>
              <div class="row">
                <div
                  class="buttons"
                  style="
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                  "
                >
                  <button class="buy bg-primary">Buy Now</button>
                  <button class="addtocart bg-warning">Add To Cart</button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="row">
            <div class="col-md-6">
              <a href="#" class="w-100"
                ><img
                  src="/img/huawei mate 20.jpg"
                  class="img-fluid product mt-5"
                  alt="Huawei Mate 20"
              /></a>
            </div>
            <div class="col-md-6 p-4 mt-5">
              <h3>Huawei Mate 20</h3>
              <p class="font-heading text-action-1 mt-3" style="color: #007bff">
                $1200
              </p>
              <p>
                Disarticulation through wrist, secondary closure or scar
                revision
              </p>
              <div class="row">
                <div
                  class="buttons"
                  style="
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                  "
                >
                  <button class="buy bg-primary">Buy Now</button>
                  <button class="addtocart bg-warning">Add To Cart</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Best Seller -->
    <div class="container">
      <h1 class="text-center" id="best-selling">BEST SELLING</h1>
      <div class="row">
        <div class="col-md-3">
          <img
            src="/img/note20.jpg"
            class="img-fluid product"
            alt="Galaxy Note 20 Ultra"
          />
          <h3>Galaxy Note 20 Ultra</h3>
          <p class="font-heading text-action-1 mt-3" style="color: #007bff">
            $1200
          </p>
          <p>
            Disarticulation through wrist, secondary closure or scar revision
          </p>
          <div
            class="buttons"
            style="
              display: flex;
              justify-content: space-between;
              align-items: center;
            "
          >
            <button class="buy bg-primary">Buy Now</button>
            <button class="addtocart bg-warning">Add To Cart</button>
          </div>
        </div>
        <div class="col-md-3">
          <img
            src="/img/s22 ultra.jpg"
            class="img-fluid product"
            alt="Galaxy S22 Ultra"
          />
          <h3>Galaxy S22 Ultra</h3>
          <p class="font-heading text-action-1 mt-3" style="color: #007bff">
            $1200
          </p>
          <p>
            Disarticulation through wrist, secondary closure or scar revision
          </p>
          <div
            class="buttons"
            style="
              display: flex;
              justify-content: space-between;
              align-items: center;
            "
          >
            <button class="buy bg-primary">Buy Now</button>
            <button class="addtocart bg-warning">Add To Cart</button>
          </div>
        </div>
        <div class="col-md-3">
          <img
            src="/img/iphone-16-pro-titan-trang.png"
            class="img-fluid product"
            alt="Iphone 16"
          />
          <h3>Iphone 16</h3>
          <p class="font-heading text-action-1 mt-3" style="color: #007bff">
            $600
          </p>
          <p>
            Disarticulation through wrist, secondary closure or scar revision
          </p>
          <div
            class="buttons"
            style="
              display: flex;
              justify-content: space-between;
              align-items: center;
            "
          >
            <button class="buy bg-primary">Buy Now</button>
            <button class="addtocart bg-warning">Add To Cart</button>
          </div>
        </div>
        <div class="col-md-3">
          <img
            src="/img/huawei mate 20.jpg"
            class="img-fluid product"
            alt="Huawei Mate 20"
          />
          <h3>Huawei Mate 20</h3>
          <p class="font-heading text-action-1 mt-3" style="color: #007bff">
            $600
          </p>
          <p>
            Disarticulation through wrist, secondary closure or scar revision
          </p>
          <div
            class="buttons"
            style="
              display: flex;
              justify-content: space-between;
              align-items: center;
            "
          >
            <button class="buy bg-primary">Buy Now</button>
            <button class="addtocart bg-warning">Add To Cart</button>
          </div>
        </div>
        <div class="row mt-5">
          <div class="col-md-3">
            <img
              src="/img/galaxym55.jpg"
              class="img-fluid product my-3"
              alt="Galaxy M55"
            />
            <h3>Galaxy M55</h3>
            <p class="font-heading text-action-1 mt-3" style="color: #007bff">
              $1200
            </p>
            <p>
              Disarticulation through wrist, secondary closure or scar revision
            </p>
            <div
              class="buttons"
              style="
                display: flex;
                justify-content: space-between;
                align-items: center;
              "
            >
              <button class="buy bg-primary">Buy Now</button>
              <button class="addtocart bg-warning">Add To Cart</button>
            </div>
          </div>
          <div class="col-md-3">
            <img
              src="/img/huawei-p50-600x600.jpg"
              class="img-fluid product my-3"
              alt="Huawei P50"
            />
            <h3>Huawei P50</h3>
            <p class="font-heading text-action-1 mt-3" style="color: #007bff">
              $1200
            </p>
            <p>
              Disarticulation through wrist, secondary closure or scar revision
            </p>
            <div
              class="buttons"
              style="
                display: flex;
                justify-content: space-between;
                align-items: center;
              "
            >
              <button class="buy bg-primary">Buy Now</button>
              <button class="addtocart bg-warning">Add To Cart</button>
            </div>
          </div>
          <div class="col-md-3">
            <img
              src="/img/huawei-nova-8-2021-600x600.jpg"
              class="img-fluid product my-3"
              alt="Huawei Nova 8"
            />
            <h3>Huawei Nova 8</h3>
            <p class="font-heading text-action-1 mt-3" style="color: #007bff">
              $600
            </p>
            <p>
              Disarticulation through wrist, secondary closure or scar revision
            </p>
            <div
              class="buttons"
              style="
                display: flex;
                justify-content: space-between;
                align-items: center;
              "
            >
              <button class="buy bg-primary">Buy Now</button>
              <button class="addtocart bg-warning">Add To Cart</button>
            </div>
          </div>
          <div class="col-md-3">
            <img
              src="/img/A05.png"
              class="img-fluid product my-3"
              alt="Galaxy S24 Ultra"
            />
            <h3>Galaxy S24 Ultra</h3>
            <p class="font-heading text-action-1 mt-3" style="color: #007bff">
              $600
            </p>
            <p>
              Disarticulation through wrist, secondary closure or scar revision
            </p>
            <div
              class="buttons"
              style="
                display: flex;
                justify-content: space-between;
                align-items: center;
              "
            >
              <button class="buy bg-primary">Buy Now</button>
              <button class="addtocart bg-warning">Add To Cart</button>
            </div>
          </div>
        </div>
      </div>
      <div class="container">
        <h1 class="text-center" id="tablet">TABLET</h1>
        <div class="row">
          <div class="col-md-6">
            <div class="row">
              <div class="col-md-6">
                <a href="#" class="w-100"
                  ><img
                    src="/img/Airpad pro 2020.jpg"
                    class="img-fluid product"
                    alt="Ipad Air pro 2020"
                /></a>
              </div>
              <div class="col-md-6 p-4">
                <h3>Ipad Air pro 2020</h3>
                <p
                  class="font-heading text-action-1 mt-3"
                  style="color: #007bff"
                >
                  $1200
                </p>
                <p>
                  Disarticulation through wrist, secondary closure or scar
                  revision
                </p>
                <div class="row">
                  <div
                    class="buttons"
                    style="
                      display: flex;
                      justify-content: space-between;
                      align-items: center;
                    "
                  >
                    <button class="buy bg-primary">Buy Now</button>
                    <button class="addtocart bg-warning">Add To Cart</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="row">
              <div class="col-md-6">
                <a href="#" class="w-100"
                  ><img
                    src="/img/Ipad pro 2017.jpg"
                    class="img-fluid product"
                    alt="Ipad pro 2017"
                /></a>
              </div>
              <div class="col-md-6 p-4">
                <h3>Ipad pro 2017</h3>
                <p
                  class="font-heading text-action-1 mt-3"
                  style="color: #007bff"
                >
                  $1200
                </p>
                <p>
                  Disarticulation through wrist, secondary closure or scar
                  revision
                </p>
                <div class="row">
                  <div
                    class="buttons"
                    style="
                      display: flex;
                      justify-content: space-between;
                      align-items: center;
                    "
                  >
                    <button class="buy bg-primary">Buy Now</button>
                    <button class="addtocart bg-warning">Add To Cart</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="row">
              <div class="col-md-6">
                <a href="#" class="w-100"
                  ><img
                    src="/img/ipad-air-4th-generation-space-gray.jpg"
                    class="img-fluid product"
                    alt="Ipad Air 4th"
                /></a>
              </div>
              <div class="col-md-6 p-4 mt-5">
                <h3>Ipad Air 4th</h3>
                <p
                  class="font-heading text-action-1 mt-3"
                  style="color: #007bff"
                >
                  $1200
                </p>
                <p>
                  Disarticulation through wrist, secondary closure or scar
                  revision
                </p>
                <div class="row">
                  <div
                    class="buttons"
                    style="
                      display: flex;
                      justify-content: space-between;
                      align-items: center;
                    "
                  >
                    <button class="buy bg-primary">Buy Now</button>
                    <button class="addtocart bg-warning">Add To Cart</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="row">
              <div class="col-md-6">
                <a href="#" class="w-100"
                  ><img
                    src="/img/ipad air 5.png"
                    class="img-fluid product my-5"
                    alt="Ipad Air 5"
                /></a>
              </div>
              <div class="col-md-6 p-4 mt-5">
                <h3>Ipad Air 5</h3>
                <p
                  class="font-heading text-action-1 mt-3"
                  style="color: #007bff"
                >
                  $1200
                </p>
                <p>
                  Disarticulation through wrist, secondary closure or scar
                  revision
                </p>
                <div class="row">
                  <div
                    class="buttons"
                    style="
                      display: flex;
                      justify-content: space-between;
                      align-items: center;
                    "
                  >
                    <button class="buy bg-primary">Buy Now</button>
                    <button class="addtocart bg-warning">Add To Cart</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="cartTab">
        <h1>Shopping Cart</h1>
        <div class="listCart">
          <div class="item">
            <div class="image">
              <img src="img/galaxy z fold 4.jpg" alt="" />
            </div>
            <div class="name">Samsung A05</div>
            <div class="totalPrice">200$</div>
            <div class="quantity">
              <span class="minus">-</span>
              <span>1</span>
              <span class="plus">+</span>
            </div>
            <div class="remove">
              <svg
                class="w-6 h-6 text-gray-800 dark:text-white"
                aria-hidden="true"
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                fill="none"
                viewBox="0 0 24 24"
              >
                <path
                  stroke="currentColor"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M6 18 17.94 6M18 18 6.06 6"
                />
              </svg>
            </div>
          </div>
          <div class="item">
            <div class="image">
              <img src="img/airport.jpg" alt="" />
            </div>
            <div class="name">Samsung A05</div>
            <div class="totalPrice">200$</div>
            <div class="quantity">
              <span class="minus">-</span>
              <span>1</span>
              <span class="plus">+</span>
            </div>
            <div class="remove">
              <svg
                class="w-6 h-6 text-gray-800 dark:text-white"
                aria-hidden="true"
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                fill="none"
                viewBox="0 0 24 24"
              >
                <path
                  stroke="currentColor"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M6 18 17.94 6M18 18 6.06 6"
                />
              </svg>
            </div>
          </div>
          <div class="item">
            <div class="image">
              <img src="img/airportpro.jpg" alt="" />
            </div>
            <div class="name">Samsung A05</div>
            <div class="totalPrice">200$</div>
            <div class="quantity">
              <span class="minus">-</span>
              <span>1</span>
              <span class="plus">+</span>
            </div>
            <div class="remove">
              <svg
                class="w-6 h-6 text-gray-800 dark:text-white"
                aria-hidden="true"
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                fill="none"
                viewBox="0 0 24 24"
              >
                <path
                  stroke="currentColor"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M6 18 17.94 6M18 18 6.06 6"
                />
              </svg>
            </div>
          </div>
          <div class="item">
            <div class="image">
              <img src="img/galaxy buds.jpg" alt="" />
            </div>
            <div class="name">Samsung A05</div>
            <div class="totalPrice">200$</div>
            <div class="quantity">
              <span class="minus">-</span>
              <span>1</span>
              <span class="plus">+</span>
            </div>
            <div class="remove">
              <svg
                class="w-6 h-6 text-gray-800 dark:text-white"
                aria-hidden="true"
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                fill="none"
                viewBox="0 0 24 24"
              >
                <path
                  stroke="currentColor"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M6 18 17.94 6M18 18 6.06 6"
                />
              </svg>
            </div>
          </div>
          <div class="item">
            <div class="image">
              <img src="img/iMac.jpg" alt="" />
            </div>
            <div class="name">Samsung A05</div>
            <div class="totalPrice">200$</div>
            <div class="quantity">
              <span class="minus">-</span>
              <span>1</span>
              <span class="plus">+</span>
            </div>
            <div class="remove">
              <svg
                class="w-6 h-6 text-gray-800 dark:text-white"
                aria-hidden="true"
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                fill="none"
                viewBox="0 0 24 24"
              >
                <path
                  stroke="currentColor"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M6 18 17.94 6M18 18 6.06 6"
                />
              </svg>
            </div>
          </div>
          <div class="item">
            <div class="image">
              <img src="img/A05.png" alt="" />
            </div>
            <div class="name">Samsung A05</div>
            <div class="totalPrice">200$</div>
            <div class="quantity">
              <span class="minus">-</span>
              <span>1</span>
              <span class="plus">+</span>
            </div>
            <div class="remove">
              <svg
                class="w-6 h-6 text-gray-800 dark:text-white"
                aria-hidden="true"
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                fill="none"
                viewBox="0 0 24 24"
              >
                <path
                  stroke="currentColor"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M6 18 17.94 6M18 18 6.06 6"
                />
              </svg>
            </div>
          </div>
          <div class="item">
            <div class="image">
              <img src="img/A05.png" alt="" />
            </div>
            <div class="name">Samsung A05</div>
            <div class="totalPrice">200$</div>
            <div class="quantity">
              <span class="minus">-</span>
              <span>1</span>
              <span class="plus">+</span>
            </div>
            <div class="remove">
              <svg
                class="w-6 h-6 text-gray-800 dark:text-white"
                aria-hidden="true"
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                fill="none"
                viewBox="0 0 24 24"
              >
                <path
                  stroke="currentColor"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M6 18 17.94 6M18 18 6.06 6"
                />
              </svg>
            </div>
          </div>
          <div class="item">
            <div class="image">
              <img src="img/A05.png" alt="" />
            </div>
            <div class="name">Samsung A05</div>
            <div class="totalPrice">200$</div>
            <div class="quantity">
              <span class="minus">-</span>
              <span>1</span>
              <span class="plus">+</span>
            </div>
            <div class="remove">
              <svg
                class="w-6 h-6 text-gray-800 dark:text-white"
                aria-hidden="true"
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                fill="none"
                viewBox="0 0 24 24"
              >
                <path
                  stroke="currentColor"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M6 18 17.94 6M18 18 6.06 6"
                />
              </svg>
            </div>
          </div>
          <div class="item">
            <div class="image">
              <img src="img/A05.png" alt="" />
            </div>
            <div class="name">Samsung A05</div>
            <div class="totalPrice">200$</div>
            <div class="quantity">
              <span class="minus">-</span>
              <span>1</span>
              <span class="plus">+</span>
            </div>
            <div class="remove">
              <svg
                class="w-6 h-6 text-gray-800 dark:text-white"
                aria-hidden="true"
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                fill="none"
                viewBox="0 0 24 24"
              >
                <path
                  stroke="currentColor"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M6 18 17.94 6M18 18 6.06 6"
                />
              </svg>
            </div>
          </div>
          <div class="item">
            <div class="image">
              <img src="img/A05.png" alt="" />
            </div>
            <div class="name">Samsung A05</div>
            <div class="totalPrice">200$</div>
            <div class="quantity">
              <span class="minus">-</span>
              <span>1</span>
              <span class="plus">+</span>
            </div>
            <div class="remove">
              <svg
                class="w-6 h-6 text-gray-800 dark:text-white"
                aria-hidden="true"
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                fill="none"
                viewBox="0 0 24 24"
              >
                <path
                  stroke="currentColor"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M6 18 17.94 6M18 18 6.06 6"
                />
              </svg>
            </div>
          </div>
          <div class="item">
            <div class="image">
              <img src="img/A05.png" alt="" />
            </div>
            <div class="name">Samsung A05</div>
            <div class="totalPrice">200$</div>
            <div class="quantity">
              <span class="minus">-</span>
              <span>1</span>
              <span class="plus">+</span>
            </div>
            <div class="remove">
              <svg
                class="w-6 h-6 text-gray-800 dark:text-white"
                aria-hidden="true"
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                fill="none"
                viewBox="0 0 24 24"
              >
                <path
                  stroke="currentColor"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M6 18 17.94 6M18 18 6.06 6"
                />
              </svg>
            </div>
          </div>
        </div>
        <div class="btn">
          <button class="close">CLOSE</button>
          <button class="checkout">CHECK OUT</button>
        </div>
      </div>
    </div>
    <!-- Advertisement -->
    <div class="container">
      <h1 class="text-center" id="Advertisement">Advertisement</h1>
      <div class="grid-wrapper">
        <div class="tall">
          <img
            src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPJnlCWVDNbIdugReKYHgvAxIrknt1fGi7nQ&s"
            alt=""
          />
        </div>
        <div class="big">
          <img
            src="https://cdn.tgdd.vn/Files/2023/03/29/1522048/1-290323-145232.jpg"
            alt=""
          />
        </div>
        <div class="tall">
          <img
            src="https://news.khangz.com/wp-content/uploads/2022/09/ngay-ra-mat-oppo-reno8-pro-1.png"
            alt=""
          />
        </div>
        <div class="big">
          <img
            src="https://bloganchoi.com/wp-content/uploads/2023/05/motorola-razr-z-flip4.jpg"
            alt=""
          />
        </div>
        <div class="tall">
          <img
            src="https://cdn.xtmobile.vn/vnt_upload/news/07_2023/05/Tong-hop-bo-hinh-nen-4k-cho-iphone-15-va-iphone-15-pro-max-xtmobile.jpg"
            alt=""
          />
        </div>
        <div class="wide">
          <img
            src="https://dienthoaihay.vn/upload_images/images/2024/06/19/8357071_8eb72837cea785ce183cd364.jpg"
            alt=""
          />
        </div>
        <div class="wide">
          <img
            src="https://images.kienthuc.net.vn/w730/Uploaded/2024/zagtrt/2024_08_05/167999c61171b42fed60-7492.jpg"
            alt=""
          />
        </div>
        <div class="tall">
          <img
            src="https://cdn.tgdd.vn/Files/2022/11/05/1484486/cach-tai-hinh-nen-qua-tao-cho-iphone-0.png"
            alt=""
          />
        </div>
      </div>
    </div>
    <!-- Reviews -->
    <div class="container">
      <h1 class="text-center" id="Review">Thank You</h1>
      <div class="row">
        <div class="col-md-6 mt-5">
          <img
            src="/img/airport.jpg"
            class="img-fluid"
            style="border-radius: 30px"
            alt="AirPods Pro"
          />
        </div>
        <div
          class="col-md-6"
          style="
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
          "
        >
          <h1 class="ml-5">We hope you excited when view our store</h1>
          <p class="review_desc">
            Meet your new sidekick. The powerful tool that helps you create
            something special.
          </p>
          <div class="review_btn">
            <a href="#" class="btn btn-primary">Get Started</a>
            <a href="#" class="btn btn-secondary mx-4">Learn More</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Landing -->
    <div class="container">
      <div class="col-md-12" id="Member">
        <h1 class="text-center">Better landing for your startup</h1>
        <p class="text-center">
          Start growing in half the time with an all-in-one website builder - no
          more long hours spent on the boring stuff!
        </p>
        <div class="row">
          <div class="col-md-4">
            <div
              class="d-flex flex-column justify-content-between border rounded-2 h-100"
              style="padding: 10px; border-radius: 20px"
            >
              <h4>
                "Wow what great service I love it! It is the most valuable
                business resource we have EVER purchased."
              </h4>
              <p>Dang Hoang Duy</p>
              <p>Admin</p>
            </div>
          </div>
          <div class="col-md-4">
            <div
              class="d-flex flex-column justify-content-between border rounded-2 h-100"
              style="padding: 10px; border-radius: 20px"
            >
              <h4>
                "Thank you for making it painless, pleasant and most of all
                hassle free! I'd be lost without it."
              </h4>
              <p>Nguyen Cong Dat</p>
              <p>User</p>
            </div>
          </div>
          <div class="col-md-4">
            <div
              class="d-flex flex-column justify-content-between border rounded-2 h-100"
              style="padding: 10px; border-radius: 20px"
            >
              <h4>
                "It's all good. Man, this thing is getting better and better as
                I learn more about it. I'd be lost without It's. Thanks it!"
              </h4>

              <p>Duong Hieu</p>
              <p>User</p>
            </div>
          </div>
        </div>
        <div class="row mt-3">
          <div class="col-md-4">
            <div
              class="d-flex flex-column justify-content-between border rounded-2 h-100"
              style="padding: 10px; border-radius: 20px"
            >
              <h4>
                "It's is the coolest, most happening thing around! Not able to
                tell you how happy I am with it."
              </h4>
              <p>Thai Nhat Quy</p>
              <p>Leader</p>
            </div>
          </div>
          <div class="col-md-4">
            <div
              class="d-flex flex-column justify-content-between border rounded-2 h-100"
              style="padding: 10px; border-radius: 20px"
            >
              <h4>
                "Your company is truly upstanding and is behind its product
                100%. It's the perfect solution for our business."
              </h4>
              <p>Nguyen Van Dat</p>
              <p>Admin</p>
            </div>
          </div>
          <div class="col-md-4">
            <div
              class="d-flex flex-column justify-content-between border rounded-2 h-100"
              style="padding: 10px; border-radius: 20px"
            >
              <h4 class="fs-4">
                "You won't regret it. I was amazed at the quality of it. I am
                really satisfied with my it."
              </h4>
              <p>Dao Van Bao Huy</p>
              <p>Admin</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Footer -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light mt-5">
      <div class="container-fluid">
        <img class="logo" src="/img/FMobileLogo.png" alt="" />
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNav"
          aria-controls="navbarNav"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="row g-5 mt-1">
          <div class="col-md-6">
            <h2 class="mb-4">
              Be the first to explore and use our new products while others are
              still waiting
            </h2>
            <a href="#" class="btn btn-primary">Get Started</a>
          </div>
          <div class="col-md-6">
            <div class="row">
              <div class="col-sm-3">
                <h5>Products</h5>
                <ul class="list-unstyled">
                  <li>Iphone</li>
                  <li>Samsung</li>
                </ul>
              </div>
              <div class="col-sm-3">
                <h5>Category</h5>
                <ul class="list-unstyled">
                  <li>Alcatel 6850</li>
                  <li>Ruckus ZD 1200</li>
                  <li>Alcatel 6850</li>
                  <li>Ruckus ZD 1200</li>
                </ul>
              </div>
              <div class="col-sm-3">
                <h5>About</h5>
                <ul class="list-unstyled">
                  <li>Newsletter</li>
                  <li>Privacy</li>
                  <li>Terms</li>
                  <li>Cookies</li>
                </ul>
              </div>
              <div class="col-sm-3">
                <h5>Contact</h5>
                <ul class="list-unstyled">
                  <li>0763254524</li>
                  <li>fmobile@gmail.com</li>
                  <li>fmobile@edu.vn</li>
                </ul>
              </div>
            </div>
          </div>
          <footer class="pt-3 mt-4 text-center">
            Copyright © 2024 group 1 F Mobile
          </footer>
        </div>
      </div>
    </nav>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
      // chuyen dong anh
      // const carousel = document.querySelector("#bannerCarousel");
      // const inner = carousel.querySelector(".carousel-inner");
      // const items = carousel.querySelectorAll(".carousel-item");
      // const prevBtn = carousel.querySelector(".carousel-control-prev");
      // const nextBtn = carousel.querySelector(".carousel-control-next");

      // let currentIndex = 0;

      // function showSlide(index) {
      //   if (index < 0) index = items.length - 1;
      //   if (index >= items.length) index = 0;
      //   inner.style.transform = `translateX(-${index * 100}%)`;
      //   currentIndex = index;
      // }

      // function nextSlide() {
      //   showSlide(currentIndex + 1);
      // }

      // function prevSlide() {
      //   showSlide(currentIndex - 1);
      // }

      // prevBtn.addEventListener("click", prevSlide);
      // nextBtn.addEventListener("click", nextSlide);

      // Tự động chuyển ảnh mỗi 3 giây
      //setInterval(nextSlide, 3000);
      //
      const darkModeToggle = document.getElementById("darkModeToggle");
      darkModeToggle.addEventListener("change", function () {
        document.body.classList.toggle("dark-mode", darkModeToggle.checked);
      });

      // Lấy tất cả các nút "Add To Cart"
      const addToCartButtons = document.querySelectorAll(".addtocart");

      // Lấy phần tử hiển thị số lượng trong giỏ hàng
      const cartCountElement = document.querySelector(".icon-cart span");

      // Khởi tạo biến đếm số lượng sản phẩm trong giỏ hàng
      let cartCount = 0;

      // Hàm cập nhật hiển thị số lượng giỏ hàng
      function updateCartDisplay() {
        if (cartCount > 0) {
          cartCountElement.textContent = cartCount;
          cartCountElement.classList.add("visible");
        } else {
          cartCountElement.classList.remove("visible");
        }
      }

      // Thêm sự kiện click cho mỗi nút "Add To Cart"
      addToCartButtons.forEach((button) => {
        button.addEventListener("click", () => {
          // Tăng số lượng sản phẩm trong giỏ hàng
          cartCount++;

          // Cập nhật hiển thị
          updateCartDisplay();

          // Thêm hiệu ứng animation
          cartCountElement.classList.add("animate");
          setTimeout(() => {
            cartCountElement.classList.remove("animate");
          }, 300);
        });
      });

      // Khởi tạo hiển thị ban đầu
      updateCartDisplay();

      let iconCart = document.querySelector(".icon-cart");
      let body = document.querySelector("body");
      let listProductHTML = document.querySelector(".listProduct");
      let listCartHTML = document.querySelector(".listCart");
      let iconCartSpan = document.querySelector(".icon-cart span");
      let closeCart = document.querySelector(".close");
      let products = [];
      let cart = [];

      iconCart.addEventListener("click", () => {
        body.classList.toggle("showCart");
      });
      closeCart.addEventListener("click", () => {
        body.classList.toggle("showCart");
      });

      const addDataToHTML = () => {
        // remove datas default from HTML

        // add new datas
        if (products.length > 0) {
          // if has data
          products.forEach((product) => {
            let newProduct = document.createElement("div");
            newProduct.dataset.id = product.id;
            newProduct.classList.add("item");
            newProduct.innerHTML = `<img src="${product.image}" alt="">
                <h2>${product.name}</h2>
                <div class="price">$${product.price}</div>
                <button class="addCart">Add To Cart</button>`;
            listProductHTML.appendChild(newProduct);
          });
        }
      };
      listProductHTML.addEventListener("click", (event) => {
        let positionClick = event.target;
        if (positionClick.classList.contains("addCart")) {
          let id_product = positionClick.parentElement.dataset.id;
          addToCart(id_product);
        }
      });
      const addToCart = (product_id) => {
        let positionThisProductInCart = cart.findIndex(
          (value) => value.product_id == product_id
        );
        if (cart.length <= 0) {
          cart = [
            {
              product_id: product_id,
              quantity: 1,
            },
          ];
        } else if (positionThisProductInCart < 0) {
          cart.push({
            product_id: product_id,
            quantity: 1,
          });
        } else {
          cart[positionThisProductInCart].quantity =
            cart[positionThisProductInCart].quantity + 1;
        }
        addCartToHTML();
        addCartToMemory();
      };
      const addCartToMemory = () => {
        localStorage.setItem("cart", JSON.stringify(cart));
      };
      const addCartToHTML = () => {
        listCartHTML.innerHTML = "";
        let totalQuantity = 0;
        if (cart.length > 0) {
          cart.forEach((item) => {
            totalQuantity = totalQuantity + item.quantity;
            let newItem = document.createElement("div");
            newItem.classList.add("item");
            newItem.dataset.id = item.product_id;

            let positionProduct = products.findIndex(
              (value) => value.id == item.product_id
            );
            let info = products[positionProduct];
            listCartHTML.appendChild(newItem);
            newItem.innerHTML = `
            <div class="image">
                    <img src="${info.image}">
                </div>
                <div class="name">
                ${info.name}
                </div>
                <div class="totalPrice">$${info.price * item.quantity}</div>
                <div class="quantity">
                    <span class="minus"><</span>
                    <span>${item.quantity}</span>
                    <span class="plus">></span>
                </div>
            `;
          });
        }
        iconCartSpan.innerText = totalQuantity;
      };

      listCartHTML.addEventListener("click", (event) => {
        let positionClick = event.target;
        if (
          positionClick.classList.contains("minus") ||
          positionClick.classList.contains("plus")
        ) {
          let product_id = positionClick.parentElement.parentElement.dataset.id;
          let type = "minus";
          if (positionClick.classList.contains("plus")) {
            type = "plus";
          }
          changeQuantityCart(product_id, type);
        }
      });
      const changeQuantityCart = (product_id, type) => {
        let positionItemInCart = cart.findIndex(
          (value) => value.product_id == product_id
        );
        if (positionItemInCart >= 0) {
          let info = cart[positionItemInCart];
          switch (type) {
            case "plus":
              cart[positionItemInCart].quantity =
                cart[positionItemInCart].quantity + 1;
              break;

            default:
              let changeQuantity = cart[positionItemInCart].quantity - 1;
              if (changeQuantity > 0) {
                cart[positionItemInCart].quantity = changeQuantity;
              } else {
                cart.splice(positionItemInCart, 1);
              }
              break;
          }
        }
        addCartToHTML();
        addCartToMemory();
      };

      const initApp = () => {
        // get data product
        fetch("products.json")
          .then((response) => response.json())
          .then((data) => {
            products = data;
            addDataToHTML();

            // get data cart from memory
            if (localStorage.getItem("cart")) {
              cart = JSON.parse(localStorage.getItem("cart"));
              addCartToHTML();
            }
          });
      };
      initApp();
    </script>
  </body>
</html>
=======
<jsp:include page="header.jsp"/>
<h1>Hieu dep trai</h1>
<jsp:include page="footer.jsp"/>
>>>>>>> d358adf7717c9801ffd85c751589b68374d3a4a0
