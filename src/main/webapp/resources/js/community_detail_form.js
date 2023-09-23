elapsedTime(date);

function elapsedTime(date) {
    const start = new Date(date);
    const end = new Date();

    const diff = (end - start) / 1000;

    const times = [
        { name: "년", milliSeconds: 60 * 60 * 24 * 365 },
        { name: "개월", milliSeconds: 60 * 60 * 24 * 30 },
        { name: "일", milliSeconds: 60 * 60 * 24 },
        { name: "시간", milliSeconds: 60 * 60 },
        { name: "분", milliSeconds: 60 },
    ];

    for (const value of times) {
        const betweenTime = Math.floor(diff / value.milliSeconds);

        if (betweenTime > 0) {
            var day = "(" + `${betweenTime}${value.name} 전` + ")";
            $(".day_cal").text(day);
            return;
        }
    }
    $(".day_cal").text("(방금 전)");
    return;
}

$(".reply_add").hide();

$(document).on("keyup", ".reply_input", function () {
    var reply_value = $(".reply_input").val().length;
    $(".reply_current_value").text(reply_value.toLocaleString("ko-KR"));
    reply_value_check(reply_value);
});

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
    reply_input(b_no);
});

function reply_input(b_no) {
    var r_content = $(".reply_input").val();
    r_content = r_content.replace(/(?:\r\n|\r|\n)/g, "<br/>");

    $.ajax({
        url: "/market/reply",
        type: "POST",
        data: {
            b_no: b_no,
            r_content: r_content,
        },
        dataType: "html",
        success: function (data) {
            $(".question_form").empty();
            $(".question_form").append(data);
            $(".reply_add").hide();
            var height = $(".reply_answer_section").last().offset();
            // $(".reply_answer_section").last()
            $("html, body").animate({ scrollTop: height.top }, 200);
        },
        error: function () {
            alert("뭔가 오류있네");
        },
    });
}


function deleteAndAlert(url) {

        Swal.fire({
            title: '삭제하시겠습니까??',
            text: "한번 삭제하면 되돌릴수 없습니다.",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Delete!'
        }).then((result) => {
            if (result.value) {

                location.href = url;
            }
        });
}



