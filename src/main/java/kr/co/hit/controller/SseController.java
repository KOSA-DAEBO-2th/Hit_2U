package kr.co.hit.controller;

import java.io.IOException;
import java.io.Writer;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter.SseEventBuilder;

@RestController
@RequestMapping("/sse")
public class SseController {
	
	//SSE Test
//	@GetMapping
//	public void sse(final HttpServletResponse response) throws IOException, InterruptedException {
//		response.setContentType("text/event-stream");
//		response.setCharacterEncoding("UTF-8");
//		
//		Writer writer = response.getWriter();
//		
//		for(int i=0; i<20; i++) {
//			writer.write("data: "+ System.currentTimeMillis() + "\n\n");
//			writer.flush();
//			Thread.sleep(1000);
//		}
//		writer.close();
//	}
	@GetMapping
	public SseEmitter streamSseMvc() {
	    SseEmitter emitter = new SseEmitter();
	    ExecutorService sseMvcExecutor = Executors.newSingleThreadExecutor();
	    sseMvcExecutor.execute(() -> {
	        try {
	            for (int i = 0; i < 20; i++) {
	                SseEventBuilder event = SseEmitter.event()
	                        .data(System.currentTimeMillis());
	                emitter.send(event);
	                Thread.sleep(1000);
	            }
	        } catch (Exception ex) {
	            emitter.completeWithError(ex);
	            ex.printStackTrace();
	        }
	    });
	    return emitter;
	}

}
