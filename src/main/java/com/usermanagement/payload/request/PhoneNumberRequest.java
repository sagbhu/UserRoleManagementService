package com.usermanagement.payload.request;

import javax.validation.constraints.NotBlank;

public class PhoneNumberRequest {

	@NotBlank
	private String phone;

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}
