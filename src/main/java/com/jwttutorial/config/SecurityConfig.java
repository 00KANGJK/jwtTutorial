package com.jwttutorial.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity

//extens WebSecurityConfigurerAdapter를 사용할 수 도 있는데 해당 기능은 Spring Security 5.0 이후로 Deprecated 되었습니다.
//그래서 AbstractHttpConfigurer를 사용하여 설정합니다.
public class SecurityConfig {

  @Bean
  public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
    http
      .csrf(AbstractHttpConfigurer::disable) // CSRF 비활성화 (JWT를 사용할 때 권장)
      .authorizeHttpRequests(auth -> auth
        .requestMatchers("/api/public/**").permitAll() // 공개 엔드포인트
        .anyRequest().authenticated() // 그 외는 인증 필요
      )
      .httpBasic(AbstractHttpConfigurer::disable) // Basic 인증 비활성화
      .formLogin(AbstractHttpConfigurer::disable); // Form Login 비활성화
    return http.build();
  }

  @Bean
  public WebSecurityCustomizer webSecurityCustomizer() { //H2 콘솔 접근하기 편하도록 설정.
    return (web) -> web.ignoring()
      .requestMatchers("/h2-console/**", "/favicon.ico"); // 보안 필터 완전히 제외
  }

}
