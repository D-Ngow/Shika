package com.web.Config;

import java.io.IOException;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CustomAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
        // Lấy role người dùng
        String role = authentication.getAuthorities()
                                    .iterator()
                                    .next()
                                    .getAuthority();
        request.getSession().setAttribute("userrole", role);

        // Sử dụng logic mặc định của SavedRequestAwareAuthenticationSuccessHandler
        super.onAuthenticationSuccess(request, response, authentication);
    }
}
