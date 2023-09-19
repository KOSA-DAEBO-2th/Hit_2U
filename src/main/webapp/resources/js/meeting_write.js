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
        url: "/meeting/uploadSummernoteImageFile",
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

$(document).on("click", ".fa-plus", function () {
    var count = Number($(".member_count").text()) + 1;
    if (count >= 9) {
        count = 9;
    }
    $(".member_count").text(count);
});

$(document).on("click", ".member_add_btn", function () {
    var position = $("#selectbox_position option:selected").val();
    var count = $(".member_count").text();
    if (position == null || position == "") {
        alert("포지션 선택 후 추가 버튼을 눌러주세요.");
        return;
    }

    if (position == "백엔드") {
        var member_html =
            "<div class='member_result margin_right_12'><text>" +
            position +
            "</text> <text>" +
            count +
            "</text> <i class='fa-solid fa-xmark'></i> <input type='hidden' id='backend' name='backend' value='" +
            count +
            "'></div>";
        $(".member_add_form").append(member_html);
    } else if (position == "프론트엔드") {
        var member_html =
            "<div class='member_result margin_right_12'><text>" +
            position +
            "</text> <text>" +
            count +
            "</text> <i class='fa-solid fa-xmark'></i> <input type='hidden' id='frontend' name='frontend' value='" +
            count +
            "'></div>";
        $(".member_add_form").append(member_html);
    } else if (position == "웹 서버") {
        var member_html =
            "<div class='member_result margin_right_12'><text>" +
            position +
            "</text> <text>" +
            count +
            "</text> <i class='fa-solid fa-xmark'></i> <input type='hidden' id='server' name='server' value='" +
            count +
            "'></div>";
        $(".member_add_form").append(member_html);
    } else if (position == "프로젝트 매니저") {
        var member_html =
            "<div class='member_result margin_right_12'><text>" +
            position +
            "</text> <text>" +
            count +
            "</text> <i class='fa-solid fa-xmark'></i> <input type='hidden' id='pm' name='pm' value='" +
            count +
            "'></div>";
        $(".member_add_form").append(member_html);
    }

    $(".member_count").text(1);
});

$(document).on("click", ".member_result", function () {
    $(this).remove();
});

$(".datePicker").datepicker({
    format: "yyyy-mm-dd", //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
    startDate: "d", //달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
    autoclose: true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
    /* 			templates : {
                        leftArrow : '&laquo;',
                        rightArrow : '&raquo;'
                    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징  */
    showWeekDays: true, // 위에 요일 보여주는 옵션 기본값 : true
    todayHighlight: true, //오늘 날짜에 하이라이팅 기능 기본값 :false
    toggleActive: false, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
    weekStart: 0, //달력 시작 요일 선택하는 것 기본값은 0인 일요일
    language: "ko", //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
}); //datepicker end

function loadFile(input) {
    var file = input.files[0]; //선택된 파일 가져오기
    var file_url = URL.createObjectURL(file);
    var preview_html = "<img src='" + file_url + "' width='100%' height='100%'></img>";
    $(".img_input_btn").html("");
    $(".img_input_btn").html(preview_html);

    $;
    // //미리 만들어 놓은 div에 text(파일 이름) 추가
    // var name = document.getElementById("fileName");
    // name.textContent = file.name;

    // //새로운 이미지 div 추가
    // var newImage = document.createElement("img");
    // newImage.setAttribute("class", "img");

    // //이미지 source 가져오기
    // newImage.src = URL.createObjectURL(file);

    // newImage.style.width = "70%";
    // newImage.style.height = "70%";
    // newImage.style.visibility = "hidden"; //버튼을 누르기 전까지는 이미지를 숨긴다
    // newImage.style.objectFit = "contain";

    // //이미지를 image-show div에 추가
    // var container = document.getElementById("image-show");
    // container.appendChild(newImage);
}
