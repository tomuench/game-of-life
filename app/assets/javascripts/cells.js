
/**
 * Statuswechsel einer Zelle
 */
function toggleCell(target) {
    var t = $(target);
    var id = t.data('id');
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