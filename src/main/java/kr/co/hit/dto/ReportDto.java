package kr.co.hit.dto;

import lombok.Data;

@Data
public class ReportDto {
	private int report_no, member_no, report_member, b_no;
	private String report_reason;
}
