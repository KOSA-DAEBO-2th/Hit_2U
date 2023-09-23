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

$(document).on("click", ".reply_update", function () {
    var original_reply = $(this).closest(".question_section ").find(".reply_output").html();
    console.log(original_reply);

    original_reply = original_reply.replaceAll("<br>", "\n");
    var reply_update_html = `
    <div class='reply_section font_14'>
        <textarea cols='20' wrap='hard' class="reply_update_input" style="white-space:pre; height:100px;"></textarea>
        <div class='flex reply_update_add'>
            <div><text class='reply_current_value'></text>/<text class='font_gray'>1,000</text></div>
            <div>
                <button class="btn reply_update_btn">수정</button>
            </div>
        </div>
    </div>`;
    $(this).closest(".question_section ").find(".reply_update_form").html(reply_update_html);
    $(".reply_update_input").val(original_reply);
    $(".reply_current_value").text($(".reply_update_input").val().length.toLocaleString("ko-KR"));
});

$(document).on("keyup", ".reply_update_input", function () {
    var reply_value = $(".reply_update_input").val().length;
    $(".reply_current_value").text(reply_value.toLocaleString("ko-KR"));
    reply_value_check1(reply_value);
});

function reply_value_check1(reply_value) {
    if (reply_value >= 1 && reply_value <= 1000) {
        $(".reply_current_value").css({
            color: "black",
        });
    } else if (reply_value >= 1001) {
        $(".reply_current_value").css({
            color: "red",
        });
    }
}

$(document).on("click", ".reply_update_btn", function () {
    var reply_no = $(this).closest(".question_section ").find(".reply_no").val();

    var update_txt = $(".reply_update_input").val();
    update_txt = update_txt.replace(/(?:\r\n|\r|\n)/g, "<br/>");

    $.ajax({
        url: "/market/reply/update",
        type: "POST",
        data: {
            b_no: b_no,
            reply_no: reply_no,
            r_content: update_txt,
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
});

$(document).on("click", ".reply_delete", function () {
    if (!confirm("댓글을 삭제하시겠습니까?")) {
        return false;
    }
    var reply_no = $(this).closest(".question_section ").find(".reply_no").val();

    $.ajax({
        url: "/market/reply/delete",
        type: "POST",
        data: {
            b_no: b_no,
            reply_no: reply_no,
        },
        dataType: "html",
        success: function (data) {
            $(".question_form").empty();
            $(".question_form").append(data);
            $(".reply_add").hide();
        },
        error: function () {
            alert("뭔가 오류있네");
        },
    });
});

// let a = 5;
// var html = `
// <select class="form-select" name="topic">

// <option value="">토픽을 선택해주세요.</option>
// <option value="커리어">커리어${a}</option>
// <option value="기술">기술</option>
// <option value="알고리즘">알고리즘</option>
// <option value="기타">기타</option>

// </select>

// `;

// ok;
