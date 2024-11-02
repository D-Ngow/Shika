package com.web.Config;

import java.util.Arrays;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

@Configuration
public class SecurityConfig {

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity filter) throws Exception {

		filter
		.csrf().disable()
		.cors()
		.and()
		.authorizeHttpRequests(req -> { req
			.requestMatchers("/manager/**").hasAuthority("admin")
			.requestMatchers("/profile","/cart", "/addToCart", "/order", "/order/**","/manager","/manager/**").authenticated()
			.anyRequest().permitAll()
			;
		})
		.formLogin(req -> {req
			.loginPage("/signin")
			.defaultSuccessUrl("/home")
			.permitAll()
			;
		})
		.logout(req ->{req
			.logoutUrl("/logout")
			.permitAll()
			;
		})
		;
		return filter.build();
	}

	@Bean
	public BCryptPasswordEncoder getPasswordEncoder()
	{
		return new BCryptPasswordEncoder();
	}

	@Bean
    public CorsConfigurationSource corsConfigurationSource()
    {
        System.out.println("CorsConfigurationSource");
        CorsConfiguration cors = new CorsConfiguration();
        cors.setAllowedOrigins(Arrays.asList("http://localhost:8082/"));
        cors.setAllowedMethods(Arrays.asList("GET", "POST", "DELETE", "PUT"));
        cors.setAllowedHeaders(Arrays.asList("content-type", "authorization"));
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", cors);
        return source;
    }

}