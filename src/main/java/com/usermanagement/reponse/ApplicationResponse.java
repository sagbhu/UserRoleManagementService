package com.usermanagement.reponse;

import java.util.Objects;

public class ApplicationResponse {

	private int code;
	private boolean status;
	private String message;
	private Object data;
	private Object config;
	private Object errors;

	/**
	 * @return the code
	 */
	public int getCode() {
		return code;
	}

	/**
	 * @param code the code to set
	 */
	public void setCode(int code) {
		this.code = code;
	}

	/**
	 * @return the status
	 */
	public boolean isStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(boolean status) {
		this.status = status;
	}

	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * @return the data
	 */
	public Object getData() {
		return data;
	}

	/**
	 * @param data the data to set
	 */
	public void setData(Object data) {
		this.data = data;
	}

	/**
	 * @return the config
	 */
	public Object getConfig() {
		return config;
	}

	/**
	 * @param config the config to set
	 */
	public void setConfig(Object config) {
		this.config = config;
	}

	/**
	 * @return the errors
	 */
	public Object getErrors() {
		return errors;
	}

	/**
	 * @param errors the errors to set
	 */
	public void setErrors(Object errors) {
		this.errors = errors;
	}

	@Override
	public int hashCode() {
		return Objects.hash(code, config, data, errors, message, status);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ApplicationResponse other = (ApplicationResponse) obj;
		return code == other.code && Objects.equals(config, other.config) && Objects.equals(data, other.data)
				&& Objects.equals(errors, other.errors) && Objects.equals(message, other.message)
				&& status == other.status;
	}

	@Override
	public String toString() {
		return "ApplicationResponse [code=" + code + ", status=" + status + ", message=" + message + ", data=" + data
				+ ", config=" + config + ", errors=" + errors + ", getCode()=" + getCode() + ", isStatus()="
				+ isStatus() + ", getMessage()=" + getMessage() + ", getData()=" + getData() + ", getConfig()="
				+ getConfig() + ", getErrors()=" + getErrors() + ", hashCode()=" + hashCode() + ", getClass()="
				+ getClass() + ", toString()=" + super.toString() + "]";
	}

}
