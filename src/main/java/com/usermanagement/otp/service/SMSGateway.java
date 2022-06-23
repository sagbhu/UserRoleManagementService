package com.usermanagement.otp.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SMSGateway {

	private static final Logger logger = LoggerFactory.getLogger(SMSGateway.class);

	@Autowired
	private SmsProperties smsProperties;

	public boolean sendSms(String otp, String mobile) {
		logger.info("sendSms method started in SMSGateway");

		Boolean result = false;
		String data;

		try {
			String message = URLEncoder.encode(smsProperties.getTemplate().replace("{{OTP}}", String.valueOf(otp)),
					"UTF-8");

			data = smsProperties.getUrl() + "userid=" + smsProperties.getUserId() + "&pwd=" + smsProperties.getPwd()
					+ "&mobile=" + mobile + "&sender=" + smsProperties.getSender() + "&msg=" + message + "&msgtype="
					+ smsProperties.getMsgtype() + "&peid=" + smsProperties.getPeid();

			HttpURLConnection httpClient = (HttpURLConnection) new URL(data).openConnection();
			httpClient.setRequestMethod("GET");

			httpClient.setRequestProperty("User-Agent", "Mozilla/5.0");
			int responseCode = httpClient.getResponseCode();
			URL url = new URL(data);
			URLConnection conn = url.openConnection();
			conn.setDoOutput(true);
			if (responseCode == HttpURLConnection.HTTP_OK) {
				try (BufferedReader in = new BufferedReader(new InputStreamReader(httpClient.getInputStream()))) {

					StringBuilder response = new StringBuilder();
					String line;

					while ((line = in.readLine()) != null) {
						response.append(line);
					}
					System.out.println(response.toString());

				} catch (Exception e) {
					System.out.println("Error SMS " + e);
					return "Error " + e != null;
				}
				return true;
			}
		} catch (IOException e) {
			logger.error("Exception while sending OTP:" + e.getMessage());
		}
		logger.info("sendSms method Ended in SMSGateway");

		return result;
	}

}