package kr.co.hit.dto;

import java.sql.Timestamp;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MessageDto {
	private int m_no, m_watch;
	private String m_send, m_receive, m_content;
	private Timestamp m_date;
}
