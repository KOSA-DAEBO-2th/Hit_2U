$(document).ready(function () {
	$('searchCat').change(function(){
		var cat = $('#searchCat option:selected').val();
		if(cat == '1'){
			console.log("게시글");
			$('.boardDiv').show();
			search();
		} else if(cat == '2') {
			console.log("회원");
			$('.memberDiv').show();
			search();
		} else {
			$('.reportDiv').show();
		}

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
            if(data.length==0) $('.tableResult').html('<td colspan="4" style="text-align:center">찾으시는 검색어를 포함한 검색결과가 없습니다. </td>');
			else{
                
            
                if(cat=="1"){
                    console.log(data);
                console.log(data[0].b_title);
                $('.tableResult').empty();
                var tableH = '<tr><th style="width:5%"></th>';
                tableH += '<th style="width:20%">게시판</th><th style="width:55%">제목</th><th style="width:20%">작성날짜</th></tr>';
                //tableH += '<th style="width:15%">  <button onclick="del()" value="1">s</button>  </th></tr>';
                $('.tableHead').empty();
                $('.tableHead').append(tableH);
                
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
                    var tableH = '<tr><th style="width:5%"></th>';
                    tableH += '<th style="width:30%">ID</th style="width:35%"><th>닉네임</th><th style="width:30%">권한</th></tr>';
                    $('.tableHead').empty();
                    $('.tableHead').append(tableH);
                    for(var i in data){
                        console.log(data[i]);
                        str = '<tr class="align-middle" data-bs-toggle="modal" data-bs-target="#staticBackdrop" data-bs-param="'+data[i].member_no+'" ><td>  '+ data[i].member_no +'</td>';                   // <div class="d-flex align-items-center">';
                        //str += '<input type="checkbox" class="chk" name="chk" value="'+data[i].member_no+'"></div></td>';
                        str += '<td>'+data[i].member_id+'</td>';
                        str += '<td>'+data[i].nickname+'</td>';
                        str += '<td>'+data[i].authority+'</td>';
                        $('.tableResult').append(str);
                    }
                }
			
			}

			}
	});
	
}

function del() {
	// var cat = $("#searchCat option:selected").val();
	// console.log(cat);

	Swal.fire({
		title: '삭제하시겠습니까?',
		text: '선택한 정보가 삭제됩니다.',
		icon: 'warning',
		
		showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		confirmButtonText: '삭제', // confirm 버튼 텍스트 지정
		cancelButtonText: '취소', // cancel 버튼 텍스트 지정
		
		//reverseButtons: true, // 버튼 순서 거꾸로
		
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
        checkArr.push($("#searchCat option:selected").val());
		console.log(checkArr);
		$.ajax({
		type: "POST",
		url: "admin_del",
		contentType: 'application/json',
		data: JSON.stringify(checkArr),
		success: function(){
			console.log("delete success");
			//location.href = "message_list";
			
			search();

			}
		});  

		Swal.fire('삭제가 완료되었습니다.',  'success');
	}
	});


}

function changeCat(){
	var cat = $('#searchCat option:selected').val();
		if(cat == '1'){
			//console.log("게시글");
			$('.divTitle').text("게시글");
			//$('.listDiv').show();
			search();
		} else if(cat == '2') {
			//console.log("회원");
			$('.divTitle').text("회원");
			//$('.listDiv').show();
			search();
		} else {
			//$('.listDiv').hide();
			//$('.reportDiv').show();
			$('.divTitle').text("신고 목록");
			reportList();
			
		}




}

function reportList(){
	$.ajax({
		type: "GET",
		url: "/reportList",
		contentType: 'application/json',
		dataType: 'json',
		success: function(data){
			console.log("reportList success");
	

			console.log(data);
			console.log(data[0].b_title);
			$('.tableResult').empty();
			var tableH = '<tr class="roww"><th style="width:5%"></th>';
			tableH += '<th style="width:20%">신고자</th><th style="width:20%">피신고자</th><th style="width:55%">신고 내용</th></tr>';
			//tableH += '<th style="width:15%">  <button onclick="del()" value="1">s</button>  </th></tr>';
			$('.tableHead').empty();
			$('.tableHead').append(tableH);
			
			for(var i in data){
				console.log(data[i]);
				str = '<tr class="align-middle"><td><div class="d-flex align-items-center">';
				str += '<input type="checkbox" class="chk" name="chk" value="'+data[i].b_no+'"></div></td>';
				str += '<td>'+data[i].reporter+'</td>';
				str += '<td>'+data[i].reported+'</td>';
				//str += '<td>'+data[i].nickname+'</td>';
				//<fmt:formatDate value="${ list.m_date }" pattern="yy-MM-dd [HH:mm]" type="date"/>
				str += '<td>'+data[i].report_reason+'</td>';
				$('.tableResult').append(str);
			}
	
	


		}
	});
}

var num;
$(document).on('click', "#printTable tr", function(){
	console.log("테이블 행 클릭-----");
	// var num = $(this).find("td:eq(0)").val();
	//var num = $(this).find("td:eq(0)").attr('value');
	num = $(this).find("td:eq(0)").text().trim();
	console.log(num);
});


$(document).on("click", ".btn_change_submit", function () {
	var param = $(this).attr("data-bs-param");
	var role = $("#role_change option:selected").val();
	console.log(role);
	console.log("num: "+ num);
    authority_change(role, num);
});


// var role = $("#role_change option:selected").val();
// 	console.log(role);

function authority_change(role, num) {
	console.log("role: "+role);
	console.log("no: "+num);
    $.ajax({
        url: "/roleChange",
        type: "POST",
		contentType: 'application/json',
        dataType: 'json',
		
        data: JSON.stringify( {
            authority: role,
            member_no: num,
        }),
        success: function () {
            console.log("업데이트 성공");
			//alert("변경이 완료되었습니다");
			Swal.fire({
				customClass: { container: 'my-swal' },
				//position: 'top-end',
				icon: 'success',
				title: 'Your work has been saved',
				showConfirmButton: false,
				timer: 1000
			});
			setTimeout(()=> $('#staticBackdrop').modal('hide'), 1100);
			// $('#staticBackdrop').modal('hide');
			
        },
        error: function () {
            alert("뭔가 오류있네");
        },
    });
}
