//
// function updateProducts() {
//     let brands = $('.brand-checkbox:checked').map(function() { return this.value; }).get().join(',');
//     let rams = $('.ram-checkbox:checked').map(function() { return this.value; }).get().join(',');
//     let minPrice = $('.price-checkbox:checked').map(function() { return $(this).data('min'); }).get().join(',');
//     let maxPrice = $('.price-checkbox:checked').map(function() { return $(this).data('max'); }).get().join(',');
//
//     $('#productResults').html('<p>Đang tải...</p>');
//
//     $.ajax({
//         url: '/guest/filter',
//         method: 'GET',
//         data: {
//             brands: brands,
//             rams: rams,
//             minPrice: minPrice,
//             maxPrice: maxPrice
//         },
//         success: function(response) {
//             $('#productResults').html(response);
//
//             let productCount = $(response).find('.item').length;
//             console.log('Product count:', productCount);
//
//             let titleText = 'Kết quả tìm kiếm: ' + productCount + ' sản phẩm';
//             document.title = titleText;
//             $('.title').text(titleText);
//
//         },
//         error: function(xhr, status, error) {
//             console.error("AJAX Error:", status, error);
//             console.error("Response Text:", xhr.responseText);
//             $('#productResults').html('<p>Có lỗi xảy ra khi tải sản phẩm. Vui lòng thử lại.</p>');
//         }
//     });
// }
//
// $(document).ready(function() {
//     $('.brand-checkbox, .ram-checkbox, .price-checkbox').on('change', updateProducts);
//     updateProducts(); // Tải ban đầu
// });



// let isFiltering = false;
//
// function updateProducts() {
//     let brands = $('.brand-checkbox:checked').map(function() { return this.value; }).get().join(',');
//     let rams = $('.ram-checkbox:checked').map(function() { return this.value; }).get().join(',');
//     let minPrice = $('.price-checkbox:checked').map(function() { return $(this).data('min'); }).get().join(',');
//     let maxPrice = $('.price-checkbox:checked').map(function() { return $(this).data('max'); }).get().join(',');
//
//     // Check if any filter is applied
//     isFiltering = brands || rams || minPrice || maxPrice;
//
//     if (isFiltering) {
//         $('#productResults').html('<p>Đang tải...</p>');
//         $('#productResults2').hide();
//
//         $.ajax({
//             url: '/guest/filter',
//             method: 'GET',
//             data: {
//                 brands: brands,
//                 rams: rams,
//                 minPrice: minPrice,
//                 maxPrice: maxPrice
//             },
//             success: function(response) {
//                 $('#productResults').html(response);
//
//                 let productCount = $(response).find('.item').length;
//                 console.log('Product count:', productCount);
//
//                 let titleText = 'Kết quả lọc: ' + productCount + ' sản phẩm';
//                 document.title = titleText;
//                 $('.title h2').text(titleText);
//             },
//             error: function(xhr, status, error) {
//                 console.error("AJAX Error:", status, error);
//                 console.error("Response Text:", xhr.responseText);
//                 $('#productResults').html('<p>Có lỗi xảy ra khi tải sản phẩm. Vui lòng thử lại.</p>');
//             }
//         });
//     } else {
//         // If no filter is applied, show the original search results
//         $('#productResults').empty();
//         $('#productResults2').show();
//         let productCount = $('#productResults2 .item').length;
//         let titleText = productCount + ' Products Found';
//         document.title = titleText;
//         $('.title h2').text(titleText);
//     }
// }
//
// $(document).ready(function() {
//     $('.brand-checkbox, .ram-checkbox, .price-checkbox').on('change', updateProducts);
//     // Don't call updateProducts() on page load to keep initial search results
// });
//
// document.addEventListener('DOMContentLoaded', function() {
//     var searchIcon = document.getElementById('searchIcon');
//     var searchForm = document.getElementById('searchForm');
//
//     searchIcon.addEventListener('click', function() {
//         searchForm.submit();
//     });
//
//     // Add handling for Enter key
//     searchForm.querySelector('input[name="query"]').addEventListener('keypress', function(e) {
//         if (e.key === 'Enter') {
//             e.preventDefault();
//             searchForm.submit();
//         }
//     });
// });

let isFiltering = false;

function updateProducts() {
    let brands = $('.brand-checkbox:checked').map(function() { return this.value; }).get().join(',');
    let rams = $('.ram-checkbox:checked').map(function() { return this.value; }).get().join(',');
    let minPrice = $('.price-checkbox:checked').map(function() { return $(this).data('min'); }).get().join(',');
    let maxPrice = $('.price-checkbox:checked').map(function() { return $(this).data('max'); }).get().join(',');

    // Nếu không có bộ lọc nào được chọn, gán giá trị null cho biến bộ lọc
    brands = brands ? brands : null;
    rams = rams ? rams : null;
    minPrice = minPrice ? minPrice : null;
    maxPrice = maxPrice ? maxPrice : null;

    // Kiểm tra nếu có bất kỳ bộ lọc nào đang được áp dụng
    isFiltering = brands || rams || minPrice || maxPrice;

    if (isFiltering) {
        $('#productResults').html('<p>Đang tải...</p>');
        $('#productResults2').hide();

        $.ajax({
            url: '/guest/filter',
            method: 'GET',
            data: {
                brands: brands,
                rams: rams,
                minPrice: minPrice,
                maxPrice: maxPrice
            },
            success: function(response) {
                $('#productResults').html(response);

                let productCount = $(response).find('.item').length;
                console.log('Product count:', productCount);

                let titleText = 'Kết quả lọc: ' + productCount + ' sản phẩm';
                document.title = titleText;
                $('.title h2').text(titleText);
            },
            error: function(xhr, status, error) {
                console.error("AJAX Error:", status, error);
                console.error("Response Text:", xhr.responseText);
                $('#productResults').html('<p>Có lỗi xảy ra khi tải sản phẩm. Vui lòng thử lại.</p>');
            }
        });
    }
    // else {
    //     // Nếu không có bộ lọc nào, hiển thị lại kết quả tìm kiếm ban đầu
    //     $('#productResults').empty();
    //     $('#productResults2').show();
    //     let productCount = $('#productResults2 .item').length;
    //     let titleText = productCount + ' Products Found';
    //     document.title = titleText;
    //     $('.title h2').text(titleText);
    // }
}

$(document).ready(function() {
    $('.brand-checkbox, .ram-checkbox, .price-checkbox').on('change', updateProducts);
    // Không gọi updateProducts() khi tải trang để giữ kết quả tìm kiếm ban đầu
});

document.addEventListener('DOMContentLoaded', function() {
    var searchIcon = document.getElementById('searchIcon');
    var searchForm = document.getElementById('searchForm');

    searchIcon.addEventListener('click', function() {
        searchForm.submit();
    });

    // Thêm xử lý cho phím Enter
    searchForm.querySelector('input[name="query"]').addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            e.preventDefault();
            searchForm.submit();
        }
    });
});


