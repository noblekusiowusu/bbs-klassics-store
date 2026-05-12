function searchProduct(value) {

    let products = document.querySelectorAll(".product");

    value = value.toLowerCase().trim();

    products.forEach(function(product) {

        let productName = product.querySelector("h3").innerText.toLowerCase();

        let productCategory = product.innerText.toLowerCase();

        if (
            productName.includes(value) ||
            productCategory.includes(value)
        ) {
            product.style.display = "block";
        } else {
            product.style.display = "none";
        }

    });
}

window.onload = function () {

    let cards = document.querySelectorAll(".product, .category-card");

    cards.forEach(function(card, index) {

        card.style.opacity = "0";
        card.style.transform = "translateY(30px)";

        setTimeout(function () {
            card.style.transition = "0.6s ease";
            card.style.opacity = "1";
            card.style.transform = "translateY(0)";
        }, index * 150);

    });

};