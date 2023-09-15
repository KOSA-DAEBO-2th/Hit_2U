$(".nav_link a").on("click", function () {
    $(".nav_link a").css("color", "black");
    $(this).css("color", "royalblue");
});

function goPost(page, topic) {
    var f = document.createElement("form");

    var obj;
    obj = document.createElement("input");
    obj.setAttribute("type", "hidden");
    obj.setAttribute("name", "page_num");
    obj.setAttribute("value", 1);

    f.appendChild(obj);
    f.setAttribute("method", "post");
    f.setAttribute("action", "/meeting");
    document.body.appendChild(f);
    f.submit();
}
