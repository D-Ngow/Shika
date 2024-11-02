package com.web.Service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.web.DAO.usersDAO;
import com.web.Entity.Users;
import com.web.Security.AccountDetail;

@Service
public class UserService implements UserDetailsService{

	@Autowired
	private usersDAO userDao;

	public Users findById(int id) {

		Optional<Users> user = userDao.findById(id);

		if(user.isEmpty()) {
			return null;
		}

		return user.get();
	}

	public Users EditProfile(Users user) {

		Users savedUser = findById(user.getUserId());

		savedUser.setName(user.getName());
		savedUser.setBirthday(user.getBirthday());
		savedUser.setEmail(user.getEmail());
		savedUser.setPhoneNumber(user.getPhoneNumber());
		savedUser.setGender(user.getGender());
		savedUser.setPassword(user.getPassword());
		savedUser.setRole(user.getRole());
		savedUser.setShippingAddresses(user.getShippingAddresses());

		return savedUser;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		Users user = userDao.findByEmail(username);
		if(user == null)
		{
			throw new UsernameNotFoundException("Email not found: " +username);
		}

		return new AccountDetail(user);
	}

}