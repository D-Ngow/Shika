package com.web.Service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.DAO.usersDAO;
import com.web.Entity.Users;

@Service
public class UserService{

	@Autowired
	private usersDAO userDao;

	public Users findById(int id) {

		Optional<Users> user = userDao.findById(id);

		if(user.isEmpty()) {
			return null;
		}

		return user.get();
	}

	public void EditProfile(Users user) {
		userDao.save(user);
	}
	
	public Users findByEmail(String email) {
		Users user = userDao.findByEmail(email);
		return user;
	}

}