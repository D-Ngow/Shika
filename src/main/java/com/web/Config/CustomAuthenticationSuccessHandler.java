package com.web.Config;

import java.io.IOException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CustomAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	public CustomAuthenticationSuccessHandler() {
        setDefaultTargetUrl("/home");
    }
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// Lấy role người dùng
		String role = authentication.getAuthorities().iterator().next().getAuthority();
		request.getSession().setAttribute("userrole", role);
//		Object principal = authentication.getPrincipal();
//		UserDetails userDetails = (UserDetails) principal;
//		request.getSession().setAttribute("userdt", userDetails);
		super.onAuthenticationSuccess(request, response, authentication);
	}
}
