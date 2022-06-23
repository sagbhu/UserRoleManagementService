package com.usermanagement.serviceimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.usermanagement.model.Role;
import com.usermanagement.repository.RoleRepository;
import com.usermanagement.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {

	private static final Logger logger = LoggerFactory.getLogger(RoleServiceImpl.class);

	@Autowired
	private RoleRepository roleRepository;

	@Override
	public Map<String, Object> createRole(Role role) {
		Map<String, Object> response = new HashMap<String, Object>();
		logger.info("createRole method started in RoleServiceImpl");
		response.put("data", roleRepository.save(role));
		response.put("status", true);
		response.put("code", HttpStatus.OK);
		response.put("message", "Created");
		logger.info("createRole method ended in RoleServiceImpl");
		return response;
	}

	@Override
	public Map<String, Object> getRoleById(String id) {
		Map<String, Object> response = new HashMap<String, Object>();
		logger.info("getRoleById method started in RoleServiceImpl");
		logger.info("getRoleById method ended in RoleServiceImpl");
		Optional<Role> role = roleRepository.findById(id);
		if (role.isPresent()) {
			response.put("data", role.get());
			response.put("status", true);
			response.put("code", HttpStatus.OK);
			response.put("message", "Created");
			return response;
		}
		response.put("status", false);
		response.put("code", HttpStatus.NO_CONTENT);
		response.put("message", "No record found");
		return response;
	}

	@Override
	public Map<String, Object> updateRole(Role role) {
		logger.info("updateRole method started in RoleServiceImpl");
		Map<String, Object> response = new HashMap<String, Object>();
		Optional<Role> roleData = roleRepository.findById(role.getRoleId());
		if (roleData.isPresent()) {
			Role existingRole = roleData.get();
			existingRole.setRoleName(role.getRoleName());
			existingRole.setDescription(role.getDescription());
			existingRole.setPermission(role.getPermission());
			existingRole.setState(role.getState());

			response.put("data", roleRepository.save(existingRole));
			response.put("status", true);
			response.put("code", HttpStatus.OK);
			response.put("message", "Updated");
			return response;
		}
		logger.info("updateRole method ended in RoleServiceImpl");
		response.put("status", false);
		response.put("code", HttpStatus.NO_CONTENT);
		response.put("message", "No record found to update");
		return response;
	}

	@Override
	public Map<String, Object> deleteRoleById(String id) {
		logger.info("deleteRoleById method started in RoleServiceImpl");
		Map<String, Object> response = new HashMap<String, Object>();
		roleRepository.deleteById(id);
		response.put("status", true);
		response.put("code", HttpStatus.OK);
		response.put("message", "Deleted");
		logger.info("deleteRoleById method ended in RoleServiceImpl");
		return response;
	}

	@Override
	public Map<String, Object> getAllRoles(String name, Pageable paging) {
		logger.info("getAllRoles method started in RoleServiceImpl");
		Map<String, Object> response = new HashMap<String, Object>();

		Page<Role> roleList;
		if (name == null || name.isEmpty())
			roleList = roleRepository.findAll(paging);
		else
			roleList = roleRepository.findByRoleName(name, paging);

		response.put("data", roleList.getContent());
		response.put("currentPage", roleList.getNumber());
		response.put("totalItems", roleList.getTotalElements());
		response.put("totalPages", roleList.getTotalPages());
		response.put("status", true);
		response.put("code", HttpStatus.OK);
		response.put("message", "Record found");
		logger.info("getAllRoles method ended in RoleServiceImpl");
		return response;
	}

	@Override
	public List<Role> getAllRoles() {
		return roleRepository.findAll();
	}

}
