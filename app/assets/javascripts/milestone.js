<<<<<<< HEAD
$(document).ready(function(){
    var msbars = $(".msbar");
    if(msbars.length==0)
        return;
    $.each(msbars, function(key, val){
        var barwidth = $(this).html();
        $(this).animate({"width":barwidth+"%" }, "slow");
    });

    setInterval(function(){
        $.getJSON('/scrambles/1.json', function(scrambles){
            $.getJSON('/scrambles/1/orders.json', function(orders){
                var msbars = $(".msbar");
                if(msbars.length==0)
                    return;
                $.each(msbars, function(key, val){
                    if($(this).width=orders.length+""){
                        alert($(this).width);
                    var barwidth = orders.length;
                    $(this).animate({"width":barwidth+"%" }, "slow");
                }

                });
            $("#bids").html(orders.length);
        });
        });

    }, 2000);

});


=======
var milestones;
var values;
var targetValues;

var animateMilestones = function(steps){

    var mstemp = CrossBrowser.getElementsByClassName("msbar", "div");
    if(mstemp.length==0){
        setTimeout(animateMilestones(steps), 1000);
        return;
    }
    milestones = mstemp;
    values = new Array(milestones.length);
    targetValues = new Array(milestones.length);

    for(var i=0;i<milestones.length;i++){
        values[i] = 0;
        targetValues[i] = milestones[i].innerHTML;
    }
    

    updateMilestoneBars();
}

var updateMilestoneBars = function(){
    var repeat = false;

    for(var j=0;j<milestones.length;j++){
        values[j] = values[j] + Math.ceil((targetValues[j]-values[j])/20);
        milestones[j].style.width = values[j] +"%";
        if(targetValues[j]>values[j]){
            repeat = true;
        }
    }

    if(repeat){
        setTimeout(updateMilestoneBars, 10);
    }
}

if(window.attachEvent) {
    window.attachEvent('onload', setTimeout("animateMilestones(50)", 1000));
}
else {
    if(window.onload) {
        var curronload = window.onload;
        var newonload = function() {
            curronload();
            setTimeout("animateMilestones(50)", 1000);
        };
        window.onload = newonload;
        } else {
            window.onload = setTimeout("animateMilestones(50)", 1000);
    }
}
>>>>>>> 5cd8ed10911b1e37a98f0635ad6202893d2ab629
