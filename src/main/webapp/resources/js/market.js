$(document).on("click", ".fa-chevron-right", function () {
    var go_page = Number($(".current_page").val()) + 1;
    $(".current_page").val(go_page);
});
