package kr.co.hit.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class UserLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		List<String> roleNames = new ArrayList<String>();

		authentication.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});

		if (roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect(request.getContextPath() + "/test/admin");
			return;
		}
		if (roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect(request.getContextPath() + "/");
			return;
		}
		if (roleNames.contains("ROLE_USER")) {
			response.sendRedirect(request.getContextPath() + "/");
			return;
		}
		response.sendRedirect("/");
	}
}
