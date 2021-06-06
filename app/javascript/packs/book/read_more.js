$(document).ready(() => {
    $(document).on('click', '.read-more', function (event) {
        event.preventDefault();

        toggleBookDescription($(this), $(this).next().attr('for'));
    });

    $(document).on('click', '.read-less', function (event) {
        event.preventDefault();

        toggleBookDescription($(this), $(this).prev().attr('for'));
    });

    function toggleBookDescription(element, oppositRole) {
        $(`.${oppositRole}-description`).toggle();
        $(element).toggle();
        $(`.${element.attr('for')}-description`).toggle();
        $(`.read-${oppositRole}`).toggle();
    }
});
