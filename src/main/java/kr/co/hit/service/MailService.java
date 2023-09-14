package kr.co.hit.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import kr.co.hit.dao.MailServiceInterface;

@Service
public class MailService implements MailServiceInterface {
	
	@Autowired
	JavaMailSender mailSender;
	
	private String ePw;  //사용자가 메일로 받을 인증번호

	@Override   //메일 내용 작성
	public MimeMessage createMessage(String to) throws MessagingException, UnsupportedEncodingException {
		System.out.println("메일받을 사용자" + to);
        System.out.println("인증번호" + ePw);

        MimeMessage message = mailSender.createMimeMessage();

        message.addRecipients(RecipientType.TO, to); // 메일 받을 사용자
        message.setSubject("[HIT] 회원가입을 위한 이메일 인증코드 입니다"); // 이메일 제목

        String msgg = "";
        // msgg += "<img src=../resources/static/image/emailheader.jpg />"; // header image
        msgg += "<h1>안녕하세요</h1>";
        msgg += "<h1>개발자 커뮤니티 HIT 입니다</h1>";
        msgg += "<br>";
        msgg += "<p>아래 인증코드를 회원가입 페이지에 입력해주세요</p>";
        msgg += "<br>";
        msgg += "<br>";
        msgg += "<div align='center' style='border:1px solid black'>";
        msgg += "<h3 style='color:blue'>회원가입 인증코드 입니다</h3>";
        msgg += "<div style='font-size:130%'>";
        msgg += "<strong>" + ePw + "</strong></div><br/>" ; // 메일에 인증번호 ePw 넣기
        msgg += "</div>";
        // msgg += "<img src=../resources/static/image/emailfooter.jpg />"; // footer image

        message.setText(msgg, "utf-8", "html"); // 메일 내용, charset타입, subtype
        // 보내는 사람의 이메일 주소, 보내는 사람 이름
        message.setFrom(new InternetAddress("connectwo22@naver.com", "HIT_Admin"));
        System.out.println("********creatMessage 함수에서 생성된 msgg 메시지********" + msgg);
        
        System.out.println("********creatMessage 함수에서 생성된 리턴 메시지********" + message);


        return message;
	}

	@Override    //랜덤키 생성
	public String createKey() {
		int leftLimit = 48; // numeral '0'
        int rightLimit = 122; // letter 'z'
        int targetStringLength = 10;
        Random random = new Random();
        String key = random.ints(leftLimit, rightLimit + 1)
                                       .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
                                       .limit(targetStringLength)
                                       .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
                                       .toString();
        System.out.println("생성된 랜덤 인증코드"+ key);
        return key;
	}

	@Override    //메일발송
	public String sendSimpleMessage(String to) throws Exception {
		ePw = createKey(); // 랜덤 인증코드 생성
        System.out.println("********생성된 랜덤 인증코드******** => " + ePw);

        MimeMessage message = createMessage(to); // "to" 로 메일 발송

        System.out.println("********생성된 메시지******** => " + message);


        try { // 예외처리
            mailSender.send(message);
        } catch (Exception e) {
            e.printStackTrace();
            throw new IllegalArgumentException();
        }

        return ePw; // 메일로 사용자에게 보낸 인증코드를 서버로 반환! 인증코드 일치여부를 확인하기 위함 
    
	}

}
