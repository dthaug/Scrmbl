var milestones;
var values;
var targetValues;

var animateMilestones = function(steps){

    //var crossBrowser = new CrossBrowser();
    
    milestones = CrossBrowser.getElementsByClassName("msbar");

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
        milestones[j].style.width = values[j] +"px";
        if(targetValues[j]>values[j]){
            repeat = true;
        }
    }

    if(repeat){
        setTimeout(updateMilestoneBars, 10);
    }
}

if(window.attachEvent) {
    window.attachEvent('onload', setTimeout("animateMilestones(50)",500));
} 
else {
    if(window.onload) {
        var curronload = window.onload;
        var newonload = function() {
            curronload();
            setTimeout("animateMilestones(50)",500);
        };
        window.onload = newonload;
    } else {
        window.onload = setTimeout("animateMilestones(50)", 500);
    }
}
