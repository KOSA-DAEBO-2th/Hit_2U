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
        ["view", ["codeview"]],
    ],
    fontSizes: ["8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "28", "30", "36", "50", "72"],
    callbacks: {
        //여기 부분이 이미지를 첨부하는 부분
        onImageUpload: function (files) {
            uploadSummernoteImageFile(files[0], this);
        },
        // ,
        // onPaste: function (e) {
        //     var clipboardData = e.originalEvent.clipboardData;
        //     if (clipboardData && clipboardData.items && clipboardData.items.length) {
        //         var item = clipboardData.items[0];
        //         if (item.kind === "file" && item.type.indexOf("image/") !== -1) {
        //             e.preventDefault();
        //         }
        //     }
        // },
    },
});

function uploadSummernoteImageFile(file, editor) {
    data = new FormData();
    data.append("file", file);
    $.ajax({
        data: data,
        type: "POST",
        url: "/market/uploadSummernoteImageFile",
        dataType: "JSON",
        contentType: false,
        processData: false,
        success: function (data) {
            $(editor).summernote("insertImage", data.url);
        },
        error: function () {
            alert("image upload error!!!");
        },
    });
}

$("div.note-editable").on("drop", function (e) {
    for (i = 0; i < e.originalEvent.dataTransfer.files.length; i++) {
        uploadSummernoteImageFile(e.originalEvent.dataTransfer.files[i], $("#summernote")[0]);
    }
    e.preventDefault();
});

$(document).on("click", ".fa-minus", function () {
    var count = Number($(".member_count").text()) - 1;
    if (count <= 1) {
        count = 1;
    }
    $(".member_count").text(count);
});
