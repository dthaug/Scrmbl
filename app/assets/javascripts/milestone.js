var milestones;
var values;
var targetValues;

var animateMilestones = function(steps){
    
    if(document.getElementsByClassName){
        milestones = document.getElementsByClassName("msbar");
    }
    else{
        //fix for internet explorer
        milestones = new Array();
        var i = 0;
        var a = document.getElementsByTagName("div");
        
        while(element = a[i++]){
            if (element.className == "msbar") {
                milestones.push(element);
            }
        }
    }
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
