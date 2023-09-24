/**
 *
 */
$(".question_form").hide();
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

const list = document.querySelector(".member_scroll");
const listScrollWidth = list.scrollWidth;
const listClientWidth = list.clientWidth;
// 이벤트마다 갱신될 값
let startX = 0;
let nowX = 0;
let endX = 0;
let listX = 0;

const onScrollStart = (e) => {
    startX = getClientX(e);
    window.addEventListener("mousemove", onScrollMove);
    window.addEventListener("touchmove", onScrollMove);
    window.addEventListener("mouseup", onScrollEnd);
    window.addEventListener("touchend", onScrollEnd);
};
const onScrollMove = (e) => {
    nowX = getClientX(e);
    setTranslateX(listX + nowX - startX);
};
const onScrollEnd = (e) => {
    endX = getClientX(e);
    listX = getTranslateX();
    if (listX > 0) {
        setTranslateX(0);
        list.style.transition = `all 0.3s ease`;
        listX = 0;
    } else if (listX < listClientWidth - listScrollWidth) {
        setTranslateX(listClientWidth - listScrollWidth);
        list.style.transition = `all 0.3s ease`;
        listX = listClientWidth - listScrollWidth;
    }

    window.removeEventListener("mousedown", onScrollStart);
    window.removeEventListener("touchstart", onScrollStart);
    window.removeEventListener("mousemove", onScrollMove);
    window.removeEventListener("touchmove", onScrollMove);
    window.removeEventListener("mouseup", onScrollEnd);
    window.removeEventListener("touchend", onScrollEnd);
    window.removeEventListener("click", onClick);

    setTimeout(() => {
        bindEvents();
        list.style.transition = "";
    }, 300);
};
const onClick = (e) => {
    if (startX - endX !== 0) {
        e.preventDefault();
    }
};

const getClientX = (e) => {
    const isTouches = e.touches ? true : false;
    return isTouches ? e.touches[0].clientX : e.clientX;
};

const getTranslateX = () => {
    return parseInt(getComputedStyle(list).transform.split(/[^\-0-9]+/g)[5]);
};

const setTranslateX = (x) => {
    list.style.transform = `translateX(${x}px)`;
};

const bindEvents = () => {
    list.addEventListener("mousedown", onScrollStart);
    list.addEventListener("touchstart", onScrollStart);
    list.addEventListener("click", onClick);
};
bindEvents();

///////////

const list2 = document.querySelector(".recommend_scroll");
const list2ScrollWidth = list2.scrollWidth;
const list2ClientWidth = list2.clientWidth;
// 이벤트마다 갱신될 값
let startX2 = 0;
let nowX2 = 0;
let endX2 = 0;
let listX2 = 0;

const onScrollStart2 = (e) => {
    startX2 = getClientX(e);
    window.addEventListener("mousemove", onScrollMove2);
    window.addEventListener("touchmove", onScrollMove2);
    window.addEventListener("mouseup", onScrollEnd2);
    window.addEventListener("touchend", onScrollEnd2);
};
const onScrollMove2 = (e) => {
    nowX2 = getClientX(e);
    setTranslateX2(listX2 + nowX2 - startX2);
};
const onScrollEnd2 = (e) => {
    endX2 = getClientX(e);
    listX2 = getTranslateX2();
    if (listX2 > 0) {
        setTranslateX2(0);
        list2.style.transition = `all 0.3s ease`;
        listX2 = 0;
    } else if (listX2 < list2ClientWidth - list2ScrollWidth) {
        setTranslateX2(list2ClientWidth - list2ScrollWidth);
        list2.style.transition = `all 0.3s ease`;
        listX2 = list2ClientWidth - list2ScrollWidth;
    }

    window.removeEventListener("mousedown", onScrollStart2);
    window.removeEventListener("touchstart", onScrollStart2);
    window.removeEventListener("mousemove", onScrollMove2);
    window.removeEventListener("touchmove", onScrollMove2);
    window.removeEventListener("mouseup", onScrollEnd2);
    window.removeEventListener("touchend", onScrollEnd2);
    window.removeEventListener("click", onClick2);

    setTimeout(() => {
        bindEvents2();
        list2.style.transition = "";
    }, 300);
};
const onClick2 = (e2) => {
    if (startX2 - endX2 !== 0) {
        e2.preventDefault();
    }
};

const getTranslateX2 = () => {
    return parseInt(getComputedStyle(list2).transform.split(/[^\-0-9]+/g)[5]);
};

const setTranslateX2 = (x2) => {
    list2.style.transform = `translateX(${x2}px)`;
};

const bindEvents2 = () => {
    list2.addEventListener("mousedown", onScrollStart2);
    list2.addEventListener("touchstart", onScrollStart2);
    list2.addEventListener("click", onClick2);
};
bindEvents2();

//탭 이벤트
// $(".info_form").hide();

$(document).on("click", ".question", function () {
    $(".info_form").hide();
    $(".question_form").show();
});

$(document).on("click", ".info", function () {
    $(".question_form").hide();
    $(".info_form").show();
});
var position_kr;
$(document).on("click", ".btn_apply", function () {
    position_kr = $(this).parent().siblings(".position_name").text();

    $(".apply_position").text(position_kr);
});

$(document).on("click", ".btn_apply_submit", function () {
    position_apply(boardIdx, position_kr);
});

function position_apply(boardIdx, position_kr) {
    console.log("position_apply");
    console.log(boardIdx);
    console.log(position_kr);
    $.ajax({
        url: "/meeting/meeting_apply",
        type: "POST",
        dataType: "text",
        data: {
            boardIdx: boardIdx,
            meeting_position: position_kr,
        },
        success: function (data) {
            if (Number(data) == 1) {
                alert("지원완료");
                location.reload();
            } else {
                alert("지원실패");
            }
        },
        error: function () {
            alert("뭔가 오류있네");
        },
    });
}

$(".reply_add").hide();
const reply = document.querySelector(".reply_input");
reply.addEventListener("keyup", onKeyUp);
function onKeyUp() {
    var reply_value = reply.value.length;
    $(".reply_current_value").text(reply_value.toLocaleString("ko-KR"));
    reply_value_check(reply_value);
}
function reply_value_check(reply_value) {
    if (reply_value >= 1 && reply_value <= 1000) {
        $(".reply_add").show();
        $(".reply_current_value").css({
            color: "black",
        });
        $(".reply_input").css({
            height: "100px",
        });
    } else if (reply_value >= 1001) {
        $(".reply_current_value").css({
            color: "red",
        });
    } else {
        $(".reply_add").hide();
        $(".reply_input").css({
            height: "40px",
        });
    }
}

$(document).on("click", ".reply_submit", function () {
    var reply_value = Number($(".reply_current_value").text().split(",").join(""));
    if (reply_value > 1000) {
        alert("1000 !!!!!!!!");
        return;
    }
});

$(document).on("click", ".btn_apply_cancle", function () {
    if (!confirm("지원을 취소 하시겠습니까?")) {
        return false;
    }
    location.href = "/meeting/apply_cancle/" + boardIdx + "/" + test;
});
