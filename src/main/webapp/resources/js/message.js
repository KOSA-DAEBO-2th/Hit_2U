/**
 * Message
 */
 
function m_list(){
	$('.main_area').load("message_list");
}

function m_write(){
	$('.main_area').load("message_write");
}

function m_sendList(){
	$('.main_area').load("message_slist");
}

/*
function selectAll(selectAll){
	const checkboxes = document.querySelectorAll('input[type="checkbox"]');
	checkboxes.forEach((checkbox)=> {
		checkbox.checked = selectAll.checked
	})
}
*/

$(document).ready(function() {
	$("#cbx_chkAll").click(function() {
		console.log("clicked");
		if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
		else $("input[name=chk]").prop("checked", false);
	});

	$("input[name=chk]").click(function() {
		var total = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;

		if(total != checked) $("#cbx_chkAll").prop("checked", false);
		else $("#cbx_chkAll").prop("checked", true); 
	});
});



function m_send(){
	console.log("clickedddddd");
	var m_receive = document.getElementById('m_receive').value;
	console.log(m_receive);
	var m_content = document.getElementById('m_content').value;
	console.log(m_content);
	var message = { "m_receive": m_receive, "m_content": m_content}
	console.log(message);

	$.ajax({
		type: "POST",
		url: "message_send",
		contentType: 'application/json',
		data: JSON.stringify(message),
		success: function(data){
			console.log("success");
			//location.href = "message_list";
			m_list();

		}
	});  
}


function del() {
	//alert("삭제하시겠습니까?");
	var confirm_val = confirm("삭제하시겠습니까?");
	
	if(confirm_val) {
		var checkArr = new Array();
		$("input[class='chk']:checked").each(function(){
			checkArr.push($(this).val());
		});
		
		$.ajax({
		type: "POST",
		url: "message_del",
		contentType: 'application/json',
		data: JSON.stringify(message),
		success: function(data){
			console.log("success");
			//location.href = "message_list";
			m_list();

		}
	});
	}
	
	let list = [];
	$(".chk:checked").each(function(idx, item){
	if(idx == 0){
		list.push({"m_no":item});
	} else {
		list += ", "
}

