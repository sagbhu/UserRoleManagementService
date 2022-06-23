package com.usermanagement.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.usermanagement.model.Role;

public interface RoleService {

	// Save operation
	Map<String, Object> createRole(Role role);

	// Read operation
	Map<String, Object> getAllRoles(String name, Pageable paging);

	Map<String, Object> getRoleById(String id);

	// Update operation
	Map<String, Object> updateRole(Role role);

	// Delete operation
	Map<String, Object> deleteRoleById(String id);

	List<Role> getAllRoles();
}
