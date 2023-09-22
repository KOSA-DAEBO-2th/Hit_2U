$(".btn_category").on("click", function () {
    $(".btn_category").removeClass("btn_category_click");
    $(".btn_anonymous").removeClass("btn_anonymous_click");
    $(this).addClass("btn_category_click");
});

$(".btn_anonymous").on("click", function () {
    $(".btn_category").removeClass("btn_category_click");
    $(this).addClass("btn_anonymous_click");
});


// community_detail / community_update_form
function board_write() {
    var title = document.getElementById('b_title').value;
    var content = document.getElementById('b_content').value;

    if(title == '') {
        alert("제목을 입력해주세요.");
        return false;
    }else if(content == '') {
        alert("내용을 입력해주세요.");
        return false;
    }
    return true;
}


 				function board_update() {
			location.href = "community_update_form?b_no=${dto.b_no}";
			}

			function board_delete() {

					if (confirm("정말 삭제하시겠습니까?") == true) {
					location.href = "/community_delete/${dto.b_no}";
				} else {
						return false;
				}
		}
		function board_reply() {
					
				var r_content = document.getElementById('r_content').value;

				if (r_content == '') {
					alert("댓글에 내용을 입력해주세요.");
					return false;
					}
				}
				$(document)
					.ready(
							function() {
								$("form")
									.on(
												'submit',
												function(event) {
												event.preventDefault();

												var formData = $(this)
														.serialize();
													$
														.ajax({
																url : "${pageContext.request.contextPath}/community/${dto.b_no}/replies",
															type : "POST",
																data : formData,
																dataType : "json",
																success : function(
																	data) {
																	
															var div = $(
																		"<div>")
																		.addClass(
																				"reply_list");
																var contentDiv = $(
																			"<div>")
																			.append(
																					"<span>"
																						+ data.nickname
																							+ "</span><p>"
																							+ data.r_content
																							+ "</p>");
																	var deleteButtonDiv = $(
																			"<div>")
																			.append(
																					'<button class="btn btn-primary btn-jelly btn-blue">삭제</button>');

																	div
																			.append(contentDiv);
																	div
																			.append(deleteButtonDiv);

																	$(
																				"#comments")
 																				.prepend(
																						div);
																	},
																	error : function(
																			xhr,
																		textStatus,
																	errorThrown) {
																if (xhr.status === 403) {
																	window.location.href = '/member/login';
																	} else if (xhr.status === 404) {
																		alert('User not found.');
																	} else {
																		// 																			alert('로그인');
																		window.location.href = '/member/login';
																	}
																}
															});
												});
							});




function submitSearch() {
	var title = document.getElementById('search_box').value;
	if (title) {
		location.href = '/community/search?title='
				+ encodeURIComponent(title);
	}
}







$(document).ready(function () {
    //여기 아래 부분
    $("#summernote").summernote({
        height: 600, // 에디터 높이
        minHeight: 600, // 최소 높이
        maxHeight: 1000, // 최대 높이
        lang: "ko-KR", // 한글 설정
        toolbar: [
            // [groupName, [list of button]]
            ["fontsize", ["fontsize"]],
            ["style", ["bold", "italic", "underline", "strikethrough", "clear"]],
            ["table", ["table"]],
            ["para", ["ul", "ol", "paragraph"]],
            ["height", ["height"]],
            ["insert", ["picture", "link", "video"]],
        ],
        fontSizes: ["8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "28", "30", "36", "50", "72"],
    });
});

