package com.web.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.Entity.Users;

public interface usersDAO extends JpaRepository<Users, Integer>{
	
	Users findByEmail(String email);
}
