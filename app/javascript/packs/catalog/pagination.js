$(document).ready(() => {
    $(document).on('click', '.view-more', function (event) {
        event.preventDefault();

        let url = window.location.href;
        let currentBooksList = $('.books-list');
        let currentBooksCount = $('#books-count').val();

        $.ajax({
            url: url,
            type: 'GET',
            data: {
                'current_books_count': currentBooksCount
            },
            success: function (data) {
                let newBooksList = $(data).find('.books-list');
                $(currentBooksList).replaceWith(newBooksList);
            }
        });
    });
});
