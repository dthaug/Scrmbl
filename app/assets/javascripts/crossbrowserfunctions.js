<<<<<<< HEAD

var CrossBrowser = new function() {


	this.getElementsByClassName = function(className, tagType){
		if(document.getElementsByClassName){
	       return document.getElementsByClassName(className);
	    }
	    else{
	        //fix for internet explorer
	        milestones = new Array();
	        var i = 0;
	        var a = document.getElementsByTagName(tagType);
	        
	        while(element = a[i++]){
	            if (element.className == className) {
	                milestones.push(element);
	            }
	        }
	        return milestones;
	    }
	};

	// this.onDocLoad = function(functionName){
	// 	if(window.attachEvent) {
	// 	    window.attachEvent('onload', setTimeout(functionName, 500));
	// 	}
	// 	else {
	// 	    if(window.onload) {
	// 	        var curronload = window.onload;
	// 	        var newonload = function() {
	// 	            curronload();
	// 	            setTimeout(functionName, 500);
	// 	        };
	// 	        window.onload = newonload;
	// 	        } else {
	// 	            window.onload = setTimeout(functionName, 500);
	// 	    }
	// 	}
	// };

=======

var CrossBrowser = new function() {


	this.getElementsByClassName = function(className, tagType){
		if(document.getElementsByClassName){
	       return document.getElementsByClassName(className);
	    }
	    else{
	        //fix for internet explorer
	        milestones = new Array();
	        var i = 0;
	        var a = document.getElementsByTagName(tagType);
	        
	        while(element = a[i++]){
	            if (element.className == className) {
	                milestones.push(element);
	            }
	        }
	        return milestones;
	    }
	};

	// this.onDocLoad = function(functionName){
	// 	if(window.attachEvent) {
	// 	    window.attachEvent('onload', setTimeout(functionName, 500));
	// 	}
	// 	else {
	// 	    if(window.onload) {
	// 	        var curronload = window.onload;
	// 	        var newonload = function() {
	// 	            curronload();
	// 	            setTimeout(functionName, 500);
	// 	        };
	// 	        window.onload = newonload;
	// 	        } else {
	// 	            window.onload = setTimeout(functionName, 500);
	// 	    }
	// 	}
	// };

>>>>>>> 5cd8ed10911b1e37a98f0635ad6202893d2ab629
}