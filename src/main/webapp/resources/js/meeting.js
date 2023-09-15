$(".btn_category").on("click", function () {
    $(".btn_category").removeClass("btn_category_click");
    $(".btn_anonymous").removeClass("btn_anonymous_click");
    $(this).addClass("btn_category_click");

    $.ajax({
        url: "/meeting",
        type: "POST",
        data: {
            select: $(this).val(),
        },
        dataType: "html",
        success: function (data) {
            $(".row").empty();
            sessionStorage.setItem("save", data);
            $(".row").append(data);
        },
        error: function () {
            alert("뭔가 오류있네");
        },
    });
});

$(".search-btn").on("click", function () {
    meeting_search();
});

function meeting_search() {
    var id = $(".search-txt").val();

    $.ajax({
        url: "/meeting/meeting_search",
        type: "POST",
        data: {
            search_target: id,
        },
        dataType: "html",
        success: function (data) {
            $(".row").empty();
            sessionStorage.setItem("save", data);
            $(".row").append(data);
        },
        error: function () {
            alert("뭔가 오류있네");
        },
    });
}

$(".page").on("click", function () {
    page();
});

function page() {
    var currentPage = $(".page_test").val();

    $.ajax({
        url: "/meeting/meeting_page",
        type: "POST",
        data: {
            page_num: currentPage,
        },
        dataType: "html",
        success: function (data) {
            $(".row").empty();
            sessionStorage.setItem("save", data);
            $(".row").append(data);
        },
        error: function () {
            alert("뭔가 오류있네");
        },
    });
}
window.onbeforeunload = function () {
    var save = sessionStorage.getItem("save");
    console.log(save);
    $(".row").html(sessionStorage.getItem("save"));
};

window.addEventListener("popstate", function (event) {
    alert("뒤로가기 버튼이 클릭되었습니다!");
});
