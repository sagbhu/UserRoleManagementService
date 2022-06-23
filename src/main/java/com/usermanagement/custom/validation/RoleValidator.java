package com.usermanagement.custom.validation;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.usermanagement.model.Role;
import com.usermanagement.service.RoleService;

public class RoleValidator implements ConstraintValidator<RoleValidation, Set<Role>> {

	@Autowired
	private RoleService roleService;

	@Override
	public void initialize(RoleValidation roleName) {
	}

	@Override
	public boolean isValid(Set<Role> roleFromUser, ConstraintValidatorContext context) {
		List<Role> roleFromDB = roleService.getAllRoles();

		Set<Role> tempRoleList = new HashSet<>();

		tempRoleList.addAll(roleFromUser);

		tempRoleList.removeAll(roleFromDB);

		if (!tempRoleList.isEmpty()) {
			return false;
		}
		return true;
	}
}
