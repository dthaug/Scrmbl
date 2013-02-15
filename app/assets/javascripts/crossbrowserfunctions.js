
var CrossBrowser = new function() {

	this.getElementsByClassName = function(){
		if(document.getElementsByClassName){
	       return document.getElementsByClassName("msbar");
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
	        return milestones;
	    }
	};

}