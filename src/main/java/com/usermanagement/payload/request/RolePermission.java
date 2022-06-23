package com.usermanagement.payload.request;

import java.util.List;

public class RolePermission {

	private List<String> permissions;

	public List<String> getPermissions() {
		return permissions;
	}

	public void setPermissions(List<String> permissions) {
		this.permissions = permissions;
	}

}
