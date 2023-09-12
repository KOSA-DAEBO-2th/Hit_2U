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
