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


$(document).ready(function () {
    //여기 아래 부분
    $("#summernote").summernote({
        height: 600, // 에디터 높이
        minHeight: 600, // 최소 높이
        maxHeight: 1000, // 최대 높이
        lang: "ko-KR", // 한글 설정
        toolbar: [
            // [groupName, [list of button]]
            ["fontsize", ["fontsize"]],
            ["style", ["bold", "italic", "underline", "strikethrough", "clear"]],
            ["table", ["table"]],
            ["para", ["ul", "ol", "paragraph"]],
            ["height", ["height"]],
            ["insert", ["picture", "link", "video"]],
        ],
        fontSizes: ["8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "28", "30", "36", "50", "72"],
    });
});

