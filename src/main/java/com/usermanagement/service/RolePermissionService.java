package com.usermanagement.service;

import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.usermanagement.payload.request.RolePermission;

public interface RolePermissionService {

	Map<String, Object> createUpdate(RolePermission rolePermissionRequest);

	Map<String, Object> getAll(String name, Pageable paging);

	Map<String, Object> getById(String id);

	Map<String, Object> delete(String id);

}
