package kr.co.hit.chat;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.mysql.cj.log.Log;

import kr.co.hit.security.User;

@Controller
@ServerEndpoint(value = "/socket")
public class SocketController {
private static final List<Session> sessionList = new ArrayList<Session>();
	
	public SocketController(){
		System.out.println("create socket");
	}
	
	@GetMapping
	public String viewPage(){
//		return "socketTest";
		return "chatting";
	}
	
	
	@OnOpen  // socket 연결 시
	public void onOpen(Session session){
		System.out.println("open session : " + session.getId());
//		User user =  (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//sessionMap.put(user.getNickname(), session);
		try{
			final Basic basic = session.getBasicRemote();
			basic.sendText("연결 완료");
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		sessionList.add(session);
	}
	
	
	
	@OnMessage
	public void onMessage (String message, Session session){
		try {
			//메세지 보낸 사람에게 표시됨
			final Basic basic = session.getBasicRemote();
			//basic.sendText(message);
			
			//System.out.println("principal : " + session.getUserPrincipal());
			//System.out.println(session.getUserPrincipal().getClass().getn);
			//Map<String, Object> map = session.getUserProperties();
			//System.out.println(map.get("User"));
			
			System.out.println("session=="+session);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		// 다른 사람에게 메세지 보내기
		sendAllSessionToMessage(session,message);         //   ,session.getUserPrincipal().getName()
	}
	
	@OnError
	public void onError(Throwable e, Session session){
		System.out.println(e.getMessage() + "by session : " + session.getId());
	}
	@OnClose
	public void onClose(Session session){
		System.out.println("Session : "+ session.getId() + " closed");
		sessionList.remove(session);
	}
	
	
	private void sendAllSessionToMessage(Session self, String msg){ // 연결된 모든 사용자에게 메세지 전달
		try {
			System.out.println("sessionList:::"+SocketController.sessionList);
			System.out.println("self: "+self);
			for(Session s : SocketController.sessionList){
				if(!self.getId().equals(s.getId())){ 
					s.getBasicRemote().sendText(msg);
//					s.getBasicRemote().sendText(msg+ ","+nick);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	
}
