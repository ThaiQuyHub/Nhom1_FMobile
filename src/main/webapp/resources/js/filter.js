function updateProducts() {
    let brands = $('.brand-checkbox:checked').map(function() { return this.value; }).get().join(',');
    let rams = $('.ram-checkbox:checked').map(function() { return this.value; }).get().join(',');
    let minPrice = $('.price-checkbox:checked').map(function() { return $(this).data('min'); }).get().join(',');
    let maxPrice = $('.price-checkbox:checked').map(function() { return $(this).data('max'); }).get().join(',');

    $('#productResults').html('<p>Đang tải...</p>');

    $.ajax({
        url: '/filter',
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

            let titleText = 'Kết quả tìm kiếm: ' + productCount + ' sản phẩm';
            document.title = titleText;
            $('.title').text(titleText);

        },
        error: function(xhr, status, error) {
            console.error("AJAX Error:", status, error);
            console.error("Response Text:", xhr.responseText);
            $('#productResults').html('<p>Có lỗi xảy ra khi tải sản phẩm. Vui lòng thử lại.</p>');
        }
    });
}

$(document).ready(function() {
    $('.brand-checkbox, .ram-checkbox, .price-checkbox').on('change', updateProducts);
    updateProducts(); // Tải ban đầu
});