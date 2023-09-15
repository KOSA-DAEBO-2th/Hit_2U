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
			System.out.println("Admin 확인1");
			response.sendRedirect(request.getContextPath() + "/test/admin");
			System.out.println("Admin 확인2");
			return;
		}
		if (roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect(request.getContextPath() + "/");
			return;
		}
		if (roleNames.contains("ROLE_USER")) {
			System.out.println("User 확인1");
			response.sendRedirect(request.getContextPath() + "/");
			System.out.println("User 확인2");
			return;
		}
		response.sendRedirect("/");
	}
}
