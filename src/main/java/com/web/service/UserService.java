package com.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.web.DAO.UsersDAO;
import com.web.Entity.Users;
import com.web.security.CustomerUserDetails;

@Service
public class UserService implements UserDetailsService{

	@Autowired
	private UsersDAO userDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		
		Users user = userDao.findByEmail(username);
		if(user == null)
		{
			throw new UsernameNotFoundException("Email not found: " +username);
		}
		
		return new CustomerUserDetails(user);
	}

}
