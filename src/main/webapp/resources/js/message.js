/**
 * Message
 */
 
function m_list(){
	$('.main_area').load("message_list");
}

function m_write(){
	$('.main_area').load("message_write");
}


function m_send(){
	var to = document.getElementById('to').value;
	console.log(to);
	var m_content = document.getElementById('message').value;
	console.log(m_content);

	$.ajax({
		type: "POST",
		url: "/message_send",
		data: {'to':to, 'm_content':m_content},
		success: send_message(data)
	});  
}