package com.usermanagement.security;

public interface SecurityService {
	String findLoggedInUsername();

    void autoLogin(String username, String password);
}
