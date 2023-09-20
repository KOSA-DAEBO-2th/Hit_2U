package kr.co.hit.dto;

import org.apache.commons.lang3.StringUtils;

import com.github.scribejava.core.builder.api.DefaultApi20;

import kr.co.hit.security.NaverLoginApi;
import lombok.Data;

@Data
public class NaverLoginDto{
	private String service;
	private String clientId;
	private String clientSecret;
	private String redirectUrl;
	private DefaultApi20 api20Instance;

	private boolean isNaver;
	private boolean isGoogle;

	public NaverLoginDto(String service, String cid, String cs, String rurl) {
		this.service = service;
		this.clientId = cid;
		this.clientSecret = cs;
		this.redirectUrl = rurl;

		this.isNaver = StringUtils.equalsIgnoreCase("naver", this.service);
		this.isGoogle = StringUtils.equalsIgnoreCase("google", this.service);

		this.api20Instance = NaverLoginApi.getInstance();
	}
}
