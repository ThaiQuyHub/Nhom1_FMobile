let listCartHTML = document.querySelector('.listCart');
let iconCart = document.querySelector('.icon-cart');
let iconCartSpan = document.querySelector('.icon-cart span');
let body = document.querySelector('body');
let closeCart = document.querySelector('.close');
let cart = [];
let allProducts = [];

iconCart.addEventListener('click', () => {
    body.classList.toggle('showCart');
})
closeCart.addEventListener('click', () => {
    body.classList.toggle('showCart');
})

// Hàm khởi tạo ứng dụng
const initApp = () => {

    // Lấy dữ liệu sản phẩm từ DOM
    allProducts = getProductsFromDOM('.item');

    // Thêm sự kiện click cho các nút "Add To Cart"
    addEventToButtons();

    // Thêm sự kiện cho nút thanh toán
    const checkoutButton = document.querySelector('.checkOut');
    if (checkoutButton) {
        checkoutButton.addEventListener('click', () => {
            if (cart.length > 0) {
                prepareCartData();
                document.getElementById('cartForm').submit();
            } else {
                showNotification("Giỏ hàng của bạn đang trống!", "#FFA500");
            }
        });
    }

}

// Hàm chuẩn bị dữ liệu giỏ hàng để gửi đến controller
const prepareCartData = () => {
    const form = document.getElementById('cartForm');
    const hiddenInputsContainer = document.getElementById('hiddenInputs');
    hiddenInputsContainer.innerHTML = ''; // Xóa tất cả input ẩn hiện có

    cart.forEach((item) => {
        const info = findProductById(item.id);
        if (info) {
            hiddenInputsContainer.innerHTML += `
                <input type="hidden" name="productId[]" value="${item.id}">
                <input type="hidden" name="productQuantity[]" value="${item.quantity}">
            `;
        }
    });

    // Thêm tổng số tiền
    const totalAmount = cart.reduce((sum, item) => {
        const info = findProductById(item.id);
        return sum + (info ? info.price * item.quantity : 0);
    }, 0);
    hiddenInputsContainer.innerHTML += `
        <input type="hidden" name="totalAmount" value="${totalAmount.toFixed(2)}">
    `;
}

const getProductsFromDOM = (selector) => {
    const productElements = document.querySelectorAll(selector);
    return Array.from(productElements).map(element => ({
        id: element.getAttribute('data-id'),
        productName: element.querySelector('h2').textContent,
        price: parseFloat(element.querySelector('.price').textContent.replace('$', '')),
        image: element.querySelector('img').src
    }));
}

const addEventToButtons = () => {
    const addToCartButtons = document.querySelectorAll('.addCart');
    addToCartButtons.forEach(button => {
        button.addEventListener('click', () => {
            const productId = button.closest('.item').getAttribute('data-id');
            addToCart(productId);
        });
    });
}

// Hàm thêm sản phẩm vào giỏ hàng
const addToCart = (productId) => {
    let product = findProductById(productId);
    if (product) {
        let existingItem = cart.find(item => item.id == productId);
        if (existingItem) {
            showNotification("Sản phẩm đã tồn tại trong giỏ hàng", "#FFA500"); // Màu cam cho thông báo cảnh báo
        } else {
            cart.push({
                ...product,
                quantity: 1
            });
            updateCartHTML();
            saveCartToSession();
            showNotification("Sản phẩm đã được thêm vào giỏ hàng thành công", "#4CAF50"); // Màu xanh lá cho thông báo thành công
        }
    } else {
        console.error('Product not found:', productId);
        showNotification("Không tìm thấy sản phẩm", "#FF0000"); // Màu đỏ cho thông báo lỗi
    }
}

// Hàm cập nhật HTML của giỏ hàng
// Hàm cập nhật HTML của giỏ hàng
const updateCartHTML = () => {
    listCartHTML.innerHTML = '';
    let totalQuantity = 0;
    let totalAmount = 0;

    if (cart.length > 0) {
        cart.forEach(item => {
            totalQuantity += item.quantity;
            let newItem = document.createElement('div');
            newItem.classList.add('item');
            newItem.dataset.id = item.id;

            let info = findProductById(item.id);
            if (info) {
                let itemTotal = info.price * item.quantity;
                totalAmount += itemTotal;
                newItem.innerHTML = `
                    <div class="image">
                        <img src="${info.image}">
                    </div>
                    <div class="name">
                        ${info.productName}
                    </div>
                    <div class="totalPrice">$${itemTotal.toFixed(2)}</div>
                    <div class="quantity">
                        <span class="minus">-</span>
                        <span>${item.quantity}</span>
                        <span class="plus">+</span>
                    </div>
                    <div class="remove">
                        <svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                    width="20" height="20" fill="none" viewBox="0 0 24 24">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="M6 18 17.94 6M18 18 6.06 6" />
                    </svg>
                    </div>
                `;
                listCartHTML.appendChild(newItem);

                // Thêm sự kiện cho nút xóa
                newItem.querySelector('.remove').addEventListener('click', () => removeFromCart(item.id));

                // Thêm sự kiện cho nút giảm số lượng
                newItem.querySelector('.minus').addEventListener('click', () => {
                    if (item.quantity > 1) {
                        item.quantity -= 1;
                    } else {
                        removeFromCart(item.id);
                        showNotification("Sản phẩm đã được xóa khỏi giỏ hàng");
                    }
                    updateCartHTML();
                    saveCartToSession();
                });

                // Thêm sự kiện cho nút tăng số lượng
                newItem.querySelector('.plus').addEventListener('click', () => {
                    item.quantity += 1;
                    updateCartHTML();
                    saveCartToSession();
                });
            }
        });
    }
    updateCartDisplay(totalQuantity);
    // Update total amount
    document.querySelector('.totalAmount').innerText = `$${totalAmount.toFixed(2)}`;

    // Cập nhật input ẩn
    prepareCartData();
}

// Hàm cập nhật hiển thị số lượng giỏ hàng
const updateCartDisplay = (totalQuantity) => {
    iconCartSpan.innerText = totalQuantity;
    if (totalQuantity > 0) {
        iconCartSpan.classList.add('visible');
    } else {
        iconCartSpan.classList.remove('visible');
    }
    // Add animation effect
    iconCartSpan.classList.add('animate');
    setTimeout(() => {
        iconCartSpan.classList.remove('animate');
    }, 300);
}

// Hàm tìm sản phẩm theo ID
const findProductById = (id) => {
    return allProducts.find(product => product.id == id);
}

// Hàm xóa sản phẩm khỏi giỏ hàng
const removeFromCart = (productId) => {
    cart = cart.filter(item => item.id != productId);
    updateCartHTML();
    saveCartToSession();
}

// Hàm lưu giỏ hàng vào sessionStorage
const saveCartToSession = () => {
    sessionStorage.setItem('cart', JSON.stringify(cart));
}

// Hàm hiển thị thông báo
const showNotification = (message, backgroundColor = "#4CAF50") => {
    let notification = document.createElement('div');
    notification.textContent = message;
    notification.style.cssText = `
        position: fixed;
        top: 10%;
        left: 0px;
        background-color: ${backgroundColor};
        color: white;
        padding: 15px;
        border-radius: 4px;
        z-index: 1000;
        width:15%;
        heigh:10%;
    `;
    document.body.appendChild(notification);
    setTimeout(() => {
        document.body.removeChild(notification);
    }, 1500);
}

// Khởi chạy ứng dụng khi trang đã tải xong
document.addEventListener('DOMContentLoaded', initApp);