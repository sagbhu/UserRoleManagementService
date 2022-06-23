package com.usermanagement.otp.service;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@ConfigurationProperties(prefix = "dhybrd.sms")
@Configuration
public class SmsProperties {

	private String userId;
	private String pwd;
	private String sender;
	private String msgtype;
	private String peid;
	private String url;
	private String template;

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
	 * @return the pwd
	 */
	public String getPwd() {
		return pwd;
	}

	/**
	 * @param pwd the pwd to set
	 */
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	/**
	 * @return the sender
	 */
	public String getSender() {
		return sender;
	}

	/**
	 * @param sender the sender to set
	 */
	public void setSender(String sender) {
		this.sender = sender;
	}

	/**
	 * @return the msgtype
	 */
	public String getMsgtype() {
		return msgtype;
	}

	/**
	 * @param msgtype the msgtype to set
	 */
	public void setMsgtype(String msgtype) {
		this.msgtype = msgtype;
	}

	/**
	 * @return the peid
	 */
	public String getPeid() {
		return peid;
	}

	/**
	 * @param peid the peid to set
	 */
	public void setPeid(String peid) {
		this.peid = peid;
	}

	/**
	 * @return the uel
	 */
	public String getUrl() {
		return url;
	}

	/**
	 * @param uel the uel to set
	 */
	public void setUrl(String uel) {
		this.url = uel;
	}

	/**
	 * @return the template
	 */
	public String getTemplate() {
		return template;
	}

	/**
	 * @param template the template to set
	 */
	public void setTemplate(String template) {
		this.template = template;
	}

}
