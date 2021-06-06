$(document).ready(() => {
    let minQuantity = 1;

    $(document).on('click', '#plus', function (event) {
        event.preventDefault();

        quantity = +$('.quantity-input').val();
        $('.quantity-input').val(++quantity);
    });

    $(document).on('click', '#minus', function (event) {
        event.preventDefault();

        quantity = +$('.quantity-input').val();

        if (quantity > minQuantity) {
            $('.quantity-input').val(--quantity);
        }
    });
});
