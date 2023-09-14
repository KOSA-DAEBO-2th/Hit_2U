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
