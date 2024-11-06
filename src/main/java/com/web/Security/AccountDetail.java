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


@Service
public class AccountDetail implements UserDetailsService {
	@Autowired
	usersDAO userDao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Users user = userDao.findByEmail(username);
		if(!user.getName().isEmpty()) {
			if(user.getRole()) {
				List<GrantedAuthority> grandlist = new ArrayList<GrantedAuthority>();
				GrantedAuthority grand = new SimpleGrantedAuthority("Admin");
				grandlist.add(grand);
				UserDetails userDetails = new User(user.getName(), user.getPassword(), grandlist);
				return userDetails;
			}else {
				List<GrantedAuthority> grandlist = new ArrayList<GrantedAuthority>();
				GrantedAuthority grand = new SimpleGrantedAuthority("User");
				grandlist.add(grand);
				UserDetails userDetails = new User(user.getName(), user.getPassword(), grandlist);
				return userDetails;
			}
		}else {
			new UsernameNotFoundException("Username not found");
		}
		return null;
	}
	
}