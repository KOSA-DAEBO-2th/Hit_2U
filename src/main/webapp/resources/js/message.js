/**
 * Message
 */

function m_list() {
    $(".main_area").load("message_list");
}

function m_write() {
    $(".main_area").load("message_write");
}

function m_sendList() {
    $(".main_area").load("message_slist");
}

/*
function selectAll(selectAll){
	const checkboxes = document.querySelectorAll('input[type="checkbox"]');
	checkboxes.forEach((checkbox)=> {
		checkbox.checked = selectAll.checked
	})
}
*/

$(document).ready(function () {
    $("#cbx_chkAll").click(function () {
        console.log("clicked");
        if ($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
        else $("input[name=chk]").prop("checked", false);
    });

    $("input[name=chk]").click(function () {
        var total = $("input[name=chk]").length;
        var checked = $("input[name=chk]:checked").length;

        if (total != checked) $("#cbx_chkAll").prop("checked", false);
        else $("#cbx_chkAll").prop("checked", true);
    });
});

function m_send() {
    console.log("clicked");
    var m_receive = document.getElementById("m_receive").value;
    console.log(m_receive);
    var m_content = document.getElementById("m_content").value;
    console.log(m_content);
    var message = { m_receive: m_receive, m_content: m_content };
    console.log(message);

    $.ajax({
        type: "POST",
        url: "message_send",
        contentType: "application/json",
        data: JSON.stringify(message),
        success: function (data) {
            console.log("success");
            //location.href = "message_list";
            m_list();
        },
    });

}

function del() {

	Swal.fire({
		title: '삭제하시겠습니까?',
		text: '선택한 쪽지가 삭제됩니다.',
		icon: 'warning',
		
		showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		confirmButtonText: '삭제', // confirm 버튼 텍스트 지정
		cancelButtonText: '취소', // cancel 버튼 텍스트 지정
		
		reverseButtons: true, // 버튼 순서 거꾸로
		
	}).then(result => {
	// 만약 Promise리턴을 받으면,
	if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
		var checkArr = new Array();
		var m_no={};
		$("input[class='chk']:checked").each(function(){
			//m_no = {"m_no": $(this).val()};
			//checkArr.push(m_no);
			checkArr.push($(this).val());
		});
		console.log(checkArr);
		$.ajax({
		type: "POST",
		url: "message_del",
		contentType: 'application/json',
		data: JSON.stringify(checkArr),
		success: function(data){
			console.log("delete success");
			//location.href = "message_list";
			console.log(data);
			m_list();

			}
		});  

		Swal.fire('삭제가 완료되었습니다.',  'success');
	}
	});








	// //alert("삭제하시겠습니까?");
	// var confirm_val = confirm("삭제하시겠습니까?");
	
	// if(confirm_val) {
	// 	var checkArr = new Array();
	// 	var m_no={};
	// 	$("input[class='chk']:checked").each(function(){
	// 		//m_no = {"m_no": $(this).val()};
	// 		//checkArr.push(m_no);
	// 		checkArr.push($(this).val());
	// 	});
	// 	console.log(checkArr);
	// 	$.ajax({
	// 	type: "POST",
	// 	url: "message_del",
	// 	contentType: 'application/json',
	// 	data: JSON.stringify(checkArr),
	// 	success: function(data){
	// 		console.log("delete success");
	// 		//location.href = "message_list";
	// 		console.log(data);
	// 		m_list();

	// 		}
	// 	});  
	// }
}


