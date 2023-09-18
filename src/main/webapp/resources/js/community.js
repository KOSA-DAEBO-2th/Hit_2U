$(".btn_category").on("click", function () {
    $(".btn_category").removeClass("btn_category_click");
    $(".btn_anonymous").removeClass("btn_anonymous_click");
    $(this).addClass("btn_category_click");
});

$(".btn_anonymous").on("click", function () {
    $(".btn_category").removeClass("btn_category_click");
    $(this).addClass("btn_anonymous_click");
});


// community_detail / community_update_form
function board_write() {
    var title = document.getElementById('b_title').value;
    var content = document.getElementById('b_content').value;

    if(title == '') {
        alert("제목을 입력해주세요.");
        return false;
    }else if(content == '') {
        alert("내용을 입력해주세요.");
        return false;
    }
    return true;
}




