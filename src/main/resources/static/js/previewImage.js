/*  ==========================================
    SHOW UPLOADED IMAGE
* ========================================== */


function readURL(input) {
    if (input!=null) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#imageResult')
                .attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

$(function () {
    $('#file').on('change', function () {
        readURL(input);
    });
});