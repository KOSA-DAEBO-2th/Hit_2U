$(document).on("click", ".search_option", function () {
    $(".collapse").hide();
});

// $(".collapse").hide();

var search_txt = $(".btn_category_click").text();

$(".search-txt").attr("placeholder", search_txt + "에서 검색");

$(document).on("click", ".search-btn", function () {
    $(".hidden").click();
});

function formChk() {
    var page_chk = Number($(".current_page").val());
    var maxPage = Number($(".max_page").val());
    if (page_chk > maxPage || page_chk <= 0 || isNaN(page_chk)) {
        Swal.fire({
            title: "페이지 범위 오류!",
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

        return false;
    }

    return true;
}




$(document).ready(function() {
    var page_size = 10; // 한 페이지당 항목 개수

    $(".fa-chevron-right").on("click", function () {
        var go_page = Number($(".current_page").val().trim()) + 1;
        var maxPage = Number($(".max_page").val().trim());
        if (go_page > maxPage) {
            Swal.fire({
                title: "마지막 페이지 입니다.",
                width: 500,
                padding: "3em",
                color: "#716add",
                background: "#fff url(https://sweetalert2.github.io/images/trees.png)",
                backdrop:
                    `rgba(0,0,123,0.4)
                    url("https://sweetalert2.github.io/images/nyan-cat.gif")
                    left top
                    no-repeat`,
            });
            return;
        }
        
        $("input[name='page']").val(go_page);
        
        $("form[action='/community/search']").submit();
    });

    $(".fa-chevron-left").on("click", function () {
        var go_page = Number($(".current_page").val().trim()) - 1;
        if (go_page <= 0) {
            Swal.fire({
                title: "첫번째 페이지 입니다.",
                width: 500,
                padding: "3em",
                color: "#716add",
                background: "#fff url(https://sweetalert2.github.io/images/trees.png)",
               backdrop:
                    `rgba(0,0,123,0.4)
                    url("https://sweetalert2.github.io/images/nyan-cat.gif")
                    left top
                    no-repeat`,
            });
           return;
       }
       
       $("input[name='page']").val(go_page);
       
       $("form[action='/community/search']").submit();
   });
});


document.querySelector('.fa-chevron-left').addEventListener('click', function() {
    let currentPage = parseInt(document.querySelector('.current_page').value);
    if (currentPage > 1) {
        location.href = '/community/search?page=' + (currentPage - 1);
    }
});

document.querySelector('.fa-chevron-right').addEventListener('click', function() {
    let currentPage = parseInt(document.querySelector('.current_page').value);
    let maxPage = parseInt(document.querySelector('.max_page').value);
    if (currentPage < maxPage) {
        location.href = '/community/search?page=' + (currentPage + 1);
    }
});

