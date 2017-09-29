
/**
 * Aktiviertung der Javascript Funktion auf den Cellen
 */
function initCells()
{
    $('.cell').click(function(e){
       toggleCell(e.target);
   })
}
/**
 * Statuswechsel einer Zelle
 */
function toggleCell(target) {
    
    if(intervalGame != undefined)
        return;
        
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