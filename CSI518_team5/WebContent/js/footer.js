//(function() {
//    var nav = document.getElementById('nav'),
//        anchor = nav.getElementsByTagName('a'),
//        current = window.location.pathname.split('/')[1];
//        for (var i = 0; i < anchor.length; i++) {
//        if(anchor[i].href == current) {
//            anchor[i].className = "active";
//        }
//    }
//})();

$(document).ready(function() {
	// get current URL path and assign 'active' class
	var pathname = window.location.pathname;
	alert(pathname);
	$('.nav > li > a[href="'+pathname+'"]').parent().addClass('active');
})