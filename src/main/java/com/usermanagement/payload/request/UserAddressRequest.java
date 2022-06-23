package com.usermanagement.payload.request;

import java.util.List;

import com.usermanagement.model.Address;

public class UserAddressRequest {

	private String userId;
	private List<Address> addresses;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public List<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}

}
