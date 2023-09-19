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



function search(){
	var search_key = $('.searchKey').val();
	console.log(search_key);
	var cat = $("#searchCat option:selected").val();
	console.log(cat);
	var send = {search_key:search_key, cat:cat}

	$.ajax({
		type: "POST",
		url: "/adminSearch",
		contentType: 'application/json',
		data: JSON.stringify(send),
		dataType: 'json',
		success: function(data){
			console.log("search success");
			//location.href = "message_list";

			if(cat=="1"){
				console.log(data);
			console.log(data[0].b_title);
			$('.tableResult').empty();
			var tableH = '<tr><th style="width:5%"></th>';
			tableH += '<th style="width:20%">게시판</th><th style="width:55%">제목</th><th style="width:20%">작성날짜</th></tr>';
            //tableH += '<th style="width:15%">  <button onclick="del()" value="1">s</button>  </th></tr>';
			$('.tableHead').empty();
			$('.tableHead').append(tableH);
            if(data==null) $('.tableResult').html('찾으시는 검색어를 포함한 게시글이 없습니다. ');
			
			for(var i in data){
				console.log(data[i]);
				str = '<tr class="align-middle"><td><div class="d-flex align-items-center">';
				str += '<input type="checkbox" class="chk" name="chk" value="'+data[i].b_no+'"></div></td>';
				str += '<td>'+data[i].cat_name+'</td>';
				str += '<td>'+data[i].b_title+'</td>';
				//str += '<td>'+data[i].nickname+'</td>';
				//<fmt:formatDate value="${ list.m_date }" pattern="yy-MM-dd [HH:mm]" type="date"/>
				str += '<td>'+data[i].b_write_date+'</td>';
				$('.tableResult').append(str);
			}
			}
			else{
				console.log("member----------");
				console.log(data);
				console.log(data[0].nickname);
			$('.tableResult').empty();
			var tableH = '<tr><th><input type="checkbox"  id="cbx_chkAll" ></th>';
			tableH += '<th>ID</th><th>닉네임</th><th>권한</th></tr>';
			$('.tableHead').empty();
			$('.tableHead').append(tableH);
			for(var i in data){
				console.log(data[i]);
				str = '<tr class="align-middle"><td><div class="d-flex align-items-center">';
				str += '<input type="checkbox" class="chk" name="chk" value="'+data[i].member_no+'"></div></td>';
				str += '<td>'+data[i].member_id+'</td>';
				str += '<td>'+data[i].nickname+'</td>';
				str += '<td>'+data[i].authority+'</td>';
				$('.tableResult').append(str);
			}
			}
			
			

			}
	});
	
}

function del() {
	//alert("삭제하시겠습니까?");
	var confirm_val = confirm("삭제하시겠습니까?");
	
	if(confirm_val) {
		var checkArr = new Array();
		var m_no={};
        /*
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
        */
	}
}
