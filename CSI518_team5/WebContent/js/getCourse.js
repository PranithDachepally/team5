$(document).ready(function() {
        alert( "document loaded" );
    });


function getCourse(getCourseUrl,returnOnSuccess) {

	// Get all form elements and submit to URL
/*	var keyValuePairs = [];
	for ( var i = 0; i < document.myform.elements.length; i++ ) {
	   var e = document.myform.elements[i];
	   keyValuePairs.push(encodeURIComponent(e.name) + "=" + encodeURIComponent(e.value));
	}
	var params = keyValuePairs.join("&");
	//window.alert(params);
	// Send AJAX request to URL
	var req = new XMLHttpRequest();
	req.open("POST",getCourseUrl,false);
	req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	req.setRequestHeader("Content-length", params.length);
	req.setRequestHeader("Connection", "close");
	req.send(params);
	
	// Get response
	if(req.responseText=="success") {
			
			document.getElementById("errormsg").innerHTML="";
			document.getElementById("successmsg").innerHTML="Success!";
			
			// If returnOnSuccess is set, 
			if(returnOnSuccess=="true") {
				return true;
			}
			
	}
	else {
		document.getElementById("errormsg").innerHTML="ERROR: " + req.responseText;
		document.getElementById("successmsg").innerHTML="";
	}

	// Default to returning false
	return false;
*/	
	alert("getcourse.js is working" );
}

