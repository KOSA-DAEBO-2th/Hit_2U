//뒤로가기, 새로고침 시 이전 ajax 정보 유지를 위한 함수
window.onload = function () {
    if (sessionStorage.getItem("save") == null) {
        return;
    } else {
        $(".row").empty();
        $(".row").append(sessionStorage.getItem("save"));
        $(".search-txt").val(sessionStorage.getItem("search"));
        $(".btn_category").removeClass("btn_category_click");
        var topic = sessionStorage.getItem("topic");
        var select_topic;
        if (topic == "전체") {
            select_topic = document.getElementById("total");
        } else if (topic == "프로젝트") {
            select_topic = document.getElementById("project");
        } else {
            select_topic = document.getElementById("study");
        }

        select_topic.className += " btn_category_click";
    }
};

//선택된 topic 요소에 click 클래스 추가 & 해당 요소의 값으로 ajax 요청
$(document).on("click", ".btn_category", function () {
    $(".btn_category").removeClass("btn_category_click");
    $(this).addClass("btn_category_click");
    page();
});

//검색 버튼 클릭 시 ajax 요청
$(document).on("click", ".search-btn", function () {
    page(1);
});

//왼쪽 화살표 클릭 시 ajax 요청
$(document).on("click", ".fa-chevron-left", function () {
    var currentPage = Number($(".current_page").val()) - 1;
    if (currentPage <= 0) {
        // Swal.fire({
        //     icon: "error", // Alert 타입
        //     title: "첫 번째 페이지 입니다.", // Alert 제목
        //     text: "다시 한번 확인해주세요.", // Alert 내용
        // });
        Swal.fire({
            title: "첫번째 페이지 입니다.",
            width: 500,
            padding: "3em",
            color: "#716add",
            background: "#fff url(https://sweetalert2.github.io/images/trees.png)",
            backdrop: `
              rgba(0,0,123,0.4)
              url("https://sweetalert2.github.io/images/nyan-cat.gif")
              left top
              no-repeat
            `,
        });
        return;
    }

    page(currentPage);
});

//오른쪽 화살표 클릭 시 ajax 요청
$(document).on("click", ".fa-chevron-right", function () {
    var currentPage = Number($(".current_page").val()) + 1;
    var maxPage = Number($(".max_page").val());
    if (currentPage > maxPage) {
        // Swal.fire({
        //     icon: "error", // Alert 타입
        //     title: "마지막 페이지 입니다.", // Alert 제목
        //     text: "다시 한번 확인해주세요.", // Alert 내용
        // });
        Swal.fire({
            title: "마지막 페이지 입니다.",
            width: 500,
            padding: "3em",
            color: "#716add",
            background: "#fff url(https://sweetalert2.github.io/images/trees.png)",
            backdrop: `
              rgba(0,0,123,0.4)
              url("https://sweetalert2.github.io/images/nyan-cat.gif")
              left top
              no-repeat
            `,
        });
        return;
    }
    page(currentPage);
});

//페이지 불러오는 함수, 이전 정보 저장을 위해 sessionStorage 사용
function page(currentPage) {
    var id = $(".search-txt").val();
    sessionStorage.setItem("page", Number($(".current_page").val()));
    sessionStorage.setItem("topic", $(".btn_category_click").val());
    sessionStorage.setItem("search", id);
    $.ajax({
        url: "/meeting/meeting_page",
        type: "POST",
        data: {
            page_num: currentPage,
            topic: $(".btn_category_click").val(),
            search_target: id,
        },
        dataType: "html",
        success: function (data) {
            $(".row").empty();
            $(".row").append(data);
            sessionStorage.setItem("save", data);
        },
        error: function () {
            alert("뭔가 오류있네");
        },
    });
}

//페이지 선택적 이동을 위한 함수
function page_go() {
    var currentPage = Number($(".current_page").val());
    if (isNaN(currentPage)) {
        Swal.fire({
            title: "숫자만 입력해 주세요.",
            width: 500,
            padding: "3em",
            color: "#716add",
            background: "#fff url(https://sweetalert2.github.io/images/trees.png)",
            backdrop: `
              rgba(0,0,123,0.4)
              url("https://sweetalert2.github.io/images/nyan-cat.gif")
              left top
              no-repeat
            `,
        });
        $(".current_page").val("");
        return;
    }
    var maxPage = Number($(".max_page").val());
    if (currentPage <= 0) {
        currentPage = 1;
    } else if (currentPage > maxPage) {
        currentPage = maxPage;
    }
    page(currentPage);
}
