package com.usermanagement.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.usermanagement.exception.UnauthorizedEntryPoint;
import com.usermanagement.security.jwt.AuthTokenFilter;
import com.usermanagement.security.service.UserDetailsServiceImpl;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	UserDetailsServiceImpl userDetailsService;

	@Autowired
	private AuthTokenFilter authTokenFilter;

	@Autowired
	private UnauthorizedEntryPoint unauthorizedEntryPoint;

	@Override
	public void configure(AuthenticationManagerBuilder authenticationManagerBuilder) throws Exception {
		authenticationManagerBuilder.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	}

	@Override
	@Bean
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return NoOpPasswordEncoder.getInstance();
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.cors().and().csrf().disable().authorizeRequests()
				.antMatchers("/userService/authenticate/**", "/userService/verifyotp", "/userService/createUser",
						"/userService/getUser", "/userService/updatePassword", "/userService/sendForgotPasswordOtp",
						"/userService/verifyForgotPasswordOtp", "/userService/saveAddress", "/userService/getAddress",
						"/userService/updateAddress", "/userService/deleteAddress/{id}", "/userService/saveUserAddress",
						"/userService/user/{id}", "/userService/updateAddress", "/userService/login",
						"/userService/users", "/userService/roles", "/userService/role",
						"/userService/updateUser", "/userService/deleteUser/{id}", "/userService/authenticate/appUser",
						"/userService/role", "/userService/role/{id}",
						"/userService/saveUserRole")
				.permitAll()

				.antMatchers("/**").hasRole("ADMIN").anyRequest().authenticated().and().exceptionHandling()
				.authenticationEntryPoint(unauthorizedEntryPoint).and().sessionManagement()
				.sessionCreationPolicy(SessionCreationPolicy.STATELESS);
		http.addFilterBefore(authTokenFilter, UsernamePasswordAuthenticationFilter.class);
	}

}
