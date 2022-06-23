package com.usermanagement.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.usermanagement.constant.URLConstants;
import com.usermanagement.model.Role;
import com.usermanagement.service.RoleService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping(URLConstants.SERVICE_URL)
public class RoleController {
	private static final Logger logger = LoggerFactory.getLogger(RoleController.class);

	@Autowired
	private RoleService roleService;

	@GetMapping("/roles")
	public ResponseEntity<Map<String, Object>> getAllRoles(@RequestParam(required = false) String name,
			@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "10") int size) {
		Pageable paging = PageRequest.of(page, size);
		logger.info("getAllRoles method start in Role controller");
		return new ResponseEntity<>(roleService.getAllRoles(name, paging), HttpStatus.OK);

	}

	@GetMapping("/role/{id}")
	public ResponseEntity<Map<String, Object>> getRoleById(@PathVariable("id") String id) {
		logger.info("getRoleById method start in Role controller");

		return new ResponseEntity<>(roleService.getRoleById(id), HttpStatus.OK);

	}

	@PostMapping("/role")
	public ResponseEntity<Map<String, Object>> createRole(@Validated @RequestBody Role role) {
		logger.info("createRole method start in Role controller");

		return new ResponseEntity<>(roleService.createRole(role), HttpStatus.OK);

	}

	@PutMapping("/role")
	public ResponseEntity<Map<String, Object>> updateRole(@Validated @RequestBody Role role) {
		logger.info("updateRole method started in RoleController");

		return new ResponseEntity<>(roleService.updateRole(role), HttpStatus.OK);

	}

	@DeleteMapping("/role/{id}")
	public ResponseEntity<Map<String, Object>> deleteRole(@PathVariable("id") String id) {
		logger.info("deleteRole method start in Role controller");
		return new ResponseEntity<>(roleService.deleteRoleById(id), HttpStatus.OK);
	}
}
