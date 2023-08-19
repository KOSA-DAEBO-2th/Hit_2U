window.onload=function(){
  var windowWidth = $( window ).width();
if(windowWidth > 1500) {
		$('main').removeClass('main_content');
		$('main').addClass('main_content_sm');
} else {
$('main').removeClass('main_content_sm');
		$('main').addClass('main_content');
}
}

window.onresize = function() {

	if (window.innerWidth > 1500) {
		$('main').removeClass('main_content');
		$('main').addClass('main_content_sm');
	} else {
		$('main').removeClass('main_content_sm');
		$('main').addClass('main_content');
	}
}