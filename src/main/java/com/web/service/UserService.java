package com.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.web.DAO.usersDAO;
import com.web.Entity.users;
import com.web.security.CustomerUserDetails;

@Service
public class UserService implements UserDetailsService{

	@Autowired
	private usersDAO userDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		
		users user = userDao.findByEmail(username);
		if(user == null)
		{
			throw new UsernameNotFoundException("Email not found: " +username);
		}
		
		return new CustomerUserDetails(user);
	}

}
