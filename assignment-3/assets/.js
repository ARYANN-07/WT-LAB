$(document).ready(function () {
    $('#units').on('input', function () {
        const value = $(this).val();
        if (value && Number(value) < 0) {
            $(this).addClass('is-invalid');
        } else {
            $(this).removeClass('is-invalid');
        }
    });
});
