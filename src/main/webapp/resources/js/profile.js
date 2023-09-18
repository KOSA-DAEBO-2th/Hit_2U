/**
 * profile.js
 */

function writeList(){
    console.log("clicked");
    $('.active').removeClass("active");
    $(this).addClass('active');
    $('.changeSection').load("profile_writeList");
}

function profile(){
    location.href="profile";
}

function meetingList(){
	//console.log("모임어쩌구 눌림");
    $('.changeSection').load("profile_meetingList");
}