package com.usermanagement.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;

import com.usermanagement.model.Role;

@Repository
public interface RoleRepository extends MongoRepository<Role, String> {

	@Query("{roleName : ?0}")
	Role findByRolename(String roleName);

	@Query("{roleName: {$in: ?0}}")
	List<Role> findByListRolename(List<String> roleName);

	Page<Role> findByRoleName(String searchParam, Pageable page);
	
	@Query("{'_id' : { $in : ?0}}")
	List<Role> findBy(List<String> id);
}
