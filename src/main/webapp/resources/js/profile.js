/**
 * profile.js
 */

function writeList(){
    console.log("clicked");
    $('.active').removeClass("active");
    $(this).addClass('active');
    $('.changeSection').load("profile_writeList");
}

function profile(){
    location.href="profile";
}

function meetingList(){
	//console.log("모임어쩌구 눌림");
    $('.changeSection').load("profile_meetingList");
}

///////////////////////////////////////////////////////////////////////////////memberProfile


$(document).on("click", ".btn_msg_submit", function () {
	var content = $('#message-text').val();
    console.log("-----------"+ content);
	send_message(content);
    
});

function send_message(content){
    console.log($('#receive-id').val()+"================");
    var to = $('#receive-id').val();
    
    $.ajax({
        url: "/message_send_to",
        type: "POST",
		contentType: 'application/json',
        dataType: 'json',
		
        data: JSON.stringify( {
            m_receive: to,
            m_content: content,
        }),
        success: function (e) {
            console.log("전송 성공");
            Swal.fire({
                icon: 'success',
                title: '전송되었습니다',
                showConfirmButton: false,
                timer: 1000
            });
        setTimeout(()=> $('#sendMsgModal').modal('hide'), 1100);
            
			
        },
        error: function () {
            alert("전송실패");
        },
    });
}


$(document).on("click", ".btn_report_submit", function () {
	var content = $('#report-text').val();
    console.log("-----------"+ content);
	send_report(content);
    
});

function send_report(content){
    console.log($('#report-id').html()+"================");
    var to = $('#report-id').html();
    //이거 ajax 작성해야함
    $.ajax({
        url: "/report",
        type: "POST",
		contentType: 'application/json',
        dataType: 'json',
		
        data: JSON.stringify( {
            reported: to,
            report_reason: content,
        }),
        success: function (e) {
            console.log("신고 성공");
            console.log(e);
			Swal.fire({
                icon: 'success',
                title: '신고되었습니다',
                showConfirmButton: false,
                timer: 1000
            });
        setTimeout(()=> $('#reportModal').modal('hide'), 1100);
            
        },
        error: function () {
            alert("신고실패");
        },
    });
}



$(document).on('click', "#tableView tr", function(){
	console.log("테이블 행 클릭-----");
    b_no = $(this).find("td:eq(0)").find("div:eq(0)").text();
	console.log(b_no);
    cat_no = $(this).find("td:eq(0)").find("div:eq(1)").text();
	console.log(cat_no);

    var link;

    switch(cat_no){
        case '1': link = "/community/"+b_no; break;
        case '2': link = "/qna/"+b_no; break;
        case '3': link = "/meeting/"+b_no; break;
        case '4': link = "/market/"+b_no; break;
        case '5': link = "/lecture/"+b_no; break;
    }
    console.log("======================");
    console.log(link);

    location.href=link;
});
