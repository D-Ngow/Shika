package com.web.Security;

import java.util.Collection;
import java.util.Collections;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import com.web.Entity.Users;
import lombok.AllArgsConstructor;

@AllArgsConstructor
public class AccountDetail implements UserDetails {

	Users user;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {		
		if(user.getRole())
		{
			return Collections.singletonList(new SimpleGrantedAuthority("admin"));
		}
		return Collections.singletonList(new SimpleGrantedAuthority("user"));
	}

	@Override
	public String getPassword() {
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		return user.getEmail();
	}

	public Users getUser() {
        return user;
    }

}