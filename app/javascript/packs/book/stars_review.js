$(document).ready(() => {
    $(document).on('mouseover', '#stars > svg', function () {
        let ratingValue = +$(this).data('value');
        let stars = $(this).parent().children('svg');

        stars.each(function (index) {
            if (index < ratingValue) {
                $(this).removeClass('rate-empty');
            }
        });
    });

    $(document).on('mouseout', '#stars', function () {
        $(this).children('svg').each(function () {
            if (!$(this).hasClass('selected-star')) {
                $(this).addClass('rate-empty');
            }
        });
    });

    $(document).on('click', '#stars > .rate-star', function () {
        let ratingValue = +$(this).data('value');
        let stars = $(this).parent().children('svg');

        stars.each(function (index) {
            $(this).removeClass('selected-star')

            index < ratingValue ? $(this).addClass('selected-star') : $(this).addClass('rate-empty')
        });

        $('#review_rating').val(ratingValue);
    });
});
