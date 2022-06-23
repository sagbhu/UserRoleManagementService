package com.usermanagement.payload.request;

import java.util.List;

import com.usermanagement.model.Role;

public class UserRoleRequest {

	private String userId;
	private List<Role> roles;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

}
