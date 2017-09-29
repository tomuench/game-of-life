

var intervalGame = undefined;

function toggleGame(start){
    var startButton = $('#start');
    var stopButton = $('#stop');
    var nextRoundButton = $("#nextRound");

    startButton.prop('disabled', start);
    stopButton.prop('disabled', !start);

    if(start)
        nextRoundButton.addClass('hidden');
    else
        nextRoundButton.removeClass('hidden');

    var gameRunning = function(){
        $("#nextRound").click();
    }

    if(start){
        intervalGame = setInterval(gameRunning, 1000);
    }
    else{
        clearInterval(intervalGame);
        intervalGame = undefined;
    }
}