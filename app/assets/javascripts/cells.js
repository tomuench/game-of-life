
function toggleCell(target, id) {
    var t = $(target);

    $.ajax({
        url: "/cells/" + id + "/toggle",
        method: 'PUT',
        success: function () {
            if (t.hasClass('alive'))
                t.removeClass('alive');
            else
                t.addClass('alive');
        }
    });
}