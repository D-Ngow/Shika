package com.web.Security;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.web.DAO.usersDAO;
import com.web.Entity.Users;
import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class AccountDetail implements UserDetailsService {
	@Autowired
	usersDAO userDAO;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Users user1 = userDAO.findByEmail(username);
		if(!user1.getEmail().isEmpty()) {
			List<GrantedAuthority> grandlist  = new ArrayList<GrantedAuthority>();
			if(user1.getRole()) {
				GrantedAuthority authority = new SimpleGrantedAuthority("User");
				grandlist.add(authority);
			}else {
				GrantedAuthority authority = new SimpleGrantedAuthority("Admin");
				grandlist.add(authority);
			}
			
			UserDetails userdetail = new User(user1.getEmail(), user1.getPassword(), grandlist);
			return userdetail;
		}else {
			new UsernameNotFoundException("user not found");
		}
		return null;
		
	}

}