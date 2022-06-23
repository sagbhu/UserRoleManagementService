package com.usermanagement.reponse;

import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.usermanagement.model.Address;
import com.usermanagement.model.Role;

public class UserResponse {

	private String userId;
	private String fullName;
	private String email;
	private String mobileNumber;
	private int mobileOTP;
	private String otpValidTill;
	private String userAccountSource;
	private String referralCode;
	private String accountStatus;
	private String profilePicture;
	private String ageGroup;
	private String dateOfBirth;
	private String gender;
	private String userLocation;
	private String deviceLatitude;
	private String deviceLongitude;
	private String deviceOS;
	private String userCategoryTag;
	private String lastLogin;
	private String accountCreated;
	private String accountUpdated;
	private String accountDeleted;
	private String provider;
	private String jwtToken;

	@JsonIgnore
	private String password;

	@JsonIgnore
	private Set<Role> roles = new HashSet<>();

	@JsonIgnore
	private List<Address> addresses;

	private List<String> roleIds;

	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}

	/**
	 * @return the fullName
	 */
	public String getFullName() {
		return fullName;
	}

	/**
	 * @param fullName the fullName to set
	 */
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the mobileNumber
	 */
	public String getMobileNumber() {
		return mobileNumber;
	}

	/**
	 * @param mobileNumber the mobileNumber to set
	 */
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	/**
	 * @return the mobileOTP
	 */
	public int getMobileOTP() {
		return mobileOTP;
	}

	/**
	 * @param mobileOTP the mobileOTP to set
	 */
	public void setMobileOTP(int mobileOTP) {
		this.mobileOTP = mobileOTP;
	}

	/**
	 * @return the otpValidTill
	 */
	public String getOtpValidTill() {
		return otpValidTill;
	}

	/**
	 * @param otpValidTill the otpValidTill to set
	 */
	public void setOtpValidTill(String otpValidTill) {
		this.otpValidTill = otpValidTill;
	}

	/**
	 * @return the userAccountSource
	 */
	public String getUserAccountSource() {
		return userAccountSource;
	}

	/**
	 * @param userAccountSource the userAccountSource to set
	 */
	public void setUserAccountSource(String userAccountSource) {
		this.userAccountSource = userAccountSource;
	}

	/**
	 * @return the referralCode
	 */
	public String getReferralCode() {
		return referralCode;
	}

	/**
	 * @param referralCode the referralCode to set
	 */
	public void setReferralCode(String referralCode) {
		this.referralCode = referralCode;
	}

	/**
	 * @return the accountStatus
	 */
	public String getAccountStatus() {
		return accountStatus;
	}

	/**
	 * @param accountStatus the accountStatus to set
	 */
	public void setAccountStatus(String accountStatus) {
		this.accountStatus = accountStatus;
	}

	/**
	 * @return the profilePicture
	 */
	public String getProfilePicture() {
		return profilePicture;
	}

	/**
	 * @param profilePicture the profilePicture to set
	 */
	public void setProfilePicture(String profilePicture) {
		this.profilePicture = profilePicture;
	}

	/**
	 * @return the ageGroup
	 */
	public String getAgeGroup() {
		return ageGroup;
	}

	/**
	 * @param ageGroup the ageGroup to set
	 */
	public void setAgeGroup(String ageGroup) {
		this.ageGroup = ageGroup;
	}

	/**
	 * @return the dateOfBirth
	 */
	public String getDateOfBirth() {
		return dateOfBirth;
	}

	/**
	 * @param dateOfBirth the dateOfBirth to set
	 */
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	/**
	 * @return the gender
	 */
	public String getGender() {
		return gender;
	}

	/**
	 * @param gender the gender to set
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}

	/**
	 * @return the userLocation
	 */
	public String getUserLocation() {
		return userLocation;
	}

	/**
	 * @param userLocation the userLocation to set
	 */
	public void setUserLocation(String userLocation) {
		this.userLocation = userLocation;
	}

	/**
	 * @return the deviceLatitude
	 */
	public String getDeviceLatitude() {
		return deviceLatitude;
	}

	/**
	 * @param deviceLatitude the deviceLatitude to set
	 */
	public void setDeviceLatitude(String deviceLatitude) {
		this.deviceLatitude = deviceLatitude;
	}

	/**
	 * @return the deviceLongitude
	 */
	public String getDeviceLongitude() {
		return deviceLongitude;
	}

	/**
	 * @param deviceLongitude the deviceLongitude to set
	 */
	public void setDeviceLongitude(String deviceLongitude) {
		this.deviceLongitude = deviceLongitude;
	}

	/**
	 * @return the deviceOS
	 */
	public String getDeviceOS() {
		return deviceOS;
	}

	/**
	 * @param deviceOS the deviceOS to set
	 */
	public void setDeviceOS(String deviceOS) {
		this.deviceOS = deviceOS;
	}

	/**
	 * @return the userCategoryTag
	 */
	public String getUserCategoryTag() {
		return userCategoryTag;
	}

	/**
	 * @param userCategoryTag the userCategoryTag to set
	 */
	public void setUserCategoryTag(String userCategoryTag) {
		this.userCategoryTag = userCategoryTag;
	}

	/**
	 * @return the lastLogin
	 */
	public String getLastLogin() {
		return lastLogin;
	}

	/**
	 * @param lastLogin the lastLogin to set
	 */
	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}

	/**
	 * @return the accountCreated
	 */
	public String getAccountCreated() {
		return accountCreated;
	}

	/**
	 * @param accountCreated the accountCreated to set
	 */
	public void setAccountCreated(String accountCreated) {
		this.accountCreated = accountCreated;
	}

	/**
	 * @return the accountUpdated
	 */
	public String getAccountUpdated() {
		return accountUpdated;
	}

	/**
	 * @param accountUpdated the accountUpdated to set
	 */
	public void setAccountUpdated(String accountUpdated) {
		this.accountUpdated = accountUpdated;
	}

	/**
	 * @return the accountDeleted
	 */
	public String getAccountDeleted() {
		return accountDeleted;
	}

	/**
	 * @param accountDeleted the accountDeleted to set
	 */
	public void setAccountDeleted(String accountDeleted) {
		this.accountDeleted = accountDeleted;
	}

	/**
	 * @return the provider
	 */
	public String getProvider() {
		return provider;
	}

	/**
	 * @param provider the provider to set
	 */
	public void setProvider(String provider) {
		this.provider = provider;
	}

	/**
	 * @return the jwtToken
	 */
	public String getJwtToken() {
		return jwtToken;
	}

	/**
	 * @param jwtToken the jwtToken to set
	 */
	public void setJwtToken(String jwtToken) {
		this.jwtToken = jwtToken;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the roles
	 */
	public Set<Role> getRoles() {
		return roles;
	}

	/**
	 * @param roles the roles to set
	 */
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	/**
	 * @return the addresses
	 */
	public List<Address> getAddresses() {
		return addresses;
	}

	/**
	 * @param addresses the addresses to set
	 */
	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}

	public List<String> getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(List<String> roleIds) {
		this.roleIds = roleIds;
	}

	@Override
	public int hashCode() {
		return Objects.hash(accountCreated, accountDeleted, accountStatus, accountUpdated, addresses, ageGroup,
				dateOfBirth, deviceLatitude, deviceLongitude, deviceOS, email, fullName, gender, jwtToken, lastLogin,
				mobileNumber, mobileOTP, otpValidTill, password, profilePicture, provider, referralCode, roles,
				userAccountSource, userCategoryTag, userId, userLocation);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserResponse other = (UserResponse) obj;
		return Objects.equals(accountCreated, other.accountCreated)
				&& Objects.equals(accountDeleted, other.accountDeleted)
				&& Objects.equals(accountStatus, other.accountStatus)
				&& Objects.equals(accountUpdated, other.accountUpdated) && Objects.equals(addresses, other.addresses)
				&& Objects.equals(ageGroup, other.ageGroup) && Objects.equals(dateOfBirth, other.dateOfBirth)
				&& Objects.equals(deviceLatitude, other.deviceLatitude)
				&& Objects.equals(deviceLongitude, other.deviceLongitude) && Objects.equals(deviceOS, other.deviceOS)
				&& Objects.equals(email, other.email) && Objects.equals(fullName, other.fullName)
				&& Objects.equals(gender, other.gender) && Objects.equals(jwtToken, other.jwtToken)
				&& Objects.equals(lastLogin, other.lastLogin) && Objects.equals(mobileNumber, other.mobileNumber)
				&& mobileOTP == other.mobileOTP && Objects.equals(otpValidTill, other.otpValidTill)
				&& Objects.equals(password, other.password) && Objects.equals(profilePicture, other.profilePicture)
				&& Objects.equals(provider, other.provider) && Objects.equals(referralCode, other.referralCode)
				&& Objects.equals(roles, other.roles) && Objects.equals(userAccountSource, other.userAccountSource)
				&& Objects.equals(userCategoryTag, other.userCategoryTag) && Objects.equals(userId, other.userId)
				&& Objects.equals(userLocation, other.userLocation);
	}

	@Override
	public String toString() {
		return "UserResponse [userId=" + userId + ", fullName=" + fullName + ", email=" + email + ", mobileNumber="
				+ mobileNumber + ", mobileOTP=" + mobileOTP + ", otpValidTill=" + otpValidTill + ", userAccountSource="
				+ userAccountSource + ", referralCode=" + referralCode + ", accountStatus=" + accountStatus
				+ ", profilePicture=" + profilePicture + ", ageGroup=" + ageGroup + ", dateOfBirth=" + dateOfBirth
				+ ", gender=" + gender + ", userLocation=" + userLocation + ", deviceLatitude=" + deviceLatitude
				+ ", deviceLongitude=" + deviceLongitude + ", deviceOS=" + deviceOS + ", userCategoryTag="
				+ userCategoryTag + ", lastLogin=" + lastLogin + ", accountCreated=" + accountCreated
				+ ", accountUpdated=" + accountUpdated + ", accountDeleted=" + accountDeleted + ", provider=" + provider
				+ ", jwtToken=" + jwtToken + ", password=" + password + ", roles=" + roles + ", addresses=" + addresses
				+ "]";
	}

}
