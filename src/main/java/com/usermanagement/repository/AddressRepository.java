package com.usermanagement.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.usermanagement.model.Address;

@Repository
public interface AddressRepository extends MongoRepository<Address, String> {

}
