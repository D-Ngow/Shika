package com.web.security;

import java.util.Collection;
import java.util.Collections;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.web.Entity.Users;

import lombok.AllArgsConstructor;

@AllArgsConstructor
public class CustomerUserDetails implements UserDetails {

	Users user;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		
		if(user.isRole())
		{
			return Collections.singletonList(new SimpleGrantedAuthority("admin"));
		}

		return Collections.singletonList(new SimpleGrantedAuthority("user"));
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return user.getEmail();
	}

}
