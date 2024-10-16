package com.web.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.Entity.users;
import java.util.List;


public interface usersDAO extends JpaRepository<users, Integer>{

	users findByEmail(String email);
	
}
