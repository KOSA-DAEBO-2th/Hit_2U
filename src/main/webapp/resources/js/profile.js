/**
 * profile.js
 */

function writeList(){
    console.log("clicked");
    $('.changeSection').load("profile_writeList");
    $('.active').removeClass("active");
    $(this).addClass("active");
}