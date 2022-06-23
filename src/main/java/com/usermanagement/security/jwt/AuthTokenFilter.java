package com.usermanagement.security.jwt;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import com.usermanagement.security.service.UserDetailsServiceImpl;

@Component
public class AuthTokenFilter extends OncePerRequestFilter {

	@Autowired
	private JwtUtils jwtUtils;

	@Autowired
	private UserDetailsServiceImpl userDetailsServiceImpl;

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
	   
		final String authorizationHeader = request.getHeader("Authorization");
		String uName = request.getHeader("username");
		logger.debug("userName from header is :" + uName);
		String userName = null;
		String jwtToken = null;
		if (null != authorizationHeader && authorizationHeader.startsWith("Bearer ")) {
			jwtToken = authorizationHeader.substring(7);
			userName = jwtUtils.getUsernameFromToken(jwtToken);
		}
		if (null != userName && null == SecurityContextHolder.getContext().getAuthentication()) {
			UserDetails userDetails = this.userDetailsServiceImpl.loadUserByUsername(userName);
			if (jwtUtils.validateToken(jwtToken, userDetails)) {
				logger.debug("token validated successfully.");
				UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(
						userDetails, null, userDetails.getAuthorities());
				usernamePasswordAuthenticationToken
						.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
				SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
			} else {
				logger.debug("token validation fail.");
			}
		}
		filterChain.doFilter(request, response);
	}

}
