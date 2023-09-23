
$(function(){
		var ws = new WebSocket("ws://localhost:8080/socket");
		
		ws.onopen = function(e){ // 연결 시 실행
			console.log("info : connection opened.");
            $(".chat ul.chat_list").append("입장하였습니다");
		}
		
		ws.onmessage = function(e){ // 서버로부터 메세지를 받았을 때 실행
            console.log("=================================================");
            console.log("e: "+e);
			console.log("e.data: "+e.data); //전달 받은 메세지 = e
            //console.log(nickname);
            console.log(e.timeStamp);
            
            //const date = messageInfo.date;
            // const d = new Date(date);
            // const time = String(d.getHours()).padStart(2, "0") 
			// 	+ ":" 
			// 	+ String(d.getMinutes()).padStart(2, "0");

            var currentDate = new Date(e.timeStamp);

            // timestamp를 yyyy-MM-dd HH:mm:ss 로 출력
            var currentFormatDate = dateFormat(currentDate);
            console.log(currentFormatDate);
            // 결과 : 2023-02-03 13:21:36


            const chatHtml = `
                <li>
                    <div class="sender">
                        <div>
                            <div class="nickname">닉네임</div>
                            <div class="message">
                                <span class=chat_in_time>${currentFormatDate}</span>
                                <span class="chat_content" style="background:yellow;">${e.data}</span>
                            <span>
                        </div>
                    </div>
                </li>`;
	
            $(".chat ul.chat_list").append(chatHtml);
                
            $(".chat ul").scrollTop($(".chat ul")[0].scrollHeight);
            

            //var msg = e.data;
            // if(msg != null && msg.trim() != ''){
            //     var d = JSON.parse(msg);

            //     //socket 연결시 sessionID셋팅
            //     if(d.type == "message"){
            //         if(d.session){
            //             $(".chat ul.chat_list").append("<p class='me'>"+d.msg+"</p>");
            //         }else {
            //             $(".chat ul.chat_list").append("<p class='others'>"+d.userName+"</p>");
            //         }
            //     }
            //     else if(d.type == "open"){
            //         if(d.sessionId == ) //================================
            //     }
            // }

        }
		
		ws.onclose = function(e){ // 연결 종료 시 실행
			console.log("info : connection closed");
		};
		
		ws.onerror = function(e){
			console.log("error")
		};
		
		
		// $("#btn").on("click",function(e){
		// 	e.preventDefault();
		// 	ws.send($("#testInput").val());
		// });

        $("#sendBtn").on("click",function(e){
			e.preventDefault();
            console.log($("#textInput").val());
			ws.send($("#textInput").val());

            

            

        //     var obj = {
        //         type: "message",
        //         userName : nickname,
        //         msg : $("#textInput").val()
        //     }
        //     console.log("obj-------------------------------");
        //     console.log(obj);
        //     ws.send(JSON.stringify(obj));
        //     $("textInput").val("");
		});
		
		
		
	});


function dateFormat(date) {
        let month = date.getMonth() + 1;
        let day = date.getDate();
        let hour = date.getHours();
        let minute = date.getMinutes();
        let second = date.getSeconds();

        month = month >= 10 ? month : '0' + month;
        day = day >= 10 ? day : '0' + day;
        hour = hour >= 10 ? hour : '0' + hour;
        minute = minute >= 10 ? minute : '0' + minute;
        second = second >= 10 ? second : '0' + second;

        return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
}


	