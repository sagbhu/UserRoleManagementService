package com.usermanagement.repository;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;

import com.usermanagement.model.User;

@Repository
public interface UserRepository extends MongoRepository<User, String> {

	@Query("{email : ?0}")
	User findByUsername(String userName);
	
	
    @Query("{email: ?0, password: ?1}")                          
	User findUserByEmailAndPassword(String userName,String password);
	
	
	@Query("{mobileNumber : ?0}")
	User findByPhone(String phone);
	
	@Query("{mobileNumber : ?0},{password:?1}")
	User findByUserByPhonePassword(String phone);
	
	Optional<User> findByEmail(String email);
	
	@Query("{'fullName': {'$regex': /?0/, '$options': 'i'}}")
	Page<User> findByFullName(String searchParam, Pageable page);
}
