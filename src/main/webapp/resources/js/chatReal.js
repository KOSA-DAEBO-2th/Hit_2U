/**
 * ui 넣은 chat
 */

// $(function(){
// 		var ws = new WebSocket("ws://localhost:8080/socket");
		
// 		ws.onopen = function(e){ // 연결 시 실행
// 			console.log("info : connection opened.");
//             $(".chat ul.messages").append("입장하였습니다");
// 		}
		
// 		ws.onmessage = function(e){ // 서버로부터 메세지를 받았을 때 실행
//             console.log("=================================================");
//             console.log(e);
// 			console.log(e.data); //전달 받은 메세지 = e
//             //console.log(nickname);
//             //console.log(e.timeStamp);
//             var get = e.data;
            
//             //const date = messageInfo.date;
//             // const d = new Date(date);
//             // const time = String(d.getHours()).padStart(2, "0") 
// 			// 	+ ":" 
// 			// 	+ String(d.getMinutes()).padStart(2, "0");

//             //var currentDate = new Date(e.timeStamp);

//             // timestamp를 yyyy-MM-dd HH:mm:ss 로 출력
//             // var currentFormatDate = dateFormat(currentDate);
//             // console.log(currentFormatDate);
//             // 결과 : 2023-02-03 13:21:36


//             // const chatHtml = `
//             //     <li>
//             //         <div class="sender">
//             //             <div>
//             //                 <div class="nickname">닉네임</div>
//             //                 <div class="message">
//             //                     <span class=chat_in_time>날짜</span>
//             //                     <span class="chat_content" style="background:yellow;">${e.data}</span>
//             //                 <span>
//             //             </div>
//             //         </div>
//             //     </li>`;
	
//             // $(".chat ul.messages").append(chatHtml);
                
//             //$(".chat ul").scrollTop($(".chat ul")[0].scrollHeight);


            
//             sendMessage(get);

//             //var msg = e.data;
//             // if(msg != null && msg.trim() != ''){
//             //     var d = JSON.parse(msg);

//             //     //socket 연결시 sessionID셋팅
//             //     if(d.type == "message"){
//             //         if(d.session){
//             //             $(".chat ul.chat_list").append("<p class='me'>"+d.msg+"</p>");
//             //         }else {
//             //             $(".chat ul.chat_list").append("<p class='others'>"+d.userName+"</p>");
//             //         }
//             //     }
//             //     else if(d.type == "open"){
//             //         if(d.sessionId == ) //================================
//             //     }
//             // }

//         }
		
// 		ws.onclose = function(e){ // 연결 종료 시 실행
// 			console.log("info : connection closed");
// 		};
		
// 		ws.onerror = function(e){
// 			console.log("error")
// 		};
		
		
// 		// $("#btn").on("click",function(e){
// 		// 	e.preventDefault();
// 		// 	ws.send($("#testInput").val());
// 		// });

//         ///////////////////////////////////////////////////////////
//         // $("#sendBtn").on("click",function(e){
// 		// 	e.preventDefault();
            
//         //     console.log($("#textInput").val());
// 		// 	ws.send($("#textInput").val());

            

//         // //     var obj = {
//         // //         type: "message",
//         // //         userName : nickname,
//         // //         msg : $("#textInput").val()
//         // //     }
//         // //     console.log("obj-------------------------------");
//         // //     console.log(obj);
//         // //     ws.send(JSON.stringify(obj));
//         // //     $("textInput").val("");
// 		// });
// ///////////////////////////////////////////////////////////////////////

//         $(".sendBtn").on("click",function(e){
//         //$('.sendBtn').click(function (e) {
//             //e.preventDefault();
//             ws.send($("#textInput").val());
//             //return sendMessage(getMessageText());
//         });
//         $('.message_input').keyup(function (e) {
//             if (e.which === 13) {
//                 //e.preventDefault();
//                 ws.send($("#textInput").val());
//                 //return sendMessage(getMessageText());
//             }
//         });


		
		
		
// 	});












    (function () {
    var Message;
    Message = function (arg) {
        this.text = arg.text, this.message_side = arg.message_side;
        this.draw = function (_this) {
            return function () {
                var $message;
                $message = $($('.message_template').clone().html());
                $message.addClass(_this.message_side).find('.text').html(_this.text);
                $('.messages').append($message);
                return setTimeout(function () {
                    return $message.addClass('appeared');
                }, 0);
            };
        }(this);
        return this;
    };
    $(function () {
        var getMessageText, message_side, sendMessage;
        message_side = 'right';

        getMessageText = function () {
            var $message_input;
            $message_input = $('.message_input');
            return $message_input.val();
        };

        sendMessage = function (text, message_side) {
            var $messages, message;
            if (text.trim() === '') {
                return;
            }
            $('.message_input').val('');
            $messages = $('.messages');
            message_side = message_side === 'left' ? 'right' : 'left';
            message = new Message({
                text: text,
                message_side: message_side
            });
            message.draw();
            return $messages.animate({ scrollTop: $messages.prop('scrollHeight') }, 300);
        };

        // $('.send_message').click(function (e) {
        //     return sendMessage(getMessageText());
        // });
        // $('.message_input').keyup(function (e) {
        //     if (e.which === 13) {
        //         return sendMessage(getMessageText());
        //     }
        // });


        var ws = new WebSocket("ws://localhost:8080/socket");
		
		ws.onopen = function(e){ // 연결 시 실행
			console.log("info : connection opened.");
            $(".chat ul.messages").append("입장하였습니다");
		}

        ws.onmessage = function(e){ // 서버로부터 메세지를 받았을 때 실행
            console.log("=================================================");
            console.log(e);
			console.log(e.data); //전달 받은 메세지 = e
            //console.log(nickname);
            //console.log(e.timeStamp);
            var get = e.data;
            
            if(get=="연결 완료"){

            } else{
                sendMessage(get, left);
            }
            



        }
		
		ws.onclose = function(e){ // 연결 종료 시 실행
			console.log("info : connection closed");
		};
		
		ws.onerror = function(e){
			console.log("error")
		};


        $(".sendBtn").on("click",function(e){
        //$('.sendBtn').click(function (e) {
            e.preventDefault();
            ws.send($("#textInput").val());
            //return sendMessage(getMessageText());
        });
        $('.message_input').keyup(function (e) {
            if (e.which === 13) {
                e.preventDefault();
                ws.send($("#textInput").val());
                //return sendMessage(getMessageText());
            }
        });







    });
}.call(this)); 