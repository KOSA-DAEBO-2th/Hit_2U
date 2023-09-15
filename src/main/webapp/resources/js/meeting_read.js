/**
 *
 */

$(".read_select").hover(
    function () {
        $(this).addClass("read_hover");
    },
    function () {
        $(this).removeClass("read_hover");
    }
);

$(".read_select").on("click", function () {
    $(".read_select").removeClass("active");
    $(this).addClass("active");
});

var topic = $(".category_header").text();
console.log($(".category_header").text());

if (topic == "스터디") {
    $(".category_header").css("background-color", "#63a02a");
}

window.addEventListener("popstate", function (event) {
    alert("뒤로가기 버튼이 클릭되었습니다!");
});
