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
