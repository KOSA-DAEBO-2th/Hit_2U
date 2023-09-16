package kr.co.hit.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MessageDto {
	private int m_no, m_watch;
	private String m_send, m_receive, m_content;
	private Date m_date;
}
