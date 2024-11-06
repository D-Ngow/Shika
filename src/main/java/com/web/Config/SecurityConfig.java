package com.web.Config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import static org.springframework.security.config.Customizer.withDefaults;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import com.web.Security.AccountDetail;


@Configuration
@EnableWebSecurity
@EnableMethodSecurity(prePostEnabled = true)
public class SecurityConfig {
    @Autowired
    AccountDetail accountdetail;
    
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity filter) throws Exception {
        filter.csrf(csrf -> csrf.disable())
              .cors(withDefaults())
              .authorizeHttpRequests(req -> {
                  req.requestMatchers("/manager/**").hasAuthority("admin")
                     .requestMatchers("/profile", "/cart", "/addToCart", "/order", "/order/**", "/manager", "/manager/**").authenticated()
                     .anyRequest().permitAll();
              })
              .formLogin(req -> {
                  req.loginProcessingUrl("/j_spring_security_check")
                     .loginPage("/signin").defaultSuccessUrl("/home").permitAll().failureUrl("/signin?success=fail").failureHandler((request, response, exception) -> {
                    	 System.out.println(exception);
                     });
              })
              .logout(req -> {
                  req.logoutUrl("/logout").permitAll()
                  .logoutSuccessUrl("/home");
              });
        return filter.build();
    }
    
    @Bean
    public AuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(accountdetail);
        authProvider.setPasswordEncoder(new BCryptPasswordEncoder()); // nếu bạn dùng mã hóa mật khẩu
        return authProvider;
    }

    @Bean
    public BCryptPasswordEncoder getPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
//        auth.userDetailsService(accountdetail).passwordEncoder(getPasswordEncoder());
    	auth.authenticationProvider(authenticationProvider());
    }


//    @Bean
//    public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception {
//        return configuration.getAuthenticationManager();
//    }

//    @Bean
//    public CorsConfigurationSource corsConfigurationSource() {
//        System.out.println("CorsConfigurationSource");
//        CorsConfiguration cors = new CorsConfiguration();
//        cors.setAllowedOrigins(Arrays.asList("http://localhost:8082/"));
//        cors.setAllowedMethods(Arrays.asList("GET", "POST", "DELETE", "PUT"));
//        cors.setAllowedHeaders(Arrays.asList("content-type", "authorization"));
//        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
//        source.registerCorsConfiguration("/**", cors);
//        return source;
//    }
}
