package com.usermanagement.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
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
import com.usermanagement.model.Address;
import com.usermanagement.model.User;
import com.usermanagement.otp.service.PhoneVerificationService;
import com.usermanagement.payload.request.AddressRequest;
import com.usermanagement.payload.request.AuthenticationRequest;
import com.usermanagement.payload.request.ForgotPasswordOtpRequest;
import com.usermanagement.payload.request.ForgotPasswordRequest;
import com.usermanagement.payload.request.OTPRequest;
import com.usermanagement.payload.request.UpdatePasswordRequest;
import com.usermanagement.payload.request.UserAddressRequest;
import com.usermanagement.payload.request.UserRoleRequest;
import com.usermanagement.reponse.ApplicationResponse;
import com.usermanagement.repository.UserRepository;
import com.usermanagement.security.jwt.JwtUtils;
import com.usermanagement.security.service.UserDetailsServiceImpl;
import com.usermanagement.service.UserService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping(URLConstants.SERVICE_URL)
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	AuthenticationManager authenticationManager;

	@Autowired
	private UserService userService;

	@Autowired
	UserDetailsServiceImpl userServiceImpl;

	@Autowired
	UserRepository userRepository;

	@Autowired
	JwtUtils jwtUtils;

	@Autowired
	PhoneVerificationService phonesmsservice;

	@PostMapping(value = "/authenticate")
	public ResponseEntity<?> authenticateUser(@RequestBody AuthenticationRequest authenticationRequest) {
		logger.info("authenticateUser method start");
		return userService.authenticate(authenticationRequest);
	}

	@PostMapping("/verifyotp")
	public ResponseEntity<?> verifyOTP(@RequestBody OTPRequest otp) {
		logger.info("verifyOTP method start");
		return userService.verifyOTP(otp);
	}

	@GetMapping("/users")
	public Map<String, Object> getAllUsers(@RequestParam(required = false) String name,
			@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "10") int size) {
		Pageable paging = PageRequest.of(page, size);
		Page<User> users = userService.getAllUsers(name, paging);
		Map<String, Object> response = new HashMap<>();
		response.put("data", users.getContent());
		response.put("currentPage", users.getNumber());
		response.put("totalItems", users.getTotalElements());
		response.put("totalPages", users.getTotalPages());
		response.put("status", true);
		response.put("code", HttpStatus.OK);
		response.put("message", "Users get successfully");
		return response;
	}

	@GetMapping("/user/{id}")
	public ResponseEntity<User> getUserById(@PathVariable("id") String id) {
		logger.info("getUserById method start");
		User user = userService.getUserById(id);
		return new ResponseEntity<>(user, HttpStatus.OK);

	}

	@PostMapping("/createUser")
	public ResponseEntity<User> createUser(@RequestBody User user) {
		logger.info("createUser method start");
		User newUser = userService.createAppUser(user);
		return new ResponseEntity<>(newUser, HttpStatus.OK);
	}

	@PutMapping("/updateUser")
	public ResponseEntity<User> updateUser(@RequestBody User user) {
		logger.info("updateUser method start in UserController");
		User updatedUser = userService.updateUser(user);
		if (updatedUser != null) {
			return new ResponseEntity<>(updatedUser, HttpStatus.OK);
		} else {
			logger.debug("updateUser method not found any file in UserController");
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	@PostMapping("/authenticate/appUser")
	public String authenticateAdmin(@RequestBody AuthenticationRequest authenticationRequest) {
		return userService.authenticateAppUser(authenticationRequest);
	}

	@DeleteMapping("/deleteUser/{id}")
	public ResponseEntity<HttpStatus> deleteUserById(@PathVariable("id") String id) {
		logger.info("deleteUserById method start in UserController");
		userService.deleteUserById(id);
		logger.info("deleteUserById method ended in UserController");
		return new ResponseEntity<>(HttpStatus.OK);
	}

	@PostMapping("/getUser")
	public ResponseEntity<User> getUserByEmail(@RequestBody User user) {
		logger.info("getUserById method start");
		User userObj = userService.getUserByEmail(user.getEmail());
		return new ResponseEntity<>(userObj, HttpStatus.OK);
	}

	@PutMapping("/updatePassword")
	public ResponseEntity<String> updateUserPassword(@RequestBody UpdatePasswordRequest updatePasswordRequest) {
		String status = userService.updateUserPassword(updatePasswordRequest);
		return new ResponseEntity<>(status, HttpStatus.OK);

	}

	@PostMapping("/sendForgotPasswordOtp")
	public ResponseEntity<String> sendForgotPasswordMsg(@RequestBody ForgotPasswordRequest forgotPasswordRequest) {
		logger.info("sendForgotPasswordOtp method start");
		String status = userService.sendSMSForForgotPassword(forgotPasswordRequest.getEmail());
		return new ResponseEntity<>(status, HttpStatus.OK);
	}

	@PostMapping("/verifyForgotPasswordOtp")
	public ResponseEntity<String> verifyForgotPasswordOtp(
			@RequestBody ForgotPasswordOtpRequest forgotPasswordOtpRequest) {
		logger.info("verifyForgotPasswordOtp method start");
		String status = userService.verifySMSForForgotPassword(forgotPasswordOtpRequest.getEmail(),
				forgotPasswordOtpRequest.getOtp());
		return new ResponseEntity<>(status, HttpStatus.OK);
	}

	@PostMapping("/saveAddress")
	public ResponseEntity<Address> saveAddress(@RequestBody AddressRequest addressRequest) {
		Address address = userService.saveAddress(addressRequest);
		return new ResponseEntity<>(address, HttpStatus.CREATED);
	}

	@GetMapping("/getAddress")
	public ResponseEntity<List<Address>> getAddresses() {
		List<Address> addresses = userService.getAddresses();
		return new ResponseEntity<>(addresses, HttpStatus.OK);
	}

	@PutMapping("/updateAddress")
	public ResponseEntity<Address> updateAddress(@RequestBody AddressRequest addressRequest) {
		Address address = userService.updateAddress(addressRequest);
		return new ResponseEntity<>(address, HttpStatus.OK);
	}

	@DeleteMapping("/deleteAddress/{id}")
	public ResponseEntity<String> deleteAddress(@PathVariable("id") String id) {
		String obj = userService.deleteAddress(id);
		return new ResponseEntity<>(obj, HttpStatus.OK);
	}

	@PutMapping("/saveUserAddress")
	public ResponseEntity<User> saveUserAddress(@RequestBody UserAddressRequest userAddressRequest) {
		User address = userService.saveUserAddress(userAddressRequest);
		return new ResponseEntity<>(address, HttpStatus.OK);
	}

	@PostMapping("/login")
	public ApplicationResponse login_user(@RequestBody AuthenticationRequest authenticationRequest) {
		return userService.adminLogin(authenticationRequest);
	}
	
	@PutMapping("/saveUserRole")
	public ResponseEntity<User> saveUserRole(@RequestBody UserRoleRequest userRoleRequest) {
		User role = userService.saveUserRole(userRoleRequest);
		return new ResponseEntity<>(role, HttpStatus.OK);
	}

}