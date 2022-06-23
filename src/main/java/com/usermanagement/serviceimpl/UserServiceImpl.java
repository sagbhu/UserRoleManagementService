package com.usermanagement.serviceimpl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.Set;

import javax.validation.Valid;

import org.apache.http.HttpStatus;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.usermanagement.constant.UserServiceConstants;
import com.usermanagement.model.Address;
import com.usermanagement.model.Role;
import com.usermanagement.model.User;
import com.usermanagement.otp.service.SMSGateway;
import com.usermanagement.payload.reponse.JwtResponse;
import com.usermanagement.payload.request.AddressRequest;
import com.usermanagement.payload.request.AuthenticationRequest;
import com.usermanagement.payload.request.OTPRequest;
import com.usermanagement.payload.request.UpdatePasswordRequest;
import com.usermanagement.payload.request.UserAddressRequest;
import com.usermanagement.payload.request.UserRoleRequest;
import com.usermanagement.reponse.ApplicationResponse;
import com.usermanagement.reponse.UserResponse;
import com.usermanagement.repository.AddressRepository;
import com.usermanagement.repository.RoleRepository;
import com.usermanagement.repository.UserRepository;
import com.usermanagement.security.jwt.JwtUtils;
import com.usermanagement.security.service.UserDetailsServiceImpl;
import com.usermanagement.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Autowired
	AuthenticationManager authenticationManager;

	@Autowired
	RoleRepository roleRepository;

	@Autowired
	UserDetailsServiceImpl userDetailsServiceImpl;

	@Autowired
	UserRepository userRepository;

	@Autowired
	JwtUtils jwtUtils;

	@Autowired
	SMSGateway sMSGateway;

	@Autowired
	AddressRepository addressRepository;

	private ObjectMapper mapper = new ObjectMapper();

	@Override
	public User registerUser(@Valid User user) {
		logger.info("registerUser method started in UserServiceImpl");
		List<String> listRoleName = new ArrayList<>();
		listRoleName.add("GUEST");
		List<Role> roleListfromDB = roleRepository.findByListRolename(listRoleName);
		Set<Role> setRoleList = new HashSet<>(roleListfromDB);
		user.setRoles(setRoleList);
		logger.info("registerUser method end in UserServiceImpl.");
		Optional<User> existingUser = userRepository.findByEmail(user.getEmail());
		if (existingUser != null && existingUser.isPresent()) {
			return existingUser.get();
		}
		return userRepository.save(user);
	}

	@Override
	public User createAppUser(@Valid User user) {
		logger.info("createUser Method start in user service");

		if ((user.getEmail() == null || user.getEmail().isEmpty())
				|| (user.getPassword() == null || user.getPassword().isEmpty())) {
			return null;
		}

		Optional<User> existingUser = userRepository.findByEmail(user.getEmail());
		if (existingUser != null && existingUser.isPresent()) {
			return existingUser.get();
		}
		List<String> Ids = user.getRoleIds();
		List<Role> roles = new ArrayList<>();
		if (null != Ids && !Ids.isEmpty()) {
			roles.addAll(roleRepository.findBy(Ids));
			Set<Role> roleSet = new HashSet<>(roles);
			user.setRoles(roleSet);
		}
		return userRepository.save(user);
	}

	@Override
	public List<User> getAllUsers() {
		return userRepository.findAll();
	}

	@Override
	public User getUserById(String id) {
		Optional<User> user = userRepository.findById(id);
		if (user.isPresent()) {
			return user.get();
		} else {
			return null;
		}
	}

	@Override
	public User updateUser(@Valid User user) {
		List<String> Ids = user.getRoleIds();
		List<Role> roles = new ArrayList<>();
		if (null != Ids && !Ids.isEmpty()) {
			roles.addAll(roleRepository.findBy(Ids));
			Set<Role> roleSet = new HashSet<>(roles);
			user.setRoles(roleSet);
		}
		return userRepository.save(user);
	}

	@Override
	public void deleteUserById(String id) {
		logger.info("deleteUserById method started in UserServiceImpl");
		userRepository.deleteById(id);
		logger.info("deleteUserById method ended in UserServiceImpl");
	}

	@Override
	public ResponseEntity<?> authenticate(AuthenticationRequest authenticationRequest) {

		logger.info("authenticate method started in UserServiceImpl");
		User user = null;
		if (authenticationRequest.getUsername() == null || authenticationRequest.getUsername().isEmpty()) {
			return ResponseEntity.ok("Fail");
		}

		if (validatePhoneNumber(authenticationRequest.getUsername())) {
			if (!authenticationRequest.getPassword().equals(UserServiceConstants.defaultPassword)) {
				return ResponseEntity.ok("Fail");
			}

			String otp = String.valueOf(generateOTP(4));
			if ((authenticationRequest.getUsername().length()) <= UserServiceConstants.PHONE_NUMBER_LENGTH) {
				user = userRepository.findByPhone(authenticationRequest.getUsername());
				if (user != null) {
					if (sMSGateway.sendSms(otp, user.getMobileNumber())) {
						user.setMobileOTP(otp);
						user = updateUser(user);
					} else {
						return ResponseEntity.ok("Fail");
					}
				} else {
					user = new User();
					user.setMobileNumber(authenticationRequest.getUsername());
					user.setEmail(authenticationRequest.getUsername() + UserServiceConstants.EMAIl_DOMAIN);
					user.setPassword(UserServiceConstants.defaultPassword);
					if (sMSGateway.sendSms(otp, user.getMobileNumber())) {
						user.setMobileOTP(otp);
						user = registerUser(user);
					} else {
						return ResponseEntity.ok("Fail");
					}
				}
			}
			if (user != null) {
				logger.info("authenticate Method end in user service");
				return ResponseEntity.ok("Success");
			} else {
				return ResponseEntity.ok("Fail");
			}
		}

		else {

			if (authenticationRequest.getPassword() == null || authenticationRequest.getPassword().isEmpty()) {
				return ResponseEntity.ok("Fail");
			} else {

				user = userRepository.findUserByEmailAndPassword(authenticationRequest.getUsername(),
						authenticationRequest.getPassword());
				if (user != null) {
					user = updateUser(user);
				} else {
					user = userRepository.findByUsername(authenticationRequest.getUsername());
					if (user != null) {
						return ResponseEntity.ok("Fail");
					}
					user = new User();
					user.setEmail(authenticationRequest.getUsername());
					user.setPassword(UserServiceConstants.defaultPassword);
					user = registerUser(user);
				}
			}

			try {
				authenticationManager
						.authenticate(new UsernamePasswordAuthenticationToken(user.getEmail(), user.getPassword()));
				final UserDetails userDetails = userDetailsServiceImpl.loadUserByUsername(user.getEmail());
				logger.info("authenticate method ended in UserServiceImpl");
				return ResponseEntity.ok(new JwtResponse(jwtUtils.generateToken(userDetails)));
			} catch (BadCredentialsException e) {
				logger.debug("authenticate method failed while authenticating in UserServiceImpl");
				throw new BadCredentialsException("Incorrect username or password ", e);
			}
		}

	}

	boolean validatePhoneNumber(String phone) {
		logger.info("validatePhoneNumber method started in UserServiceImpl");
		for (char c : phone.toCharArray()) {
			if (!Character.isDigit(c)) {
				return false;
			}
		}
		logger.info("validatePhoneNumber method ended in UserServiceImpl");
		return true;
	}

	@Override
	public ResponseEntity<?> verifyOTP(OTPRequest otp) {
		logger.info("verifyOTP method started in UserServiceImpl");

		if (otp.getPhone() == null || otp.getPhone().isEmpty()) {
			return ResponseEntity.ok("Fail");
		}

		if (otp.getPassword() == null || otp.getPassword().isEmpty()) {
			return ResponseEntity.ok("Fail");
		}

		User user = userRepository.findByPhone(otp.getPhone());
		if (user != null && otp.getPassword().equals(UserServiceConstants.defaultPassword)) {
			if (user.getMobileOTP().equals(otp.getPin())) {
				authenticationManager
						.authenticate(new UsernamePasswordAuthenticationToken(user.getEmail(), user.getPassword()));
				final UserDetails userDetails = userDetailsServiceImpl.loadUserByUsername(user.getEmail());
				final String jwtToken = jwtUtils.generateToken(userDetails);
				logger.info("verifyOTP method ended in UserServiceImpl");
				return ResponseEntity.ok(new JwtResponse(jwtToken));

			}
			return ResponseEntity.ok("Invalid OTP");
		} else {
			logger.info("verifyOTP Method end in user service");
			return ResponseEntity.ok("Something wrong Otp/Password/Mobile incorrect");
		}
	}

	@Override
	public String authenticateAppUser(AuthenticationRequest authenticationRequest) {
		UserDetails userDetails = null;
		try {
			authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(
					authenticationRequest.getUsername(), authenticationRequest.getPassword()));
			userDetails = userDetailsServiceImpl.loadUserByUsername(authenticationRequest.getUsername());
			if ((!userDetails.getPassword().equals(authenticationRequest.getPassword())) || !isAdminUser(userDetails)) {
				return "Invalid";
			}
		} catch (BadCredentialsException e) {
			logger.debug("Error when authenticate Method  user service:" + e.getMessage());
			return "Invalid";
		}
		return jwtUtils.generateToken(userDetails);
	}

	private boolean isAdminUser(UserDetails userDetails) {
		String username = userDetails.getUsername();
		String password = userDetails.getPassword();
		User user = userRepository.findUserByEmailAndPassword(username, password);
		Set<Role> roles = user.getRoles();
		List<Role> roleList = new ArrayList<>(roles);
		for (int i = 0; i < roleList.size(); i++) {
			if (roleList.get(i).getRoleName().equals("ADMIN")) {
				return true;
			}
		}
		return false;
	}

	@Override
	public User getUserByEmail(String email) {
		User user = userRepository.findByUsername(email);
		if (null != user) {
			user.setPassword("");
		}
		return user;
	}

	private static String generateOTP(int length) {
		String numbers = "1234567890";
		Random random = new Random();
		char[] otp = new char[length];

		for (int i = 0; i < length; i++) {
			otp[i] = numbers.charAt(random.nextInt(numbers.length()));
		}
		return String.valueOf(otp);
	}

	@Override
	public String updateUserPassword(UpdatePasswordRequest updatePasswordRequest) {
		Optional<User> userdb = userRepository.findByEmail(updatePasswordRequest.getEmail());
		User user = null;
		if (userdb.isPresent()) {
			user = userdb.get();
			if (user.getEmail().equals(updatePasswordRequest.getEmail())) {
				user.setPassword(updatePasswordRequest.getNewpassword());
				userRepository.save(user);
				return "Success";
			}
		} else {
			return "Fail";
		}
		return "Fail";
	}

	@Override
	public String sendSMSForForgotPassword(String email) {

		String otp = String.valueOf(generateOTP(4));
		User user = userRepository.findByUsername(email);
		boolean isSent = false;
		if (null != user) {
			isSent = sMSGateway.sendSms(otp, user.getMobileNumber());
			user.setMobileOTP(otp);
			userRepository.save(user);
		} else {
			return "Fail";
		}
		return isSent ? "Success" : "Fail";
	}

	public String verifySMSForForgotPassword(String email, String otp) {
		User user = userRepository.findByUsername(email);
		if (null != user && String.valueOf(user.getMobileOTP()).equals(otp)) {
			return "Success";
		} else {
			return "Fail";
		}
	}

	@Override
	public Address saveAddress(AddressRequest addressRequest) {
		Address address = new Address();
		address.setName(addressRequest.getName());
		address.setMobileNumber(addressRequest.getMobileNumber());
		address.setAddressLine1(addressRequest.getAddressLine1());
		address.setAddressLine2(addressRequest.getAddressLine2());
		address.setCity(addressRequest.getCity());
		address.setState(addressRequest.getState());
		address.setCountry(addressRequest.getCountry());
		address.setPinCode(addressRequest.getPinCode());
		address.setType(addressRequest.getType());
		address.setEmailAddress(addressRequest.getEmailAddress());
		addressRepository.save(address);
		return address;
	}

	@Override
	public List<Address> getAddresses() {
		List<Address> addresses = addressRepository.findAll();
		return addresses;
	}

	@Override
	public Address updateAddress(AddressRequest addressRequest) {
		Optional<Address> dbAddress = addressRepository.findById(addressRequest.getId());
		Address address = null;
		if (dbAddress.isPresent()) {
			address = dbAddress.get();
			address.setName(addressRequest.getName());
			address.setMobileNumber(addressRequest.getMobileNumber());
			address.setAddressLine1(addressRequest.getAddressLine1());
			address.setAddressLine2(addressRequest.getAddressLine2());
			address.setCity(addressRequest.getCity());
			address.setState(addressRequest.getState());
			address.setCountry(addressRequest.getCountry());
			address.setPinCode(addressRequest.getPinCode());
			address.setType(addressRequest.getType());
			address.setEmailAddress(addressRequest.getEmailAddress());
			addressRepository.save(address);
			return address;
		}
		return address;
	}

	@Override
	public String deleteAddress(String id) {
		addressRepository.deleteById(id);
		return "Deleted Successfully";
	}

	@Override
	public User saveUserAddress(UserAddressRequest userAddressRequest) {
		Optional<User> dbUser = userRepository.findById(userAddressRequest.getUserId());
		User user = null;
		if (dbUser.isPresent() && !userAddressRequest.getAddresses().isEmpty()) {
			List<Address> addressList = addressRepository.saveAll(userAddressRequest.getAddresses());
			user = dbUser.get();
			user.setAddresses(addressList);
			userRepository.save(user);
		}
		return user;
	}

	@Override
	public ApplicationResponse adminLogin(AuthenticationRequest authenticationRequest) {
		ApplicationResponse applicationResponse = new ApplicationResponse();
		Boolean isAdmin = false;
		if (authenticationRequest.getUsername() == null || authenticationRequest.getUsername().isEmpty()) {
			applicationResponse.setCode(HttpStatus.SC_BAD_REQUEST);
			applicationResponse.setMessage("Fail");
			applicationResponse.setStatus(false);
			return applicationResponse;
		}

		if (authenticationRequest.getPassword() == null || authenticationRequest.getPassword().isEmpty()) {
			applicationResponse.setCode(HttpStatus.SC_BAD_REQUEST);
			applicationResponse.setMessage("Fail");
			applicationResponse.setStatus(false);
			return applicationResponse;
		}

		User user = userRepository.findUserByEmailAndPassword(authenticationRequest.getUsername(),
				authenticationRequest.getPassword());
		if (user == null) {
			applicationResponse.setCode(HttpStatus.SC_UNAUTHORIZED);
			applicationResponse.setMessage("Fail");
			applicationResponse.setStatus(false);
			return applicationResponse;
		}
		UserResponse userResponse = mapper.convertValue(user, UserResponse.class);
		Set<Role> roles = user.getRoles();
		if (!roles.isEmpty()) {
			for (Role role : roles) {
				if (role.getRoleName().equalsIgnoreCase("ADMIN")) {
					isAdmin = true;
					break;
				}
			}
			if (isAdmin) {
				authenticationManager
						.authenticate(new UsernamePasswordAuthenticationToken(user.getEmail(), user.getPassword()));
				final UserDetails userDetails = userDetailsServiceImpl.loadUserByUsername(user.getEmail());
				logger.info("authenticate method ended in UserServiceImpl");
				userResponse.setJwtToken(new JwtResponse(jwtUtils.generateToken(userDetails)).getJwtToken());
				applicationResponse.setCode(HttpStatus.SC_OK);
				applicationResponse.setData(userResponse);
				applicationResponse.setMessage("Success");
				applicationResponse.setStatus(true);
				return applicationResponse;
			}
		}
		applicationResponse.setCode(HttpStatus.SC_UNAUTHORIZED);
		applicationResponse.setMessage("Fail");
		applicationResponse.setStatus(false);
		return applicationResponse;
	}

	@Override
	public User saveUserRole(UserRoleRequest userRoleRequest) {
		Optional<User> dbUser = userRepository.findById(userRoleRequest.getUserId());
		User user = null;
		if (dbUser.isPresent() && !userRoleRequest.getRoles().isEmpty()) {
			List<Role> roleList = roleRepository.saveAll(userRoleRequest.getRoles());
			Set<Role> roleSet = new HashSet<>(roleList);
			user = dbUser.get();
			user.setRoles(roleSet);
			userRepository.save(user);
		}
		return user;
	}

	@Override
	public Page<User> getAllUsers(String name, Pageable paging) {
		Page<User> userList;
		if (name == null || name.isEmpty())
			userList = userRepository.findAll(paging);
		else
			userList = userRepository.findByFullName(name, paging);
		return userList;
	}
}
