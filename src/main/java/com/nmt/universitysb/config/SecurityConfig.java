package com.nmt.universitysb.config;

import com.nmt.universitysb.security.JwtAuthenticationEntryPoint;
import com.nmt.universitysb.security.JwtAuthenticationFilter;
import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.enums.SecuritySchemeType;
import io.swagger.v3.oas.annotations.info.Info;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.security.SecurityScheme;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import java.io.IOException;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
@OpenAPIDefinition(
        info = @Info(title = "University API", version = "v1"),
        security = {
                @SecurityRequirement(name = "jwt")
        }
)
@SecurityScheme(
        name = "jwt",
        type = SecuritySchemeType.HTTP,
        scheme = "bearer",
        bearerFormat = "JWT"
)
public class SecurityConfig{

    private final JwtAuthenticationEntryPoint authenticationEntryPoint;
    private final JwtAuthenticationFilter authenticationFilter;

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception {
        return configuration.getAuthenticationManager();
    }
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
            http.cors().and().csrf().disable()
                    .authorizeHttpRequests(authorize ->
                            authorize
                                    .requestMatchers("/swagger-ui/**").permitAll()
                                    .requestMatchers("/v3/api-docs/**").permitAll()
                                    .requestMatchers("/").permitAll()
                                    .requestMatchers("/login").permitAll()
                                    .requestMatchers("/api/login/").permitAll()
                                    .requestMatchers("/api/users/").permitAll()
                                    .requestMatchers("/api/firebase/config").permitAll()
                                    .requestMatchers(HttpMethod.GET, "/api/**").hasAnyRole("GIAOVU", "GIANGVIEN", "SINHVIEN")
                                    .requestMatchers(HttpMethod.POST, "/api/**").hasAnyRole("GIAOVU", "GIANGVIEN", "SINHVIEN")
//                                    .requestMatchers(HttpMethod.DELETE, "/api/**").hasAnyRole("GIAOVU")
                                    .requestMatchers(HttpMethod.DELETE, "/api/comments/{commentId}").permitAll()
                                    .requestMatchers(HttpMethod.DELETE, "/api/posts-delete/{commentId}").permitAll()
                                    .anyRequest().authenticated()
                    )
                    .formLogin(form -> form
                            .loginPage("/login").successHandler(new AuthenticationSuccessHandler() {
                                @Override
                                public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
                                    response.sendRedirect(request.getContextPath());
                                }
                            })
                            .permitAll()
                    )
                    .logout(logout -> logout
                            .permitAll()
                    );

            http.addFilterBefore(authenticationFilter, UsernamePasswordAuthenticationFilter.class);
            http.exceptionHandling().authenticationEntryPoint(authenticationEntryPoint);

            return http.build();
    }
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
