package com.usermanagement.security.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.usermanagement.model.User;

public class UserDetailsImpl implements UserDetails {

	private static final long serialVersionUID = 1L;

	private String id;

	private String username;

	@JsonIgnore
	private String password;

	private Collection<? extends GrantedAuthority> authorities;

	private Map<String, Object> attributes;

	public UserDetailsImpl(String id, String username, String password,
			Collection<? extends GrantedAuthority> authorities) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.authorities = authorities;
	}

	public static UserDetailsImpl build(User user) {
		List<GrantedAuthority> authorities = user.getRoles().stream()
				.map(role -> new SimpleGrantedAuthority(role.getRoleName())).collect(Collectors.toList());
		return new UserDetailsImpl(user.getUserId(), user.getEmail(), user.getPassword(), authorities);
	}

	public static UserDetailsImpl create(User user, Map<String, Object> attributes) {
		UserDetailsImpl userPrincipal = UserDetailsImpl.build(user);
		userPrincipal.setAttributes(attributes);
		return userPrincipal;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	public String getId() {
		return id;
	}

	@Override
	public String getPassword() {
		return password;
	}

	@Override
	public String getUsername() {
		return username;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;
		UserDetailsImpl user = (UserDetailsImpl) o;
		return Objects.equals(id, user.id);
	}

	public void setAttributes(Map<String, Object> attributes) {
		this.attributes = attributes;
	}

	public Map<String, Object> getAttributes() {
		return attributes;
	}

	
}
