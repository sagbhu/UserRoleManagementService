package com.usermanagement.service;

import java.util.List;

import javax.validation.Valid;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;

import com.usermanagement.model.Address;
import com.usermanagement.model.User;
import com.usermanagement.payload.request.AddressRequest;
import com.usermanagement.payload.request.AuthenticationRequest;
import com.usermanagement.payload.request.OTPRequest;
import com.usermanagement.payload.request.UpdatePasswordRequest;
import com.usermanagement.payload.request.UserAddressRequest;
import com.usermanagement.payload.request.UserRoleRequest;
import com.usermanagement.reponse.ApplicationResponse;

public interface UserService {

	User registerUser(User user);

	List<User> getAllUsers();

	User getUserById(String id);

	User updateUser(User user);

	void deleteUserById(String id);

	ResponseEntity<?> authenticate(AuthenticationRequest authenticationRequest);

	ResponseEntity<?> verifyOTP(OTPRequest otp);

	User createAppUser(@Valid User user);

	String authenticateAppUser(AuthenticationRequest authenticationRequest);

	User getUserByEmail(String email);

	String updateUserPassword(UpdatePasswordRequest updatePasswordRequest);
	
	String sendSMSForForgotPassword(String email);
	
	String verifySMSForForgotPassword(String email,String otp);

	Address saveAddress(AddressRequest addressRequest);

	List<Address> getAddresses();

	Address updateAddress(AddressRequest addressRequest);

	String deleteAddress(String id);

	User saveUserAddress(UserAddressRequest userAddressRequest);
	
	ApplicationResponse adminLogin(AuthenticationRequest authenticationRequest);

	User saveUserRole(UserRoleRequest userRoleRequest);

	Page<User> getAllUsers(String name, Pageable paging);
}
