let listProductHTML = document.querySelector('.listProduct');
let newMobileHTML = document.querySelector('.newMobile');
let tabletHTML = document.querySelector('.tablet');
let listCartHTML = document.querySelector('.listCart');
let iconCart = document.querySelector('.icon-cart');
let iconCartSpan = document.querySelector('.icon-cart span');
let body = document.querySelector('body');
let closeCart = document.querySelector('.close');
let products = [];
let newMobile = [];
let tablet = [];
let cart = [];
iconCart.addEventListener('click', () => {
    body.classList.toggle('showCart');
})
closeCart.addEventListener('click', () => {
    body.classList.toggle('showCart');
})

const findProductById = (id) => {
    return products.find(p => p.id == id) ||
        newMobile.find(p => p.id == id) ||
        tablet.find(p => p.id == id);
}

const addToCart = (product_id) => {
    let positionThisProductInCart = cart.findIndex((value) => value.product_id == product_id);
    if (cart.length <= 0) {
        cart = [{
            product_id: product_id,
            quantity: 1
        }];
        showNotification("Sản phẩm đã được thêm vào giỏ hàng", '#d4edda', '#155724');
    } else if (positionThisProductInCart < 0) {
        cart.push({
            product_id: product_id,
            quantity: 1
        });
        showNotification("Sản phẩm đã được thêm vào giỏ hàng", '#d4edda', '#155724');
    } else {
        showNotification("Đã tồn tại sản phẩm trong giỏ hàng", '#fff3cd', '#856404');
        return;
    }
    addCartToHTML();
    addCartToMemory();
};

const showNotification = (message, color = '#f8d7da', textColor = '#721c24') => {
    console.log("showNotification called with message:", message);

    // Tạo phần tử thông báo
    const notification = document.createElement('div');
    notification.textContent = message;
    notification.style.cssText = `
        position: fixed;
        top: 7%;
        left: 0%;
        background-color: ${color};
        color: ${textColor};
        padding: 15px;
        border-radius: 5px;
        z-index: 1000;
        box-shadow: 0 2px 10px rgba(0,0,0,0.2);
        font-size: 16px;
        transition: opacity 0.5s ease-in-out;
        opacity: 0;
    `;

    // Thêm thông báo vào body
    document.body.appendChild(notification);

    // Hiển thị thông báo
    setTimeout(() => {
        notification.style.opacity = '1';
    }, 10);

    // Xóa thông báo sau 3 giây
    setTimeout(() => {
        notification.style.opacity = '0';
        setTimeout(() => {
            document.body.removeChild(notification);
        }, 500);
    }, 3000);
};


const addCartToMemory = () => {
    localStorage.setItem('cart', JSON.stringify(cart));
}

const removeFromCart = (product_id) => {
    let positionItemInCart = cart.findIndex((value) => value.product_id == product_id);
    if (positionItemInCart >= 0) {
        cart.splice(positionItemInCart, 1);
    }
    addCartToHTML();
    addCartToMemory();
}

const addCartToHTML = () => {
    listCartHTML.innerHTML = '';
    let totalQuantity = 0;
    let totalAmount = 0;
    if (cart.length > 0) {
        cart.forEach(item => {
            totalQuantity += item.quantity;
            let newItem = document.createElement('div');
            newItem.classList.add('item');
            newItem.dataset.id = item.product_id;

            let info = findProductById(item.product_id);
            if (info) {
                let itemTotal = info.price * item.quantity;
                totalAmount += itemTotal;
                newItem.innerHTML = `
                    <div class="image">
                        <img src="${info.image}">
                    </div>
                    <div class="name">
                        ${info.name}
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
            }
        });
    }
    iconCartSpan.innerText = totalQuantity;

    // Add animation effect
    iconCartSpan.classList.add('animate');
    setTimeout(() => {
        iconCartSpan.classList.remove('animate');
    }, 300);

    // Show or hide quantity
    if (totalQuantity > 0) {
        iconCartSpan.classList.add('visible');
    } else {
        iconCartSpan.classList.remove('visible');
    }

    // Update total amount
    document.querySelector('.totalAmount').innerText = `$${totalAmount.toFixed(2)}`;
}

const changeQuantityCart = (product_id, type) => {
    let positionItemInCart = cart.findIndex((value) => value.product_id == product_id);
    if (positionItemInCart >= 0) {
        switch (type) {
            case 'plus':
                cart[positionItemInCart].quantity += 1;
                break;
            case 'minus':
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
}

listCartHTML.addEventListener('click', (event) => {
    let positionClick = event.target;
    if (positionClick.classList.contains('minus') || positionClick.classList.contains('plus')) {
        let product_id = positionClick.closest('.item').dataset.id;
        let type = positionClick.classList.contains('plus') ? 'plus' : 'minus';
        changeQuantityCart(product_id, type);
    } else if (positionClick.closest('.remove')) {
        let product_id = positionClick.closest('.item').dataset.id;
        removeFromCart(product_id);
    }
});

const initApp = () => {
    products = ${bestSellingMobileProducts};
    newMobile = ${newestMobileProducts};
    tablet = ${tabletProducts};

    if (localStorage.getItem('cart')) {
        cart = JSON.parse(localStorage.getItem('cart'));
        addCartToHTML();
    }
}
