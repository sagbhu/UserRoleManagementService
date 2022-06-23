package com.usermanagement.model;

import java.util.Objects;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.IndexDirection;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

import com.usermanagement.payload.request.RolePermission;

@Document
public class Role {

	@Id
	private String roleId;

	@Indexed(unique = true, direction = IndexDirection.DESCENDING, dropDups = true)
	private String roleName;
	private RolePermission permission;
	private String description;
	private String state;
	private boolean isDeleted;

	/**
	 * @return the roleId
	 */
	public String getRoleId() {
		return roleId;
	}

	/**
	 * @param roleId the roleId to set
	 */
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	/**
	 * @return the roleName
	 */
	public String getRoleName() {
		return roleName;
	}

	/**
	 * @param roleName the roleName to set
	 */
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public RolePermission getPermission() {
		return permission;
	}

	public void setPermission(RolePermission permission) {
		this.permission = permission;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the state
	 */
	public String getState() {
		return state;
	}

	/**
	 * @param state the state to set
	 */
	public void setState(String state) {
		this.state = state;
	}

	/**
	 * @return the isDeleted
	 */
	public boolean isDeleted() {
		return isDeleted;
	}

	/**
	 * @param isDeleted the isDeleted to set
	 */
	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	@Override
	public int hashCode() {
		return Objects.hash(description, isDeleted, permission, roleId, roleName, state);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Role other = (Role) obj;
		return Objects.equals(description, other.description) && isDeleted == other.isDeleted
				&& Objects.equals(permission, other.permission) && Objects.equals(roleId, other.roleId)
				&& Objects.equals(roleName, other.roleName) && Objects.equals(state, other.state);
	}

	@Override
	public String toString() {
		return "Role [roleId=" + roleId + ", roleName=" + roleName + ", permission=" + permission + ", description="
				+ description + ", state=" + state + ", isDeleted=" + isDeleted + "]";
	}

}
